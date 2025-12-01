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
import 'package:catering_flutter/core/widgets/dashboard_card.dart';

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
                onPressed: () => context.push(AppRoutes.adminRestaurantCreate),
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
                      Text('Main Actions'),
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
                Tab(
                  child: Row(
                    children: [
                      Icon(Icons.restaurant_menu),
                      SizedBox(width: 8),
                      Text('Menu'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        child: TabBarView(
          children: [
            _buildMainActionsTab(context, restaurant),
            _buildOperationsTab(context, restaurant),
            _buildMenuTab(context, restaurant),
          ],
        ),
      ),
    );
  }

  Widget _buildMainActionsTab(BuildContext context, dynamic restaurant) {
    return ResponsiveGrid(
      children: [
        DashboardCard(
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
        DashboardCard(
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
        DashboardCard(
          title: 'Restaurant Categories',
          icon: Icons.restaurant,
          color: Colors.teal,
          onTap: () => context.push(
            Uri(
              path: AppRoutes.restaurantCategories,
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
        DashboardCard(
          title: 'Manage Orders',
          icon: Icons.receipt_long,
          color: Colors.green,
          onTap: () => context.push(
            Uri(
              path: AppRoutes.restaurantOrders,
              queryParameters: {'restaurantId': IriHelper.getId(restaurant.id)},
            ).toString(),
          ),
        ),
        DashboardCard(
          title: 'Manage Deliveries',
          icon: Icons.local_shipping,
          color: Colors.orange,
          onTap: () => context.push(
            Uri(
              path: AppRoutes.restaurantDeliveries,
              queryParameters: {'restaurantId': IriHelper.getId(restaurant.id)},
            ).toString(),
          ),
        ),
        DashboardCard(
          title: 'Drivers',
          icon: Icons.delivery_dining,
          color: Colors.deepPurple,
          onTap: () => context.push(
            Uri(
              path: AppRoutes.restaurantDrivers,
              queryParameters: {'restaurantId': IriHelper.getId(restaurant.id)},
            ).toString(),
          ),
        ),
      ],
    );
  }

  Widget _buildMenuTab(BuildContext context, dynamic restaurant) {
    return ResponsiveGrid(
      children: [
        DashboardCard(
          title: 'Meal Plans',
          icon: Icons.restaurant_menu,
          color: Colors.pink,
          onTap: () => context.push(
            Uri(
              path: AppRoutes.restaurantMealPlans,
              queryParameters: {'restaurantId': IriHelper.getId(restaurant.id)},
            ).toString(),
          ),
        ),
        DashboardCard(
          title: 'Manage Meals',
          icon: Icons.fastfood,
          color: Colors.orange,
          onTap: () => context.push(
            Uri(
              path: AppRoutes.restaurantMeals,
              queryParameters: {'restaurantId': IriHelper.getId(restaurant.id)},
            ).toString(),
          ),
        ),
      ],
    );
  }
}
