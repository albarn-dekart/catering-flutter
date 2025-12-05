import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/core/app_routes.dart';
import 'package:catering_flutter/core/utils/iri_helper.dart';
import 'package:catering_flutter/features/restaurant/services/restaurant_service.dart';
import 'package:catering_flutter/features/user/services/user_service.dart';
import 'package:catering_flutter/features/admin/services/statistics_service.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';
import 'package:catering_flutter/core/widgets/responsive_grid.dart';
import 'package:catering_flutter/core/widgets/dashboard_card.dart';
import 'package:catering_flutter/core/widgets/charts/revenue_line_chart.dart';
import 'package:catering_flutter/core/widgets/charts/horizontal_bar_chart.dart';
import 'package:catering_flutter/core/services/export_service.dart';

class RestaurantDashboardScreen extends StatefulWidget {
  final String? restaurantIri;

  const RestaurantDashboardScreen({super.key, this.restaurantIri});

  @override
  State<RestaurantDashboardScreen> createState() =>
      _RestaurantDashboardScreenState();
}

class _RestaurantDashboardScreenState extends State<RestaurantDashboardScreen> {
  bool _isExporting = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (widget.restaurantIri != null) {
        await context.read<RestaurantService>().getRestaurantById(
          widget.restaurantIri!,
        );
        if (!mounted) return;
        // Fetch restaurant statistics
        await context.read<StatisticsService>().fetchRestaurantStatistics(
          widget.restaurantIri!,
        );
      } else {
        await context.read<UserService>().fetchCurrentRestaurant();
        if (!mounted) return;
        // Fetch statistics for current restaurant
        final userService = context.read<UserService>();
        if (userService.currentUser?.restaurant != null) {
          await context.read<StatisticsService>().fetchRestaurantStatistics(
            userService.currentUser!.restaurant!.id,
          );
        }
      }

      if (!mounted) return;
      final restaurantService = context.read<RestaurantService>();
      final userService = context.read<UserService>();

      final errorMessage = widget.restaurantIri != null
          ? restaurantService.errorMessage
          : userService.errorMessage;

      if (errorMessage != null) {
        UIErrorHandler.showSnackBar(context, errorMessage, isError: true);
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

    final errorMessage = widget.restaurantIri != null
        ? restaurantService.errorMessage
        : userService.errorMessage;

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
                      Icon(Icons.bar_chart),
                      SizedBox(width: 8),
                      Text('Statistics'),
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
        child: Builder(
          builder: (context) {
            if (isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (errorMessage != null) {
              return Center(
                child: Text(
                  'Error: $errorMessage',
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
              );
            }

            if (restaurant == null) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('No restaurant found for this account.'),
                    const SizedBox(height: 16),
                    FilledButton(
                      onPressed: () =>
                          context.push(AppRoutes.adminRestaurantCreate),
                      child: const Text('Create Restaurant'),
                    ),
                  ],
                ),
              );
            }

            return TabBarView(
              children: [
                _buildStatisticsTab(context, restaurant),
                _buildOperationsTab(context, restaurant),
                _buildMenuTab(context, restaurant),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildStatisticsTab(BuildContext context, dynamic restaurant) {
    final statisticsService = context.watch<StatisticsService>();
    final stats = statisticsService.restaurantStatistics;

    // Build the complete layout with charts
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (stats != null) ...[
            ResponsiveGrid(
              childAspectRatio: 1.3,
              children: [
                DashboardCard(
                  title: 'Total Revenue',
                  subtitle: '${stats.totalRevenue.toStringAsFixed(2)} PLN',
                  icon: Icons.euro,
                  color: Colors.green,
                  onTap: () {},
                ),
                DashboardCard(
                  title: 'Total Orders',
                  subtitle: '${stats.totalOrders} orders',
                  icon: Icons.receipt_long,
                  color: Colors.blue,
                  onTap: () {},
                ),
                DashboardCard(
                  title: 'Active Orders',
                  subtitle: '${stats.activeOrders} active',
                  icon: Icons.pending_actions,
                  color: Colors.orange,
                  onTap: () {},
                ),
                DashboardCard(
                  title: 'Delivery Success',
                  subtitle: '${stats.deliverySuccessRate.toStringAsFixed(1)}%',
                  icon: Icons.check_circle,
                  color: Colors.teal,
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 24),
            RevenueLineChart(
              revenueTimeSeries: stats.revenueTimeSeries,
              title: 'Restaurant Revenue (Last 30 Days)',
            ),
            const SizedBox(height: 16),
            if (stats.popularMealPlans.isNotEmpty)
              HorizontalBarChartWidget(
                data: stats.popularMealPlans
                    .map(
                      (mp) => MapEntry(
                        mp['name'] as String,
                        mp['orderCount'] as int,
                      ),
                    )
                    .toList(),
                title: 'Popular Meal Plans',
                valueLabel: 'Orders',
                barColor: Colors.pink,
              ),
          ],
        ],
      ),
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
        DashboardCard(
          title: 'Export Statistics',
          icon: Icons.download,
          color: Colors.indigo,
          onTap: _isExporting ? () {} : _exportStatistics,
        ),
      ],
    );
  }

  Widget _buildMenuTab(BuildContext context, dynamic restaurant) {
    return ResponsiveGrid(
      children: [
        DashboardCard(
          title: 'Restaurant Details',
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

  Future<void> _exportStatistics() async {
    setState(() {
      _isExporting = true;
    });

    try {
      final exportService = context.read<ExportService>();

      await exportService.exportStatisticsToCsv();

      if (!mounted) return;

      UIErrorHandler.showSnackBar(
        context,
        'Statistics exported successfully',
        isError: false,
      );
    } catch (e) {
      if (!mounted) return;
      UIErrorHandler.showSnackBar(
        context,
        'Failed to export statistics: ${e.toString()}',
        isError: true,
      );
    } finally {
      if (mounted) {
        setState(() {
          _isExporting = false;
        });
      }
    }
  }
}
