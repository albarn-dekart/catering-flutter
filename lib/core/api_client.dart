import 'dart:convert';
import 'package:catering_flutter/core/api_exception.dart';
import 'package:catering_flutter/core/auth_service.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  final AuthService _authService;
  final http.Client _client;

  static String get baseUrl {
    return 'https://localhost:8000';
  }

  static String get stripePubKey {
    return 'pk_test_51RpVMYJtourcXV011H2zSESBpx0aPvgECcwnpH6iJnuOk6MeCKCpuzpkyFsoaaiPQWc117CIwMVXz2GnVZUWGzBX00Es7TkDMx';
  }

  ApiClient(this._authService, [http.Client? client])
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
      final token = await _authService.getToken();
      if (token != null) {
        if (await _authService.isTokenExpired()) {
          await _authService.logout();
          throw ApiException('Session expired. Please log in again.');
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
