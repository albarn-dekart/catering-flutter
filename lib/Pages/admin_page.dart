import 'package:catering_app/Pages/Meal/category_page.dart';
import 'package:catering_app/Pages/Meal/meal_page.dart';
import 'package:catering_app/Pages/Meal/meal_plan_page.dart';
import 'package:catering_app/Pages/users_page.dart';
import 'package:flutter/material.dart';
import 'package:catering_app/Classes/app_theme.dart';
import 'package:catering_app/Classes/catering_app_bar.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CateringAppBar(title: 'Admin Dashboard'),
        body: _buildContent(context));
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppTheme.defaultPadding),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildAdminTile(
                  context,
                  title: 'User Management',
                  subtitle: 'Manage user accounts and orders',
                  page: UsersPage(),
                  icon: Icons.people_alt_rounded,
                ),
                const SizedBox(height: AppTheme.defaultPadding),
                _buildAdminTile(
                  context,
                  title: 'Meal Plans',
                  subtitle: 'Create and organize weekly meal plans',
                  page: MealPlanPage(),
                  icon: Icons.calendar_month_rounded,
                ),
                const SizedBox(height: AppTheme.defaultPadding),
                _buildAdminTile(
                  context,
                  title: 'Meal Database',
                  subtitle: 'Manage individual meals',
                  page: MealPage(),
                  icon: Icons.restaurant_rounded,
                ),
                const SizedBox(height: AppTheme.defaultPadding),
                _buildAdminTile(
                  context,
                  title: 'Categories',
                  subtitle: 'Organize meal categories',
                  page: CategoryPage(),
                  icon: Icons.category_rounded,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAdminTile(
    BuildContext context, {
    required String title,
    required String subtitle,
    required Widget page,
    required IconData icon,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(
        vertical: AppTheme.defaultPadding / 2,
        horizontal: AppTheme.defaultPadding,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppTheme.cardRadius),
      ),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.defaultPadding),
        child: InkWell(
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => page)),
          borderRadius: BorderRadius.circular(AppTheme.cardRadius),
          child: Container(
            padding: const EdgeInsets.all(AppTheme.defaultPadding),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppTheme.cardRadius),
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    size: 28,
                    color: AppTheme.primaryColor,
                  ),
                ),
                const SizedBox(width: AppTheme.defaultPadding),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                            ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.chevron_right_rounded,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
