import 'package:catering_flutter/core/utils/role_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/core/services/auth_service.dart';
import 'package:catering_flutter/core/app_router.dart';
import 'package:catering_flutter/features/order/services/cart_service.dart';
import 'package:catering_flutter/core/providers/language_provider.dart';
import 'package:catering_flutter/core/app_theme.dart';
import 'package:catering_flutter/core/widgets/logout_dialog.dart';
import 'package:catering_flutter/l10n/app_localizations.dart';

class CustomScaffold extends StatelessWidget {
  final Widget child;
  final String? title;
  final PreferredSizeWidget? bottom;
  final bool usePagePadding;

  const CustomScaffold({
    required this.child,
    this.title,
    this.bottom,
    this.usePagePadding = true,
    super.key,
  });

  @override
  Widget build(BuildContext innerContext) {
    // Only try to get path from ModalRoute to avoid GoRouterState deadlocks
    final String fullLocation =
        ModalRoute.of(innerContext)?.settings.name ?? '';
    final String cleanPath = fullLocation.split('?').first;
    final String displayTitle = title ?? cleanPath;

    final authService = Provider.of<AuthService>(innerContext, listen: false);
    final bool isAdmin = authService.hasRole('ROLE_ADMIN');
    final bool isRestaurant = authService.hasRole('ROLE_RESTAURANT');
    final bool isDriver = authService.hasRole('ROLE_DRIVER');

    bool isUserRoot = false;
    if (cleanPath == AppRoutes.home) {
      isUserRoot = true;
    } else if (cleanPath == AppRoutes.adminDashboard && isAdmin) {
      isUserRoot = true;
    } else if (cleanPath == AppRoutes.restaurantDashboard && isRestaurant) {
      isUserRoot = true;
    } else if (cleanPath == AppRoutes.driverDashboard && isDriver) {
      isUserRoot = true;
    }

    final canPopGoRouter = innerContext.canPop();
    final canPopNavigator = Navigator.of(innerContext).canPop();
    final canPop = canPopGoRouter || canPopNavigator;

    // Show leading if it's not the user's root OR if we have history to go back to
    bool shouldShowLeading = !isUserRoot || canPop;

    return Scaffold(
      backgroundColor: Theme.of(innerContext).colorScheme.surface,
      appBar: AppBar(
        titleSpacing: shouldShowLeading ? 0 : AppTheme.pagePaddingHorizontal,
        automaticallyImplyLeading: false,
        title: Text(
          displayTitle,
          style: Theme.of(innerContext).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5,
          ),
        ),
        leading: shouldShowLeading
            ? IconButton(
                icon: const Icon(Icons.arrow_back_ios_new),
                onPressed: () {
                  if (canPopGoRouter) {
                    try {
                      innerContext.pop();
                    } catch (_) {
                      innerContext.go(AppRoutes.home);
                    }
                  } else if (canPopNavigator) {
                    Navigator.of(innerContext).maybePop();
                  } else {
                    // Logical "Up" fallback (e.g., after a refresh)
                    // Go to the user's dashboard if they are in a sub-path of it
                    if (isAdmin && cleanPath.startsWith('/admin/')) {
                      innerContext.go(AppRoutes.adminDashboard);
                    } else if (isRestaurant &&
                        cleanPath.startsWith('/restaurant/')) {
                      innerContext.go(AppRoutes.restaurantDashboard);
                    } else if (isDriver && cleanPath.startsWith('/driver/')) {
                      innerContext.go(AppRoutes.driverDashboard);
                    } else if (cleanPath.startsWith('/restaurant/')) {
                      // Admin visiting restaurant pages fallback
                      innerContext.go(AppRoutes.adminDashboard);
                    } else {
                      innerContext.go(AppRoutes.home);
                    }
                  }
                },
              )
            : null,
        bottom: bottom,
        actions: [
          Consumer<LanguageProvider>(
            builder: (context, languageProvider, child) {
              return PopupMenuButton<String>(
                icon: const Icon(Icons.translate),
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
                          LogoutConfirmationDialog.show(context).then((
                            confirmed,
                          ) {
                            if (confirmed && context.mounted) {
                              authService.logout();
                              context.go(AppRoutes.login);
                            }
                          });
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
                                  const Icon(Icons.person_outline, size: 20),
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
                                    Icons.logout,
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
                final isLoginPage = cleanPath == AppRoutes.login;
                if (isLoginPage) return const SizedBox.shrink();

                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: TextButton.icon(
                    onPressed: () => context.go(AppRoutes.login),
                    icon: const Icon(Icons.login),
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
              child: Padding(
                padding: usePagePadding
                    ? EdgeInsets.symmetric(
                        horizontal: AppTheme.pagePaddingHorizontal,
                        vertical: AppTheme.pagePaddingVertical,
                      )
                    : EdgeInsets.zero,
                child: child,
              ),
            ),
          );
        },
      ),
    );
  }
}
