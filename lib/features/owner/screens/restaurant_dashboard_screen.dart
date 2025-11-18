import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/core/app_routes.dart';
import 'package:catering_flutter/features/authentication/services/auth_service.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart'; // Import CustomScaffold

class RestaurantDashboardScreen extends StatelessWidget {
  const RestaurantDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = context.watch<AuthService>();
    final bool isAuthenticated = authService.isAuthenticated;

    return CustomScaffold(
      title: 'Restaurant Dashboard',
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome, Restaurant Owner!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            if (isAuthenticated &&
                authService.user != null &&
                authService.user!.roles.contains('ROLE_RESTAURANT'))
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: ElevatedButton(
                  onPressed: () {
                    context.push(AppRoutes.myRestaurant);
                  },
                  child: const Text('My Restaurant'),
                ),
              ),
            // Add other restaurant owner specific functionalities here
          ],
        ),
      ),
    );
  }
}
