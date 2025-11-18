import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/core/app_routes.dart';
import 'package:catering_flutter/features/authentication/services/auth_service.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart'; // Import CustomScaffold

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = context.watch<AuthService>();
    final bool isAuthenticated = authService.isAuthenticated;

    return CustomScaffold(
      title: 'Home',
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to the Catering App!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.push(AppRoutes.restaurants);
              },
              child: const Text('Browse Restaurants and Meal Plans'),
            ),
            if (isAuthenticated) ...[
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  context.push(AppRoutes.orders);
                },
                child: const Text('View My Orders'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  context.push(AppRoutes.profile);
                },
                child: const Text('My Profile'),
              ),
              if (authService.user != null &&
                  authService.user!.roles.contains('ROLE_ADMIN'))
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      context.push(AppRoutes.createRestaurant);
                    },
                    child: const Text('Create Restaurant'),
                  ),
                ),
            ],
          ],
        ),
      ),
    );
  }
}
