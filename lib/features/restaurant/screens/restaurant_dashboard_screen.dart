import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/core/app_routes.dart';
import 'package:catering_flutter/core/utils/iri_helper.dart';
import 'package:catering_flutter/features/restaurant/services/restaurant_service.dart';
import 'package:catering_flutter/features/user/services/user_service.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';
import 'package:catering_flutter/core/widgets/responsive_grid.dart';

class RestaurantDashboardScreen extends StatefulWidget {
  final String? restaurantIri;

  const RestaurantDashboardScreen({super.key, this.restaurantIri});

  @override
  State<RestaurantDashboardScreen> createState() =>
      _RestaurantDashboardScreenState();
}

class _RestaurantDashboardScreenState extends State<RestaurantDashboardScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.restaurantIri != null) {
        context.read<RestaurantService>().getRestaurantById(
          widget.restaurantIri!,
        );
      } else {
        context.read<UserService>().fetchCurrentRestaurant();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final restaurantService = context.watch<RestaurantService>();
    final userService = context.watch<UserService>();
    final restaurant = widget.restaurantIri != null
        ? restaurantService.currentRestaurant
        : userService.currentUser?.restaurant;

    final isLoading = widget.restaurantIri != null
        ? restaurantService.isLoading
        : userService.isLoading;

    if (isLoading) {
      return const CustomScaffold(
        title: 'Restaurant Dashboard',
        child: Center(child: CircularProgressIndicator()),
      );
    }

    final errorMessage = widget.restaurantIri != null
        ? restaurantService.errorMessage
        : userService.errorMessage;

    if (errorMessage != null) {
      return CustomScaffold(
        title: 'Restaurant Dashboard',
        child: Center(
          child: Text(
            'Error: $errorMessage',
            style: TextStyle(color: Theme.of(context).colorScheme.error),
          ),
        ),
      );
    }

    if (restaurant == null) {
      return CustomScaffold(
        title: 'Restaurant Dashboard',
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('No restaurant found for this account.'),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: () => context.push(AppRoutes.createRestaurant),
                child: const Text('Create Restaurant'),
              ),
            ],
          ),
        ),
      );
    }

    return DefaultTabController(
      length: 3,
      child: CustomScaffold(
        title: 'Restaurant Dashboard',
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Container(
            margin: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
            child: TabBar(
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white,
              ),
              labelColor: Theme.of(context).primaryColor,
              unselectedLabelColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: Colors.transparent,
              labelPadding: const EdgeInsets.symmetric(horizontal: 24),
              tabs: const [
                Tab(
                  child: Row(
                    children: [
                      Icon(Icons.dashboard),
                      SizedBox(width: 8),
                      Text('Quick Actions'),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    children: [
                      Icon(Icons.restaurant_menu),
                      SizedBox(width: 8),
                      Text('Menu'),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    children: [
                      Icon(Icons.local_shipping),
                      SizedBox(width: 8),
                      Text('Operations'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        child: TabBarView(
          children: [
            _buildQuickActionsTab(context, restaurant),
            _buildMenuTab(context, restaurant),
            _buildOperationsTab(context, restaurant),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActionsTab(BuildContext context, dynamic restaurant) {
    return ResponsiveGrid(
      children: [
        _buildActionCard(
          context,
          title: 'Edit Details',
          icon: Icons.edit_note,
          color: Colors.blue,
          onTap: () => context.push(
            Uri(
              path: AppRoutes.restaurantForm,
              queryParameters: {'id': IriHelper.getId(restaurant.id)},
            ).toString(),
          ),
        ),
        _buildActionCard(
          context,
          title: 'Analytics',
          icon: Icons.bar_chart,
          color: Colors.purple,
          onTap: () {
            UIErrorHandler.showSnackBar(
              context,
              'Analytics coming soon!',
              isError: false,
            );
          },
        ),
      ],
    );
  }

  Widget _buildMenuTab(BuildContext context, dynamic restaurant) {
    return ResponsiveGrid(
      children: [
        _buildActionCard(
          context,
          title: 'Manage Meals',
          icon: Icons.fastfood,
          color: Colors.orange,
          onTap: () => context.push(
            Uri(
              path: AppRoutes.manageMeals,
              queryParameters: {'restaurantId': IriHelper.getId(restaurant.id)},
            ).toString(),
          ),
        ),
        _buildActionCard(
          context,
          title: 'Meal Plans',
          icon: Icons.restaurant_menu,
          color: Colors.pink,
          onTap: () => context.push(
            Uri(
              path: AppRoutes.manageMealPlans,
              queryParameters: {'restaurantId': IriHelper.getId(restaurant.id)},
            ).toString(),
          ),
        ),
        _buildActionCard(
          context,
          title: 'Categories',
          icon: Icons.category,
          color: Colors.teal,
          onTap: () => context.push(
            Uri(
              path: AppRoutes.manageCategories,
              queryParameters: {'restaurantId': IriHelper.getId(restaurant.id)},
            ).toString(),
          ),
        ),
      ],
    );
  }

  Widget _buildOperationsTab(BuildContext context, dynamic restaurant) {
    return ResponsiveGrid(
      children: [
        _buildActionCard(
          context,
          title: 'Manage Orders',
          icon: Icons.receipt_long,
          color: Colors.green,
          onTap: () => context.push(
            Uri(
              path: AppRoutes.manageOrders,
              queryParameters: {'restaurantId': IriHelper.getId(restaurant.id)},
            ).toString(),
          ),
        ),
        _buildActionCard(
          context,
          title: 'Manage Deliveries',
          icon: Icons.local_shipping,
          color: Colors.orange,
          onTap: () => context.push(
            Uri(
              path: AppRoutes.manageDeliveries,
              queryParameters: {'restaurantId': IriHelper.getId(restaurant.id)},
            ).toString(),
          ),
        ),
        _buildActionCard(
          context,
          title: 'Drivers',
          icon: Icons.delivery_dining,
          color: Colors.deepPurple,
          onTap: () => context.push(
            Uri(
              path: AppRoutes.manageDrivers,
              queryParameters: {'restaurantId': IriHelper.getId(restaurant.id)},
            ).toString(),
          ),
        ),
      ],
    );
  }

  Widget _buildActionCard(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 150),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 40, color: color),
              ),
              const SizedBox(height: 16),
              Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
