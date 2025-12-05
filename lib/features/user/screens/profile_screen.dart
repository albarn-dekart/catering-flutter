import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:catering_flutter/core/app_routes.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart';
import 'package:catering_flutter/core/widgets/responsive_grid.dart';
import 'package:catering_flutter/core/widgets/dashboard_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Profile',
      child: ResponsiveGrid(
        children: [
          DashboardCard(
            title: 'My Orders',
            icon: Icons.receipt_long,
            color: Colors.blue,
            onTap: () => context.push(AppRoutes.orders),
          ),
          DashboardCard(
            title: 'My Addresses',
            icon: Icons.location_on,
            color: Colors.green,
            onTap: () => context.push(AppRoutes.addressList),
          ),
          DashboardCard(
            title: 'Change Password',
            icon: Icons.lock,
            color: Colors.orange,
            onTap: () => context.push(AppRoutes.changePassword),
          ),
        ],
      ),
    );
  }
}
