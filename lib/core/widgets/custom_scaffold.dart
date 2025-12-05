import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/core/auth_service.dart';
import 'package:catering_flutter/core/app_routes.dart';
import 'package:catering_flutter/features/order/services/cart_service.dart';

class CustomScaffold extends StatelessWidget {
  final Widget child;
  final String? title;
  final PreferredSizeWidget? bottom; // New parameter
  final Widget? floatingActionButton;

  const CustomScaffold({
    required this.child,
    this.title,
    this.bottom,
    this.floatingActionButton,
    super.key,
  });

  @override
  Widget build(BuildContext innerContext) {
    final authService = innerContext.watch<AuthService>();

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [Text(title ?? GoRouterState.of(innerContext).uri.path)],
        ),
        leading: Builder(
          builder: (BuildContext innerContext) {
            return innerContext.canPop()
                ? IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => innerContext.pop(),
                  )
                : IconButton(
                    icon: const Icon(Icons.home),
                    onPressed: () => innerContext.go(AppRoutes.home),
                  );
          },
        ),
        bottom: bottom, // Use the new bottom parameter
        actions: [
          if (authService.isAuthenticated) ...[
            if (authService.hasRole("ROLE_CUSTOMER"))
              Consumer<CartService>(
                builder: (context, cartService, child) {
                  return Badge(
                    label: Text('${cartService.itemCount}'),
                    isLabelVisible: cartService.itemCount > 0,
                    child: IconButton(
                      icon: const Icon(Icons.shopping_cart),
                      onPressed: () => innerContext.push(AppRoutes.cart),
                    ),
                  );
                },
              ),
            if (authService.isAuthenticated && authService.email != null)
              Text(
                authService.email!,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
            PopupMenuButton<String>(
              icon: Icon(
                authService.hasRole("ROLE_ADMIN")
                    ? Icons.admin_panel_settings
                    : authService.hasRole("ROLE_RESTAURANT")
                    ? Icons.storefront
                    : authService.hasRole("ROLE_DRIVER")
                    ? Icons.drive_eta
                    : Icons.person,
              ),
              onSelected: (value) {
                if (value == 'dashboard') {
                  // Navigate to appropriate dashboard based on role
                  if (authService.hasRole("ROLE_ADMIN")) {
                    innerContext.push(AppRoutes.adminDashboard);
                  } else if (authService.hasRole("ROLE_RESTAURANT")) {
                    innerContext.push(AppRoutes.restaurantDashboard);
                  } else if (authService.hasRole("ROLE_DRIVER")) {
                    innerContext.push(AppRoutes.driverDashboard);
                  } else if (authService.hasRole("ROLE_CUSTOMER")) {
                    innerContext.push(AppRoutes.profile);
                  }
                } else if (value == 'logout') {
                  authService.logout();
                  innerContext.go(AppRoutes.login);
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'dashboard',
                  child: Text('Dashboard'),
                ),
                const PopupMenuItem<String>(
                  value: 'logout',
                  child: Text('Logout'),
                ),
              ],
            ),
          ] else
            TextButton(
              onPressed: () => innerContext.go(AppRoutes.login),
              child: const Text('Login', style: TextStyle(color: Colors.white)),
            ),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: child,
        ),
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}
