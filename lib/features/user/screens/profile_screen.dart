import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:catering_flutter/core/app_theme.dart';
import 'package:catering_flutter/core/app_router.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart';
import 'package:catering_flutter/core/widgets/responsive_grid.dart';
import 'package:catering_flutter/core/widgets/dashboard_card.dart';
import 'package:catering_flutter/l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/core/services/auth_service.dart';
import 'package:catering_flutter/core/utils/role_helper.dart';
import 'package:catering_flutter/core/widgets/logout_dialog.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = context.watch<AuthService>();
    final isCustomer = authService.hasRole('ROLE_CUSTOMER');

    return CustomScaffold(
      title: AppLocalizations.of(context)!.profile,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            // User Header
            if (authService.isAuthenticated) ...[
              const SizedBox(height: 16),
              CircleAvatar(
                radius: 48,
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                child: Text(
                  authService.email?.isNotEmpty == true
                      ? authService.email![0].toUpperCase()
                      : '?',
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                authService.email ?? '',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 8,
                runSpacing: 8,
                children: authService.roles.map((role) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondaryContainer,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      RoleHelper.getLocalizedRole(context, role),
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Theme.of(
                          context,
                        ).colorScheme.onSecondaryContainer,
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 32),
              const Divider(),
              const SizedBox(height: 16),
            ],

            ResponsiveGrid(
              children: [
                if (isCustomer) ...[
                  DashboardCard(
                    title: AppLocalizations.of(context)!.myOrders,
                    icon: Icons.receipt_long,
                    color: AppColors.info,
                    onTap: () => context.push(AppRoutes.orders),
                  ),
                  DashboardCard(
                    title: AppLocalizations.of(context)!.myAddresses,
                    icon: Icons.location_on,
                    color: AppColors.success,
                    onTap: () => context.push(AppRoutes.addressList),
                  ),
                  DashboardCard(
                    title: AppLocalizations.of(context)!.myMealPlans,
                    icon: Icons.restaurant_menu,
                    color: AppColors.secondary,
                    onTap: () => context.push(AppRoutes.myMealPlans),
                  ),
                ],
                DashboardCard(
                  title: AppLocalizations.of(context)!.changePassword,
                  icon: Icons.lock,
                  color: AppColors.warning,
                  onTap: () => context.push(AppRoutes.changePassword),
                ),
                DashboardCard(
                  title: AppLocalizations.of(context)!.logout,
                  icon: Icons.logout,
                  color: AppColors.error,
                  onTap: () async {
                    final confirmed = await LogoutConfirmationDialog.show(
                      context,
                    );

                    if (confirmed && context.mounted) {
                      await context.read<AuthService>().logout();
                      if (context.mounted) {
                        context.go(AppRoutes.login);
                      }
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
