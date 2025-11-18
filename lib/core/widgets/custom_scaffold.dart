import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:catering_flutter/core/app_routes.dart';
import 'package:catering_flutter/features/authentication/services/auth_service.dart';
import 'package:catering_flutter/features/customer/services/cart_service.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    required this.child,
    this.title,
    this.bottom,
    super.key,
  });

  final Widget child;
  final String? title;
  final PreferredSizeWidget? bottom; // New parameter

  @override
  Widget build(BuildContext innerContext) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? GoRouterState.of(innerContext).uri.path),
        leading: Builder(
          builder: (BuildContext innerContext) {
            return innerContext.canPop()
                ? IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => innerContext.pop(),
                  )
                : IconButton(
                    icon: const Icon(Icons.home),
                    onPressed: () => innerContext.go('/'),
                  );
          },
        ),
        actions: [
          Consumer<AuthService>(
            builder: (context, authService, child) {
              if (authService.isAuthenticated) {
                return Row(
                  children: [
                    Consumer<CartService>(
                      builder: (context, cartService, child) {
                        int totalQuantity = cartService.totalQuantity;
                        return Stack(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.shopping_cart),
                              onPressed: () {
                                context.push(AppRoutes.cart);
                              },
                            ),
                            if (totalQuantity > 0)
                              Positioned(
                                right: 5,
                                top: 5,
                                child: Container(
                                  padding: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  constraints: const BoxConstraints(
                                    minWidth: 16,
                                    minHeight: 16,
                                  ),
                                  child: Text(
                                    '$totalQuantity',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                          ],
                        );
                      },
                    ),
                    TextButton(
                      onPressed: () {
                        authService.logout();
                        context.go('/login');
                      },
                      child: Text(
                        'Logout',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return TextButton(
                  onPressed: () => context.go('/login'),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                );
              }
            },
          ),
        ],
        bottom: bottom, // Use the new bottom parameter
      ),
      body: child,
    );
  }
}
