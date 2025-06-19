import 'package:catering_app/Classes/authorization.dart';
import 'package:catering_app/Classes/user_manager.dart';
import 'package:flutter/material.dart';

import 'Classes/app_theme.dart';
import 'Pages/home_page.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Authorization.init();
  UserManager().updateUserFromToken(await Authorization.getValidToken());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catering App',
      home: HomePage(),
      scaffoldMessengerKey: scaffoldMessengerKey,
      navigatorKey: navigatorKey,
      theme: AppTheme.lightTheme,
    );
  }
}
