import 'dart:convert';
import 'package:catering_flutter/core/services/auth_service.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final AuthService _authService;
  final http.Client _client;

  static String get baseUrl {
    return 'http://52.57.64.38';
  }

  static String get stripePubKey {
    return 'pk_test_51RpVMYJtourcXV011H2zSESBpx0aPvgECcwnpH6iJnuOk6MeCKCpuzpkyFsoaaiPQWc117CIwMVXz2GnVZUWGzBX00Es7TkDMx';
  }

  /// Static helper to check QueryResult and throw ApiException if there's an error
  static void check(QueryResult result) {
    ApiException.check(result);
  }

  ApiService(this._authService, [http.Client? client])
    : _client = client ?? http.Client();

  /// Performs a GET request.
  /// If [authenticated] is true (default), injects the Bearer token.
  Future<http.Response> get(
    String endpoint, {
    bool authenticated = true,
  }) async {
    final headers = await _getHeaders(authenticated);
    final response = await _client.get(
      Uri.parse('$baseUrl$endpoint'),
      headers: headers,
    );
    return _handleResponse(response);
  }

  /// Performs a POST request.
  Future<http.Response> post(
    String endpoint, {
    Object? body,
    bool authenticated = true,
  }) async {
    final headers = await _getHeaders(authenticated);
    final response = await _client.post(
      Uri.parse('$baseUrl$endpoint'),
      headers: headers,
      body: body != null ? jsonEncode(body) : null,
    );
    return _handleResponse(response);
  }

  /// Performs a Multipart POST request (e.g., for file uploads).
  Future<http.Response> postMultipart(
    String endpoint,
    List<int> fileBytes,
    String filename, {
    String fileField = 'file',
    bool authenticated = true,
  }) async {
    final uri = Uri.parse('$baseUrl$endpoint');
    final request = http.MultipartRequest('POST', uri);

    if (authenticated) {
      final token = await _authService.getToken();
      if (token != null) {
        request.headers['Authorization'] = 'Bearer $token';
      }
    }

    request.files.add(
      http.MultipartFile.fromBytes(fileField, fileBytes, filename: filename),
    );

    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);
    return _handleResponse(response);
  }

  Future<Map<String, String>> _getHeaders(bool authenticated) async {
    final headers = {'Content-Type': 'application/json'};
    if (authenticated) {
      var token = await _authService.getToken();
      if (token != null) {
        if (await _authService.isTokenExpired()) {
          // Try to refresh the token before giving up
          final newToken = await _authService.refreshToken();
          if (newToken == null) {
            // Refresh failed, already logged out by refreshToken()
            throw ApiException('Session expired. Please log in again.');
          }
          token = newToken;
        }
        headers['Authorization'] = 'Bearer $token';
      }
    }
    return headers;
  }

  http.Response _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response;
    } else if (response.statusCode == 401) {
      _authService.logout(); // Auto-logout on 401
      throw ApiException('Unauthorized');
    } else {
      // Try to parse error message from body if possible
      String message = 'Request failed with status: ${response.statusCode}';
      try {
        final data = jsonDecode(response.body);
        if (data is Map && data.containsKey('message')) {
          message = data['message'];
        } else if (data is Map && data.containsKey('error')) {
          message = data['error'];
        }
      } catch (_) {}
      throw ApiException(message);
    }
  }
}

class ApiException implements Exception {
  final String message;

  ApiException(this.message);

  /// Static helper to check QueryResult and throw ApiException if there's an error
  static void check(QueryResult result) {
    if (result.hasException) {
      final exception = result.exception!;
      String errorMessage = 'An error occurred';

      // Extract error message from GraphQL errors
      if (exception.graphqlErrors.isNotEmpty) {
        errorMessage = exception.graphqlErrors.map((e) => e.message).join(', ');
      } else if (exception.linkException != null) {
        errorMessage = exception.linkException.toString();
      }

      throw ApiException(errorMessage);
    }
  }

  @override
  String toString() => message;
}
