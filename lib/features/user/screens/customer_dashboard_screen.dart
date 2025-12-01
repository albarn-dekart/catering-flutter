import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:catering_flutter/core/app_routes.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart';
import 'package:catering_flutter/core/widgets/responsive_grid.dart';

class CustomerDashboardScreen extends StatelessWidget {
  const CustomerDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Customer Dashboard',
      child: ResponsiveGrid(
        children: [
          _buildDashboardCard(
            context,
            title: 'My Orders',
            icon: Icons.receipt_long,
            color: Colors.blue,
            onTap: () => context.push(AppRoutes.orders),
          ),
          _buildDashboardCard(
            context,
            title: 'My Addresses',
            icon: Icons.location_on,
            color: Colors.green,
            onTap: () => context.push(AppRoutes.addressList),
          ),
          _buildDashboardCard(
            context,
            title: 'Change Password',
            icon: Icons.lock,
            color: Colors.orange,
            onTap: () => context.push(AppRoutes.changePassword),
          ),
          _buildDashboardCard(
            context,
            title: 'Browse Restaurants',
            icon: Icons.restaurant,
            color: Colors.purple,
            onTap: () => context.go(AppRoutes.home),
          ),
        ],
      ),
    );
  }

  Widget _buildDashboardCard(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 48, color: color),
              const SizedBox(height: 16),
              Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
