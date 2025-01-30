import 'package:catering_app/Pages/admin_meal_plans_page.dart';
import 'package:flutter/material.dart';
import 'package:catering_app/Classes/authorization.dart';

import 'Classes/app_theme.dart';
import 'Classes/role_manager.dart';
import 'Pages/home_page.dart';
import 'Pages/login_page.dart';
import 'Pages/make_order.dart';
import 'Pages/orders_page.dart';
import 'Pages/register_page.dart';
import 'Pages/details_page.dart';
import 'Pages/admin_user_page.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  List<String> roles = await Authorization.getUserRoles();
  RoleManager().setRoles(roles);

  final initialRoute = RoleManager().isUser ? '/home' : '/login';

  runApp(MyApp(initialRoute: initialRoute));
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catering App',
      home: const HomePage(),
      initialRoute: initialRoute,
      onGenerateRoute: _generateRoute,
      scaffoldMessengerKey: scaffoldMessengerKey,
      navigatorKey: navigatorKey,
      theme: AppTheme.lightTheme,
    );
  }

  Route<dynamic> _generateRoute(RouteSettings settings) {
    final Uri uri = Uri.parse(settings.name ?? '');

    switch (uri.path) {
      case '/orders':
        return _buildMaterialPageRoute(const OrdersPage());
      case '/details':
        return _buildMaterialPageRoute(const DetailsPage());
      case '/login':
        return _buildMaterialPageRoute(const LoginPage());
      case '/home':
        return _buildMaterialPageRoute(const HomePage());
      case '/register':
        return _buildMaterialPageRoute(const RegisterPage());
      case '/order':
        return _buildMaterialPageRoute(const MakeOrder());
      case '/admin/users':
        return _buildMaterialPageRoute(const AdminUserPage());
      case '/admin/meal_plans':
        return _buildMaterialPageRoute(const AdminMealPlansPage());
    }

    if (uri.pathSegments.length == 3 && uri.pathSegments[0] == 'admin') {
      final id = _getIdFromUri(uri);
      if (id != null) {
        switch (uri.pathSegments[2]) {
          case 'orders':
            return _buildMaterialPageRoute(OrdersPage(userId: id));
          case 'details':
            return _buildMaterialPageRoute(DetailsPage(userId: id));
        }
      }
    }

    return _buildMaterialPageRoute(const HomePage());
  }

  MaterialPageRoute _buildMaterialPageRoute(Widget page) {
    return MaterialPageRoute(builder: (context) => page);
  }

  int? _getIdFromUri(Uri uri) {
    return int.tryParse(uri.pathSegments[1]);
  }
}
