import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/core/app_routes.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart';
import 'package:catering_flutter/core/widgets/responsive_grid.dart';
import 'package:catering_flutter/core/widgets/dashboard_card.dart';
import 'package:catering_flutter/features/admin/services/statistics_service.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';
import 'package:catering_flutter/core/widgets/charts/revenue_line_chart.dart';
import 'package:catering_flutter/core/widgets/charts/order_status_pie_chart.dart';
import 'package:catering_flutter/graphql/schema.graphql.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await context.read<StatisticsService>().fetchAdminStatistics();

      if (!mounted) return;
      final statisticsService = context.read<StatisticsService>();

      if (statisticsService.hasError) {
        UIErrorHandler.showSnackBar(
          context,
          statisticsService.errorMessage!,
          isError: true,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: CustomScaffold(
        title: 'Admin Dashboard',
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
                      Icon(Icons.dashboard),
                      SizedBox(width: 8),
                      Text('Management'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        child: TabBarView(
          children: [
            _buildStatisticsTab(context),
            _buildManagementTab(context),
          ],
        ),
      ),
    );
  }

  Widget _buildManagementTab(BuildContext context) {
    return ResponsiveGrid(
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
    );
  }

  Widget _buildStatisticsTab(BuildContext context) {
    final statisticsService = context.watch<StatisticsService>();
    final statistics = statisticsService.adminStatistics;

    if (statisticsService.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (statisticsService.hasError) {
      return Center(
        child: Text(
          'Error: ${statisticsService.errorMessage}',
          style: TextStyle(color: Theme.of(context).colorScheme.error),
        ),
      );
    }

    if (statistics == null) {
      return const Center(child: Text('No statistics available'));
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Statistics Cards
          ResponsiveGrid(
            childAspectRatio: 1.3,
            children: [
              DashboardCard(
                title: 'Total Revenue',
                subtitle: '${statistics.totalRevenue.toStringAsFixed(2)} PLN',
                icon: Icons.euro,
                color: Colors.green,
                onTap: () {},
              ),
              DashboardCard(
                title: 'Total Orders',
                subtitle: '${statistics.totalOrders} orders',
                icon: Icons.receipt_long,
                color: Colors.blue,
                onTap: () {},
              ),
              DashboardCard(
                title: 'Active Orders',
                subtitle: '${statistics.activeOrders} active',
                icon: Icons.pending_actions,
                color: Colors.orange,
                onTap: () {},
              ),
              DashboardCard(
                title: 'Total Users',
                subtitle: '${statistics.totalUsers} users',
                icon: Icons.people,
                color: Colors.purple,
                onTap: () {},
              ),
              DashboardCard(
                title: 'Average Order Value',
                subtitle:
                    '${statistics.averageOrderValue.toStringAsFixed(2)} PLN',
                icon: Icons.trending_up,
                color: Colors.teal,
                onTap: () {},
              ),
              DashboardCard(
                title: 'Customers',
                subtitle: '${statistics.customerCount} customers',
                icon: Icons.person,
                color: Colors.indigo,
                onTap: () {},
              ),
              DashboardCard(
                title: 'Restaurants',
                subtitle: '${statistics.restaurantCount} restaurants',
                icon: Icons.store,
                color: Colors.deepOrange,
                onTap: () {},
              ),
              DashboardCard(
                title: 'Drivers',
                subtitle: '${statistics.driverCount} drivers',
                icon: Icons.delivery_dining,
                color: Colors.deepPurple,
                onTap: () {},
              ),
            ],
          ),
          const SizedBox(height: 24),
          // Charts Section
          LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth > 900;

              if (isWide) {
                // Side-by-side on wide screens
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: RevenueLineChart(
                        revenueTimeSeries: statistics.revenueTimeSeries,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: OrderStatusPieChart(
                        ordersByStatus: _convertMapToList(
                          statistics.ordersByStatus,
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                // Stacked on narrow screens
                return Column(
                  children: [
                    RevenueLineChart(
                      revenueTimeSeries: statistics.revenueTimeSeries,
                    ),
                    const SizedBox(height: 16),
                    OrderStatusPieChart(
                      ordersByStatus: _convertMapToList(
                        statistics.ordersByStatus,
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Map<Enum$OrderStatus, int> _convertMapToList(Map<String, int> data) {
    final result = <Enum$OrderStatus, int>{};

    data.forEach((statusString, count) {
      final status = Enum$OrderStatus.values.firstWhere(
        (e) => e.name == statusString,
        orElse: () => Enum$OrderStatus.$unknown,
      );

      if (status != Enum$OrderStatus.$unknown) {
        result[status] = count;
      }
    });

    return result;
  }
}
