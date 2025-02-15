import 'package:catering_app/Classes/user_manager.dart';
import 'package:flutter/material.dart';
import 'package:catering_app/Classes/app_theme.dart';
import 'package:catering_app/Classes/catering_app_bar.dart';
import 'package:catering_app/Pages/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!UserManager().hasRole('ROLE_USER')) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CateringAppBar(title: 'Home', showBackButton: false),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppTheme.primaryColor.withValues(alpha: 0.8),
              AppTheme.secondaryColor.withValues(alpha: 0.8),
            ],
          ),
        ),
        child: const Center(
          child: Text('Welcome to the Home Page!',
              style: TextStyle(color: Colors.white, fontSize: 32)),
        ),
      ),
    );
  }
}
