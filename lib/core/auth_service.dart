import 'dart:convert';
import 'dart:developer';
import 'package:catering_flutter/core/api_client.dart';
import 'package:catering_flutter/core/token_storage_service.dart';
import 'package:catering_flutter/core/utils/iri_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthService extends ChangeNotifier {
  final TokenStorageService _tokenStorage;

  bool _isAuthenticated = false;
  List<String> _roles = [];
  String? _userIri;
  String? _email;
  bool _isLoading = true;

  bool get isAuthenticated => _isAuthenticated;
  String? get userIri => _userIri;
  String? get email => _email;
  bool get isLoading => _isLoading;

  AuthService(this._tokenStorage) {
    _checkAuthStatus();
  }

  Future<void> _checkAuthStatus() async {
    _isLoading = true;
    final token = await _tokenStorage.getToken();
    if (token != null) {
      final isExpired = await isTokenExpired();

      if (isExpired) {
        await logout();
        _isLoading = false;
        notifyListeners();
        return;
      }

      _isAuthenticated = true;
      final roles = await _tokenStorage.getRoles();
      _roles = roles ?? [];
      _userIri = await _tokenStorage.getUserIri();
      _email = await _tokenStorage.getEmail();
    } else {
      _isAuthenticated = false;
      _roles = [];
      _userIri = null;
      _email = null;
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<String?> getToken() => _tokenStorage.getToken();

  Future<String?> getUserIriFromStorage() => _tokenStorage.getUserIri();

  bool hasRole(String role) => _roles.contains(role);

  Future<void> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('${ApiClient.baseUrl}/api/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final token = data['token'];
      if (token != null) {
        await _tokenStorage.saveToken(token);

        // Decode JWT token to extract roles, expiry, and user ID
        try {
          final decodedToken = JwtDecoder.decode(token);

          // Extract and save user ID
          if (decodedToken['id'] != null) {
            final userIri = IriHelper.buildIri(
              'users',
              decodedToken['id'].toString(),
            );
            await _tokenStorage.saveUserIri(userIri);
            _userIri = userIri;
          }

          // Extract and save email
          if (decodedToken['email'] != null) {
            final email = decodedToken['email'].toString();
            await _tokenStorage.saveEmail(email);
            _email = email;
          }

          // Extract roles from token
          if (decodedToken['roles'] != null) {
            final List<String> roles = List<String>.from(decodedToken['roles']);
            await _tokenStorage.saveRoles(roles);
            _roles = roles;
          } else {
            _roles = [];
          }

          // Extract and save token expiry time
          if (decodedToken['exp'] != null) {
            final int expirySeconds = decodedToken['exp'];
            final expiryDateTime = DateTime.fromMillisecondsSinceEpoch(
              expirySeconds * 1000,
            );
            await _tokenStorage.saveTokenExpiry(expiryDateTime);
          }
        } catch (e, stackTrace) {
          // If token decoding fails, log error but still authenticate
          log(
            'Error decoding JWT token',
            error: e,
            stackTrace: stackTrace,
            name: 'AuthService',
          );
          _roles = [];
        }

        _isAuthenticated = true;
        notifyListeners();
      } else {
        throw Exception('Login failed: no token received');
      }
    } else {
      throw Exception('Login failed: ${response.body}');
    }
  }

  Future<void> logout() async {
    await _tokenStorage.clearAll();
    _isAuthenticated = false;
    _roles = [];
    _userIri = null;
    _email = null;
    notifyListeners();
  }

  /// Checks if the current token is expired
  /// Returns true if token is expired or doesn't exist
  Future<bool> isTokenExpired() async {
    final token = await _tokenStorage.getToken();
    if (token == null) return true;

    try {
      // Check using jwt_decoder's isExpired method
      final bool isExpired = JwtDecoder.isExpired(token);
      return isExpired;
    } catch (e, stackTrace) {
      // If we can't decode the token, consider it expired
      log(
        'Error checking token expiry',
        error: e,
        stackTrace: stackTrace,
        name: 'AuthService',
      );
      return true;
    }
  }

  Future<void> register(String email, String password) async {
    final response = await http.post(
      Uri.parse('${ApiClient.baseUrl}/api/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 201) {
      await login(email, password);
    } else {
      throw Exception('Registration failed: ${response.body}');
    }
  }

  /// Changes the current user's password
  /// Throws an exception if the old password is incorrect or the request fails
  Future<void> changePassword(String oldPassword, String newPassword) async {
    final token = await _tokenStorage.getToken();
    if (token == null) {
      throw Exception('Not authenticated');
    }

    final response = await http.post(
      Uri.parse('${ApiClient.baseUrl}/api/change-password'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'oldPassword': oldPassword,
        'newPassword': newPassword,
      }),
    );

    if (response.statusCode == 200) {
      return;
    } else {
      final data = jsonDecode(response.body);
      throw Exception(data['error'] ?? 'Failed to change password');
    }
  }
}
