import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/core/services/auth_service.dart';
import 'package:catering_flutter/core/app_router.dart';
import 'package:catering_flutter/features/order/services/cart_service.dart';
import 'package:catering_flutter/core/providers/language_provider.dart';
import 'package:catering_flutter/l10n/app_localizations.dart';

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
          Consumer<LanguageProvider>(
            builder: (context, languageProvider, child) {
              return PopupMenuButton<String>(
                icon: const Icon(Icons.language),
                tooltip: AppLocalizations.of(context)!.selectLanguage,
                onSelected: (String code) {
                  languageProvider.changeLocale(code);
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: 'en',
                    child: Text('English'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'pl',
                    child: Text('Polski'),
                  ),
                ],
              );
            },
          ),
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

            PopupMenuButton<String>(
              icon: Icon(Icons.person),
              onSelected: (value) {
                if (value == 'profile') {
                  innerContext.push(AppRoutes.profile);
                } else if (value == 'logout') {
                  authService.logout();
                  innerContext.go(AppRoutes.login);
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                if (authService.email != null)
                  PopupMenuItem<String>(
                    enabled: false,
                    child: Text(
                      authService.email!,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ),
                if (authService.email != null) const PopupMenuDivider(),
                PopupMenuItem<String>(
                  value: 'profile',
                  child: Text(AppLocalizations.of(context)!.profile),
                ),
                PopupMenuItem<String>(
                  value: 'logout',
                  child: Text(AppLocalizations.of(context)!.logout),
                ),
              ],
            ),
          ] else
            TextButton(
              onPressed: () => innerContext.go(AppRoutes.login),
              child: Text(
                AppLocalizations.of(innerContext)!.login,
                style: Theme.of(
                  innerContext,
                ).textTheme.labelLarge?.copyWith(color: Colors.white),
              ),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
