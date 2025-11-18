import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:catering_flutter/core/token_storage_service.dart';

class ApiService {
  final String baseUrl;
  final TokenStorageService _tokenStorage;

  ApiService({required this.baseUrl, required TokenStorageService tokenStorage})
    : _tokenStorage = tokenStorage;

  Future<Map<String, String>> _getHeaders({
    Map<String, String>? customHeaders,
  }) async {
    final token = await _tokenStorage.getToken();
    final Map<String, String> headers = {'Accept': 'application/ld+json'};

    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }

    if (customHeaders != null) {
      headers.addAll(customHeaders);
    }

    return headers;
  }

  // Generic helper function to deserialize API Platform collections
  List<T> deserializeCollection<T>(
    dynamic responseBody,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    if (responseBody is Map && responseBody.containsKey('member')) {
      final List<dynamic> itemsJson = responseBody['member'];
      return itemsJson
          .map((json) => fromJson(json as Map<String, dynamic>))
          .toList();
    }
    throw Exception('Invalid collection format or missing member');
  }

  // Centralized error handling
  dynamic _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      if (response.body.isEmpty) {
        return null;
      }
      return jsonDecode(response.body);
    } else if (response.statusCode == 401) {
      throw Exception('Unauthorized');
    } else {
      throw Exception(
        'Failed with status code: ${response.statusCode}, body: ${response.body}',
      );
    }
  }

  Future<List<T>> getCollection<T>(
    String endpoint, {
    Map<String, String>? queryParams,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    var uri = Uri.parse('$baseUrl/$endpoint');
    if (queryParams != null) {
      uri = uri.replace(queryParameters: queryParams);
    }

    final response = await http.get(uri, headers: await _getHeaders());

    final json = _handleResponse(response);
    return deserializeCollection<T>(json, fromJson);
  }

  Future<T> get<T>(
    String endpoint, {
    Map<String, String>? queryParams,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    var uri = Uri.parse('$baseUrl/$endpoint');
    if (queryParams != null) {
      uri = uri.replace(queryParameters: queryParams);
    }

    final response = await http.get(uri, headers: await _getHeaders());

    final json = _handleResponse(response);
    return fromJson(json);
  }

  Future<T> post<T>(
    String endpoint,
    Map<String, dynamic> data, {
    String? token,
  }) async {
    final headers = await _getHeaders(
      customHeaders: {'Content-Type': 'application/ld+json'},
    );
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
    final body = jsonEncode(data);

    final response = await http.post(
      Uri.parse('$baseUrl/$endpoint'),
      headers: headers,
      body: body,
    );

    return _handleResponse(response) as T;
  }

  Future<T> put<T>(String endpoint, Map<String, dynamic> data) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$endpoint'),
      headers: await _getHeaders(
        customHeaders: {'Content-Type': 'application/json'},
      ),
      body: jsonEncode(data),
    );

    return _handleResponse(response) as T;
  }

  Future<T> patch<T>(String endpoint, Map<String, dynamic> data) async {
    final response = await http.patch(
      Uri.parse('$baseUrl/$endpoint'),
      headers: await _getHeaders(
        customHeaders: {'Content-Type': 'application/merge-patch+json'},
      ),
      body: jsonEncode(data),
    );

    return _handleResponse(response) as T;
  }

  Future<T> postMultipart<T>(
    String endpoint,
    Map<String, http.MultipartFile> files,
  ) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('$baseUrl/$endpoint'),
    );
    request.headers.addAll(await _getHeaders());

    for (var entry in files.entries) {
      request.files.add(entry.value);
    }

    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);

    return _handleResponse(response) as T;
  }

  Future<void> delete(String endpoint) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/$endpoint'),
      headers: await _getHeaders(),
    );

    _handleResponse(response); // Just call to check for errors
  }
}
