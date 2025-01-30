import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:catering_app/main.dart';
import 'package:catering_app/Classes/role_manager.dart';
import 'package:catering_app/Classes/api_config.dart';
import 'package:catering_app/Classes/notification_bar.dart';

class Authorization {
  static const _storage = FlutterSecureStorage();
  static const _keyToken = 'token';
  static const _keyRefreshToken = 'refresh_token';
  static const _keyRefreshTokenExpiration = 'refresh_token_expiration';

  static Future<void> login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      NotificationBar().show('Please fill out all fields', Colors.yellow);
      return;
    }

    //Request
    try {
      final response = await http.post(
        ApiConfig.getLoginUrl(),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final token = data['token'];
        final refreshToken = data['refresh_token'];
        final refreshTokenExpiration = data['refresh_token_expiration'];

        await Authorization.saveToken(_keyToken, token);
        await Authorization.saveToken(_keyRefreshToken, refreshToken);
        await Authorization.saveRefreshTokenExpiration(refreshTokenExpiration);

        RoleManager().setRoles(await getUserRoles());

        NotificationBar().show('Logged in!', Colors.green);
        navigatorKey.currentState?.pushReplacementNamed('/home');
      } else {
        final error =
            '${response.statusCode.toString()} - ${jsonDecode(response.body)['message'] ?? 'Unknown error'}';
        NotificationBar()
            .show('Login or password is incorrect', Colors.red, error);
      }
    } catch (error) {
      NotificationBar().show('Failed to log in', Colors.red, error.toString());
    }
  }

  static Future<void> logout([bool makeRequest = true]) async {
    if (makeRequest) {
      //Request
      try {
        String? refreshToken = await getToken(_keyRefreshToken);

        final response = await http.post(
          ApiConfig.getLogoutUrl(),
          body: jsonEncode({
            'refresh_token': refreshToken,
          }),
          headers: {'Content-Type': 'application/json'},
        );

        if (response.statusCode == 200) {
          await Authorization.deleteToken(_keyToken);
          await Authorization.deleteToken(_keyRefreshToken);
          await Authorization.deleteToken(_keyRefreshTokenExpiration);

          RoleManager().setRoles([]);

          NotificationBar().show('Logged out', Colors.green);
          navigatorKey.currentState?.pushReplacementNamed('/login');
        } else {
          final error =
              '${response.statusCode.toString()} - ${jsonDecode(response.body)['message'] ?? 'Unknown error'}';
          NotificationBar()
              .show('Network error. Please try again', Colors.red, error);
        }
      } catch (error) {
        NotificationBar().show('Failed to log out. Please try again',
            Colors.red, error.toString());
      }
    } else {
      await Authorization.deleteToken(_keyToken);
      await Authorization.deleteToken(_keyRefreshToken);
      await Authorization.deleteToken(_keyRefreshTokenExpiration);

      RoleManager().setRoles([]);
    }
  }

  static Future<List<String>> getUserRoles() async {
    String? token = await getValidToken();

    if (token == null || JwtDecoder.isExpired(token)) {
      return [];
    }

    try {
      Map<String, dynamic> decodedToken = JwtDecoder.decode(token);

      if (decodedToken.containsKey('roles') &&
          decodedToken['roles'] is List<dynamic>) {
        List<String> userRoles = List<String>.from(decodedToken['roles']);
        return userRoles;
      } else {
        return [];
      }
    } catch (error) {
      debugPrint("Error decoding token: $error");
      return [];
    }
  }

  static Future<void> saveToken(String key, String token) async {
    await _storage.write(key: key, value: token);
  }

  static Future<void> saveRefreshTokenExpiration(int expirationTime) async {
    await _storage.write(
        key: _keyRefreshTokenExpiration, value: expirationTime.toString());
  }

  static Future<int?> getRefreshTokenExpiration() async {
    return await _storage
        .read(key: _keyRefreshTokenExpiration)
        .then((value) => int.tryParse(value ?? '0'));
  }

  static Future<String?> getToken(String key) async {
    return await _storage.read(key: key);
  }

  static Future<void> deleteToken(String key) async {
    await _storage.delete(key: key);
  }

  // Refresh the JWT token using the refresh token
  static Future<String?> refreshJwtToken() async {
    String? refreshToken = await getToken(_keyRefreshToken);
    int? expirationTime = await getRefreshTokenExpiration();

    if (refreshToken != null && expirationTime != null) {
      // Check if the refresh token is expired
      if (DateTime.now().millisecondsSinceEpoch ~/ 1000 > expirationTime) {
        NotificationBar()
            .show('Session expired. Please log in again', Colors.yellow);
      } else {
        try {
          final response = await http.post(
            ApiConfig.getRefreshTokenUrl(),
            headers: {
              'Content-Type': 'application/json',
            },
            body: jsonEncode({
              'refresh_token': refreshToken,
            }),
          );

          if (response.statusCode == 200) {
            final data = jsonDecode(response.body);
            final newToken = data['token'];
            final newRefreshToken = data['refresh_token'];
            final newRefreshTokenExpiration = data['refresh_token_expiration'];

            // Save the new tokens and expiration
            await saveToken(_keyToken, newToken);
            await saveToken(_keyRefreshToken, newRefreshToken);
            await saveRefreshTokenExpiration(newRefreshTokenExpiration);

            return newToken;
          } else {
            final error =
                '${response.statusCode.toString()} - ${jsonDecode(response.body)['message'] ?? 'Unknown error'}';
            NotificationBar()
                .show('Network error. Please log in again', Colors.red, error);
          }
        } catch (error) {
          NotificationBar().show(
              'Failed to restore session. Please log in again',
              Colors.red,
              error.toString());
        }
      }
    }

    await logout(false);
    navigatorKey.currentState?.pushReplacementNamed('/login');
    return null;
  }

  // Retrieve a valid token, refreshing it if necessary
  static Future<String?> getValidToken() async {
    String? token = await getToken(_keyToken);

    if (token == null || JwtDecoder.isExpired(token)) {
      token = await refreshJwtToken();
    }

    return token;
  }
}
