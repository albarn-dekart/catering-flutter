import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:catering_flutter/core/app_routes.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart';
import 'package:catering_flutter/core/widgets/responsive_grid.dart';
import 'package:catering_flutter/core/widgets/dashboard_card.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Admin Dashboard',
      child: ResponsiveGrid(
        children: [
          DashboardCard(
            title: 'Manage Restaurants',
            icon: Icons.store,
            color: Colors.orange,
            onTap: () => context.push(AppRoutes.adminRestaurants),
          ),
          DashboardCard(
            title: 'Manage Users',
            icon: Icons.people,
            color: Colors.blue,
            onTap: () => context.push(AppRoutes.adminUsers),
          ),
          DashboardCard(
            title: 'Restaurant Categories',
            icon: Icons.restaurant,
            color: Colors.teal,
            onTap: () => context.push(AppRoutes.adminRestaurantCategories),
          ),
          DashboardCard(
            title: 'Diet Categories',
            icon: Icons.restaurant_menu,
            color: Colors.indigo,
            onTap: () => context.push(AppRoutes.adminDietCategories),
          ),
        ],
      ),
    );
  }
}
