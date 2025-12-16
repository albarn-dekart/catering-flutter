import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:catering_flutter/core/app_router.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart';
import 'package:catering_flutter/core/widgets/responsive_grid.dart';
import 'package:catering_flutter/core/widgets/dashboard_card.dart';
import 'package:catering_flutter/l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/core/services/auth_service.dart';

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
        child: ResponsiveGrid(
          preferredItemHeight: 250,
          children: [
            if (isCustomer) ...[
              DashboardCard(
                title: AppLocalizations.of(context)!.myOrders,
                icon: Icons.receipt_long,
                color: Colors.blue,
                onTap: () => context.push(AppRoutes.orders),
              ),
              DashboardCard(
                title: AppLocalizations.of(context)!.myAddresses,
                icon: Icons.location_on,
                color: Colors.green,
                onTap: () => context.push(AppRoutes.addressList),
              ),
              DashboardCard(
                title: AppLocalizations.of(context)!.myMealPlans,
                icon: Icons.restaurant_menu,
                color: Colors.purple,
                onTap: () => context.push(AppRoutes.myMealPlans),
              ),
            ],
            DashboardCard(
              title: AppLocalizations.of(context)!.changePassword,
              icon: Icons.lock,
              color: Colors.orange,
              onTap: () => context.push(AppRoutes.changePassword),
            ),
          ],
        ),
      ),
    );
  }
}
