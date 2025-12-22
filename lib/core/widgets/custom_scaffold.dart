import 'package:catering_flutter/core/utils/role_helper.dart';
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
    // Only try to get path from GoRouter if we don't have a title
    // GoRouterState.of() can hang when using Navigator.push, so we avoid it when possible
    String location = '';
    try {
      location = GoRouterState.of(innerContext).matchedLocation;
    } catch (_) {
      location = ModalRoute.of(innerContext)?.settings.name ?? '';
    }

    String displayTitle = title ?? location;

    return Scaffold(
      backgroundColor: Theme.of(innerContext).colorScheme.surface,
      appBar: AppBar(
        title: Text(
          displayTitle,
          style: Theme.of(innerContext).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5,
          ),
        ),
        leading: Builder(
          builder: (BuildContext ctx) {
            // Check if we're at a root route by path instead of display title
            final isRoot = [
              AppRoutes.home,
              AppRoutes.adminDashboard,
              AppRoutes.restaurantDashboard,
              AppRoutes.driverDashboard,
            ].contains(location);

            // If we are at home or a root screen, don't show any leading icon
            if (isRoot) {
              return const SizedBox.shrink();
            }

            // Priority 1: go_router pop (declarative back)
            if (ctx.canPop()) {
              return IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
                onPressed: () {
                  try {
                    ctx.pop();
                  } catch (_) {
                    ctx.go(AppRoutes.home);
                  }
                },
              );
            }

            // Priority 2: native pop (useful for dialogs/bottom sheets)
            if (Navigator.of(ctx).canPop()) {
              return IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
                onPressed: () => Navigator.of(ctx).maybePop(),
              );
            }

            // Fallback: Home button if no history is available
            return IconButton(
              icon: const Icon(Icons.home_rounded),
              onPressed: () => ctx.go(AppRoutes.home),
            );
          },
        ),
        bottom: bottom,
        actions: [
          Consumer<LanguageProvider>(
            builder: (context, languageProvider, child) {
              return PopupMenuButton<String>(
                icon: const Icon(Icons.translate_rounded),
                tooltip: AppLocalizations.of(context)!.selectLanguage,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
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
          Consumer<AuthService>(
            builder: (context, authService, child) {
              if (authService.isAuthenticated) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (authService.hasRole("ROLE_CUSTOMER"))
                      Consumer<CartService>(
                        builder: (context, cartService, child) {
                          return Badge(
                            label: Text('${cartService.itemCount}'),
                            isLabelVisible: cartService.itemCount > 0,
                            backgroundColor: Theme.of(
                              context,
                            ).colorScheme.primary,
                            textColor: Theme.of(context).colorScheme.onPrimary,
                            child: IconButton(
                              icon: const Icon(Icons.shopping_bag_outlined),
                              onPressed: () => context.push(AppRoutes.cart),
                            ),
                          );
                        },
                      ),
                    PopupMenuButton<String>(
                      icon: const Icon(Icons.account_circle_outlined),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      onSelected: (value) {
                        if (value == 'profile') {
                          context.push(AppRoutes.profile);
                        } else if (value == 'logout') {
                          authService.logout();
                          context.go(AppRoutes.login);
                        }
                      },
                      itemBuilder: (BuildContext ctx) =>
                          <PopupMenuEntry<String>>[
                            if (authService.email != null)
                              PopupMenuItem<String>(
                                enabled: false,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      authService.email!,
                                      style: Theme.of(ctx).textTheme.bodyMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(
                                              ctx,
                                            ).colorScheme.onSurface,
                                          ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      RoleHelper.getLocalizedRoles(
                                        ctx,
                                        authService.roles,
                                      ),
                                      style: Theme.of(ctx).textTheme.labelSmall
                                          ?.copyWith(
                                            color: Theme.of(
                                              ctx,
                                            ).colorScheme.primary,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            if (authService.email != null)
                              const PopupMenuDivider(),
                            PopupMenuItem<String>(
                              value: 'profile',
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.person_outline_rounded,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 12),
                                  Text(AppLocalizations.of(ctx)!.profile),
                                ],
                              ),
                            ),
                            PopupMenuItem<String>(
                              value: 'logout',
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.logout_rounded,
                                    size: 20,
                                    color: Theme.of(ctx).colorScheme.error,
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    AppLocalizations.of(ctx)!.logout,
                                    style: Theme.of(ctx).textTheme.bodyLarge
                                        ?.copyWith(
                                          color: Theme.of(
                                            ctx,
                                          ).colorScheme.error,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                    ),
                  ],
                );
              } else {
                final isLoginPage = location == AppRoutes.login;
                if (isLoginPage) return const SizedBox.shrink();

                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: TextButton.icon(
                    onPressed: () => context.go(AppRoutes.login),
                    icon: const Icon(Icons.login_rounded),
                    label: Text(
                      AppLocalizations.of(context)!.login,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth > 1200
              ? 1200.0
              : constraints.maxWidth;
          return Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: width,
              height: constraints.maxHeight,
              child: child,
            ),
          );
        },
      ),
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
