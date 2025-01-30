import 'dart:convert';
import 'package:catering_app/Classes/authorization.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:catering_app/main.dart';
import 'package:catering_app/Classes/notification_bar.dart';
import 'package:catering_app/Classes/api_config.dart';
import 'package:catering_app/Classes/catering_app_bar.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordRepeatController = TextEditingController();

  bool isLoading = false;

  Future<void> register() async {
    // Validation
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final passwordRepeat = _passwordRepeatController.text.trim();

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
      setState(() {
        isLoading = true;
      });

      final response = await http.post(
        ApiConfig.getRegisterUrl(),
        body: jsonEncode({
          'email': _emailController.text,
          'password': _passwordController.text,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      setState(() {
        _passwordController.clear();
        _passwordRepeatController.clear();
      });

      if (response.statusCode == 204) {
        NotificationBar().show('Registration successful!', Colors.green);
        await Authorization.login(email, password);
      } else {
        final error =
            '${response.statusCode.toString()} - ${jsonDecode(response.body)['message'] ?? 'Unknown error'}';
        NotificationBar().show('Registration failed', Colors.red, error);
      }
    } catch (error) {
      NotificationBar()
          .show('Registration failed', Colors.red, error.toString());
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CateringAppBar(title: 'Register'),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 600,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'Password'),
                ),
                TextFormField(
                  controller: _passwordRepeatController,
                  obscureText: true,
                  decoration:
                      const InputDecoration(labelText: 'Repeat Password'),
                ),
                ElevatedButton(
                  onPressed: isLoading ? null : register,
                  child: isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text('Register'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
