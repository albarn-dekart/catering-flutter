import 'dart:html';
import 'dart:convert';
import 'package:catering_app/Classes/user_manager.dart';
import 'package:catering_app/Pages/login_page.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:flutter/material.dart';
import 'package:catering_app/main.dart';
import 'package:catering_app/Classes/api_config.dart';
import 'package:catering_app/Classes/notification_bar.dart';
import 'package:catering_app/Pages/home_page.dart';

class Authorization {
  static const _keyToken = 'token';
  static const _keyRefreshToken = 'refresh_token';
  static const _keyRefreshTokenExpiration = 'refresh_token_expiration';

  static Future<void> register(String email, String password, String passwordRepeat) async {
    // Email validation
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    if (!emailRegex.hasMatch(email)) {
      NotificationBar()
          .show('Please enter a valid email address', Colors.yellow);
      return;
    }

    // Password validation
    if (password.length < 8 ||
        !RegExp(r'[A-Z]').hasMatch(password) || // Uppercase
        !RegExp(r'[0-9]').hasMatch(password) || // Digit
        !RegExp(r'[\W_]').hasMatch(password)) {
      // Special character
      NotificationBar().show(
        'Password must be at least 8 characters long and include at least one uppercase letter, one number, and one special character',
        Colors.yellow,
      );
      return;
    }

    // Check if passwords match
    if (password != passwordRepeat) {
      NotificationBar().show('The passwords don\'t match', Colors.yellow);
      return;
    }

    //Request
    try {
      final response = await http.post(
        ApiConfig.register(),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 204) {
        NotificationBar().show('Registration successful!', Colors.green);
        await Authorization.login(email, password);
      } else {
        final error =
            '${response.statusCode.toString()} - ${jsonDecode(response.body)['error'] ?? 'Unknown error'}';
        NotificationBar().show('Registration failed', Colors.red, error);
      }
    } catch (error) {
      NotificationBar()
          .show('Registration failed', Colors.red, error.toString());
    }
  }

  static Future<void> login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      NotificationBar().show('Please fill out all fields', Colors.yellow);
      return;
    }

    //Request
    try {
      final response = await http.post(
        ApiConfig.login(),
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

        UserManager().updateUserFromToken(token);

        await Authorization.saveToken(_keyToken, token);
        await Authorization.saveToken(_keyRefreshToken, refreshToken);
        await Authorization.saveRefreshTokenExpiration(refreshTokenExpiration);

        NotificationBar().show('Logged in!', Colors.green);
        navigatorKey.currentState?.pushReplacement(
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      } else {
        final error =
            '${response.statusCode.toString()} - ${jsonDecode(response.body)['error'] ?? 'Unknown error'}';
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
          ApiConfig.logout(),
          body: jsonEncode({
            'refresh_token': refreshToken,
          }),
          headers: {'Content-Type': 'application/json'},
        );

        if (response.statusCode == 200) {
          await Authorization.deleteToken(_keyToken);
          await Authorization.deleteToken(_keyRefreshToken);
          await Authorization.deleteToken(_keyRefreshTokenExpiration);

          UserManager().clearUser();

          NotificationBar().show('Logged out', Colors.green);
          navigatorKey.currentState?.pushReplacement(
              MaterialPageRoute(builder: (context) => LoginPage()));
        } else {
          final error =
              '${response.statusCode.toString()} - ${jsonDecode(response.body)['error'] ?? 'Unknown error'}';
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

      UserManager().clearUser();
    }
  }

  static Future<bool> hasRole(String role) async {
    String? token = await getValidToken();

    if (token == null || JwtDecoder.isExpired(token)) return false;

    try {
      Map<String, dynamic> decodedToken = JwtDecoder.decode(token);

      if (decodedToken.containsKey('roles') &&
          decodedToken['roles'] is List<dynamic>) {
        List<String> userRoles = List<String>.from(decodedToken['roles']);
        return userRoles.contains(role);
      }
    } catch (error) {
      debugPrint("Error decoding token: $error");
    }

    return false;
  }

  static Future<String?> username() async {
    String? token = await getValidToken();

    if (token == null || JwtDecoder.isExpired(token)) return null;

    try {
      Map<String, dynamic> decodedToken = JwtDecoder.decode(token);

      if (decodedToken.containsKey('username')) {
        return decodedToken['username'];
      }
    } catch (error) {
      debugPrint("Error decoding token: $error");
    }

    return null;
  }

  static Future<void> saveToken(String key, String token) async {
    window.localStorage[key] = token;
  }

  static Future<void> saveRefreshTokenExpiration(int expirationTime) async {
    window.localStorage[_keyRefreshTokenExpiration] = expirationTime.toString();
  }

  static Future<int?> getRefreshTokenExpiration() async {
    final expiration = window.localStorage[_keyRefreshTokenExpiration];
    return expiration != null ? int.tryParse(expiration) : null;
  }

  static Future<String?> getToken(String key) async {
    return window.localStorage[key];
  }

  static Future<void> deleteToken(String key) async {
    window.localStorage.remove(key);
  }

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
            ApiConfig.refreshToken(),
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
                '${response.statusCode.toString()} - ${jsonDecode(response.body)['error'] ?? 'Unknown error'}';
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
    navigatorKey.currentState
        ?.pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
    return null;
  }

  static Future<String?> getValidToken() async {
    String? token = await getToken(_keyToken);

    if (token == null || JwtDecoder.isExpired(token)) {
      token = await refreshJwtToken();
    }

    return token;
  }
}
