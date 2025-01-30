import 'package:flutter/material.dart';

import 'package:catering_app/Classes/catering_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CateringAppBar(title: 'Home'),
      body: Center(
        child: Text('Welcome to the Home Page!'),
      ),
    );
  }
}