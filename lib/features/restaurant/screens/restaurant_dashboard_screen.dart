import 'package:flutter/material.dart';
import 'package:catering_flutter/core/widgets/app_premium_button.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/core/app_theme.dart';
import 'package:catering_flutter/core/app_router.dart';
import 'package:catering_flutter/core/utils/iri_helper.dart';
import 'package:catering_flutter/features/restaurant/services/restaurant_service.dart';
import 'package:catering_flutter/features/user/services/user_service.dart';
import 'package:catering_flutter/features/admin/services/statistics_service.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';
import 'package:catering_flutter/core/widgets/responsive_grid.dart';
import 'package:catering_flutter/core/widgets/dashboard_card.dart';
import 'package:catering_flutter/core/widgets/charts/revenue_line_chart.dart';
import 'package:catering_flutter/core/widgets/charts/daily_orders_chart.dart';
import 'package:catering_flutter/core/widgets/charts/horizontal_bar_chart.dart';
import 'package:catering_flutter/core/widgets/charts/order_status_pie_chart.dart';
import 'package:catering_flutter/graphql/schema.graphql.dart';
import 'package:catering_flutter/core/services/export_service.dart';
import 'package:catering_flutter/core/widgets/stat_card.dart';
import 'package:catering_flutter/core/widgets/global_error_widget.dart';
import 'package:catering_flutter/l10n/app_localizations.dart';
import 'package:catering_flutter/core/utils/price_formatter.dart';
import 'package:catering_flutter/core/widgets/easy_date_picker.dart';
import 'package:catering_flutter/core/widgets/app_export_button.dart';

class RestaurantDashboardScreen extends StatefulWidget {
  final String? restaurantIri;

  const RestaurantDashboardScreen({super.key, this.restaurantIri});

  @override
  State<RestaurantDashboardScreen> createState() =>
      _RestaurantDashboardScreenState();
}

class _RestaurantDashboardScreenState extends State<RestaurantDashboardScreen>
    with SingleTickerProviderStateMixin {
  bool _isExporting = false;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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
        if (userService.currentUser?.ownedRestaurant != null) {
          await context.read<StatisticsService>().fetchRestaurantStatistics(
            userService.currentUser!.ownedRestaurant!.id,
          );
        }
      }

      if (!mounted) return;
    });
  }

  late StatisticsService _statisticsService;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _statisticsService = context.read<StatisticsService>();
  }

  @override
  void dispose() {
    _statisticsService.clearRestaurantStatistics();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final restaurantService = context.watch<RestaurantService>();
    final userService = context.watch<UserService>();
    final restaurant = widget.restaurantIri != null
        ? restaurantService.currentRestaurant
        : userService.currentUser?.ownedRestaurant;

    final isLoading = widget.restaurantIri != null
        ? restaurantService.isLoading
        : userService.isLoading;

    final errorMessage = widget.restaurantIri != null
        ? restaurantService.errorMessage
        : userService.errorMessage;

    return CustomScaffold(
      title: AppLocalizations.of(context)!.restaurantDashboard,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(49),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TabBar(
              controller: _tabController,
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              labelPadding: const EdgeInsets.symmetric(horizontal: 24),
              tabs: [
                Tab(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.bar_chart, size: 20),
                      const SizedBox(width: 8),
                      Text(AppLocalizations.of(context)!.statistics),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.local_shipping, size: 20),
                      const SizedBox(width: 8),
                      Text(AppLocalizations.of(context)!.operations),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.restaurant_menu, size: 20),
                      const SizedBox(width: 8),
                      Text(AppLocalizations.of(context)!.menu),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(),
          ],
        ),
      ),
      child: Builder(
        builder: (context) {
          if (isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (errorMessage != null) {
            return GlobalErrorWidget(
              message: errorMessage,
              onRetry: _refreshData,
              onCancel: () {
                if (widget.restaurantIri != null) {
                  restaurantService.clearCurrentRestaurant();
                } else {
                  userService.clearError();
                }
              },
              withScaffold: false,
            );
          }

          if (restaurant == null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppLocalizations.of(context)!.noRestaurantFound),
                  const SizedBox(height: 16),
                  AppPremiumButton(
                    onPressed: () =>
                        context.push(AppRoutes.adminRestaurantCreate),
                    icon: Icons.add,
                    label: AppLocalizations.of(context)!.createRestaurant,
                  ),
                ],
              ),
            );
          }

          return LayoutBuilder(
            builder: (context, constraints) {
              final isNarrow = constraints.maxWidth < 700;
              return TabBarView(
                controller: _tabController,
                children: [
                  _buildStatisticsTab(
                    context,
                    restaurant,
                    constraints,
                    isNarrow,
                  ),
                  _buildOperationsTab(context, restaurant),
                  _buildMenuTab(context, restaurant),
                ],
              );
            },
          );
        },
      ),
    );
  }

  DateTimeRange? _selectedDateRange;

  Future<void> _refreshData() async {
    if (widget.restaurantIri != null) {
      await context.read<RestaurantService>().getRestaurantById(
        widget.restaurantIri!,
      );
      if (!mounted) return;
      await context.read<StatisticsService>().fetchRestaurantStatistics(
        widget.restaurantIri!,
        startDate: _selectedDateRange?.start,
        endDate: _selectedDateRange?.end,
      );
    } else {
      await context.read<UserService>().fetchCurrentRestaurant();
      if (!mounted) return;
      final userService = context.read<UserService>();
      if (userService.currentUser?.ownedRestaurant != null) {
        await context.read<StatisticsService>().fetchRestaurantStatistics(
          userService.currentUser!.ownedRestaurant!.id,
          startDate: _selectedDateRange?.start,
          endDate: _selectedDateRange?.end,
        );
      }
    }
  }

  Widget _buildStatisticsTab(
    BuildContext context,
    dynamic restaurant,
    BoxConstraints constraints,
    bool isNarrow,
  ) {
    final statisticsService = context.watch<StatisticsService>();
    final stats = statisticsService.restaurantStatistics;

    if (statisticsService.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (statisticsService.hasError) {
      return RefreshIndicator(
        onRefresh: _refreshData,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          child: SizedBox(
            height: constraints.maxHeight,
            child: GlobalErrorWidget(
              message: statisticsService.errorMessage,
              onRetry: _refreshData,
              onCancel: () => statisticsService.clearRestaurantStatistics(),
              withScaffold: false,
            ),
          ),
        ),
      );
    }

    if (stats == null) {
      return RefreshIndicator(
        onRefresh: _refreshData,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          child: SizedBox(
            height: constraints.maxHeight,
            child: Center(
              child: Text(AppLocalizations.of(context)!.noStatisticsAvailable),
            ),
          ),
        ),
      );
    }

    List<Widget> buildOverviewCards() => [
      StatCard(
        title: AppLocalizations.of(context)!.totalClients,
        value: '${stats.totalClients}',
        icon: Icons.people_outline,
        color: AppColors.primary,
      ),
      StatCard(
        title: AppLocalizations.of(context)!.totalStatsMealPlans,
        value: '${stats.totalMealPlans}',
        icon: Icons.restaurant_menu,
        color: AppColors.secondary,
      ),
    ];

    List<Widget> buildSummaryCards() => [
      StatCard(
        title: AppLocalizations.of(context)!.totalRevenue,
        value: stats.totalRevenue.toPln(),
        icon: Icons.payments_outlined,
        color: AppColors.success,
      ),
      StatCard(
        title: AppLocalizations.of(context)!.totalOrders,
        value: '${stats.totalOrders}',
        icon: Icons.receipt_long_outlined,
        color: AppColors.info,
      ),
      StatCard(
        title: AppLocalizations.of(context)!.totalDeliveries,
        value: '${stats.totalDeliveries}',
        icon: Icons.local_shipping_outlined,
        color: AppColors.warning,
      ),
      StatCard(
        title: AppLocalizations.of(context)!.averageOrderValue,
        value: stats.averageOrderValue.toPln(),
        icon: Icons.trending_up,
        color: AppColors.primaryLight,
      ),
      StatCard(
        title: AppLocalizations.of(context)!.deliverySuccess,
        value: '${stats.deliverySuccessRate.toStringAsFixed(1)}%',
        icon: Icons.check_circle_outline,
        color: AppColors.primary,
      ),
    ];

    return RefreshIndicator(
      onRefresh: _refreshData,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1. Overview Section
                  Text(
                    AppLocalizations.of(context)!.overview,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 12),
                  ResponsiveGrid(
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    maxColumns: 2,
                    children: buildOverviewCards(),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Divider(),
                  ),
                  // 2. Summary Section
                  Text(
                    AppLocalizations.of(context)!.summary,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  // Date Filter
                  EasyDatePicker(
                    selectedDateRange: _selectedDateRange,
                    onDateRangeChanged: (range) {
                      setState(() {
                        _selectedDateRange = range;
                      });
                      _refreshData();
                    },
                    headerAction: AppExportButton(
                      onPressed: _exportData,
                      isLoading: _isExporting,
                    ),
                    isLoading: statisticsService.isLoading,
                  ),
                  const SizedBox(height: 12),
                  // Summary Cards Grid
                  ResponsiveGrid(
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    maxColumns: 3,
                    children: buildSummaryCards(),
                  ),
                  // 3. Charts Section
                  const SizedBox(height: 24),
                  _buildCharts(context, stats, true),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildCharts(
    BuildContext context,
    RestaurantStatistics stats,
    bool isWideParent,
  ) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final effectiveWide = constraints.maxWidth > 900;

        final revenueChart = RevenueLineChart(
          revenueTimeSeries: stats.revenueTimeSeries,
          title: AppLocalizations.of(context)!.restaurantRevenue,
        );

        final dailyOrdersChart = DailyOrdersChart(
          dailyOrdersTimeSeries: stats.dailyOrdersTimeSeries,
        );

        final popularPlansChart = HorizontalBarChartWidget(
          data: stats.popularMealPlans
              .map(
                (mp) => MapEntry(mp['name'] as String, mp['orderCount'] as int),
              )
              .toList(),
          title: AppLocalizations.of(context)!.popularMealPlans,
          valueLabel: AppLocalizations.of(context)!.orders,
          barColor: Colors.pink,
        );

        final ordersByStatus = stats.ordersByStatus.map((key, value) {
          try {
            final status = Enum$OrderStatus.values.firstWhere(
              (e) => e.name == key,
            );
            return MapEntry(status, value);
          } catch (_) {
            return MapEntry(Enum$OrderStatus.$unknown, value);
          }
        });
        ordersByStatus.removeWhere(
          (key, value) => key == Enum$OrderStatus.$unknown,
        );

        final pieChart = OrderStatusPieChart(ordersByStatus: ordersByStatus);

        if (effectiveWide) {
          return Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: revenueChart),
                  const SizedBox(width: 16),
                  Expanded(child: dailyOrdersChart),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: popularPlansChart),
                  const SizedBox(width: 16),
                  Expanded(child: pieChart),
                ],
              ),
            ],
          );
        } else {
          return Column(
            children: [
              revenueChart,
              const SizedBox(height: 16),
              dailyOrdersChart,
              const SizedBox(height: 16),
              popularPlansChart,
              const SizedBox(height: 16),
              pieChart,
            ],
          );
        }
      },
    );
  }

  Widget _buildOperationsTab(BuildContext context, dynamic restaurant) {
    return RefreshIndicator(
      onRefresh: _refreshData,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        child: ResponsiveGrid(
          children: [
            DashboardCard(
              title: AppLocalizations.of(context)!.manageOrders,
              icon: Icons.receipt_long,
              color: Colors.green,
              onTap: () => context.push(
                Uri(
                  path: AppRoutes.restaurantOrders,
                  queryParameters: {
                    'restaurantId': IriHelper.getId(restaurant.id),
                  },
                ).toString(),
              ),
            ),
            DashboardCard(
              title: AppLocalizations.of(context)!.manageDeliveries,
              icon: Icons.local_shipping,
              color: Colors.orange,
              onTap: () => context.push(
                Uri(
                  path: AppRoutes.restaurantDeliveries,
                  queryParameters: {
                    'restaurantId': IriHelper.getId(restaurant.id),
                  },
                ).toString(),
              ),
            ),
            DashboardCard(
              title: AppLocalizations.of(context)!.kitchenSchedule,
              icon: Icons.soup_kitchen,
              color: Colors.brown,
              onTap: () => context.push(
                Uri(
                  path: AppRoutes.restaurantProduction,
                  queryParameters: {
                    'restaurantId': IriHelper.getId(restaurant.id),
                  },
                ).toString(),
              ),
            ),
            DashboardCard(
              title: AppLocalizations.of(context)!.couriers,
              icon: Icons.delivery_dining,
              color: Colors.deepPurple,
              onTap: () => context.push(
                Uri(
                  path: AppRoutes.restaurantCouriers,
                  queryParameters: {
                    'restaurantId': IriHelper.getId(restaurant.id),
                  },
                ).toString(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuTab(BuildContext context, dynamic restaurant) {
    return RefreshIndicator(
      onRefresh: _refreshData,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        child: ResponsiveGrid(
          children: [
            DashboardCard(
              title: AppLocalizations.of(context)!.restaurantDetails,
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
              title: AppLocalizations.of(context)!.manageMealPlans,
              icon: Icons.restaurant_menu,
              color: Colors.pink,
              onTap: () => context.push(
                Uri(
                  path: AppRoutes.restaurantMealPlans,
                  queryParameters: {
                    'restaurantId': IriHelper.getId(restaurant.id),
                  },
                ).toString(),
              ),
            ),
            DashboardCard(
              title: AppLocalizations.of(context)!.manageMeals,
              icon: Icons.fastfood,
              color: Colors.orange,
              onTap: () => context.push(
                Uri(
                  path: AppRoutes.restaurantMeals,
                  queryParameters: {
                    'restaurantId': IriHelper.getId(restaurant.id),
                  },
                ).toString(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _exportData() async {
    setState(() {
      _isExporting = true;
    });

    try {
      final exportService = context.read<ExportService>();
      final userService = context.read<UserService>();

      String? restaurantId;
      if (widget.restaurantIri != null) {
        restaurantId = IriHelper.getId(widget.restaurantIri!);
      } else if (userService.currentUser?.ownedRestaurant != null) {
        restaurantId = IriHelper.getId(
          userService.currentUser!.ownedRestaurant!.id,
        );
      }

      if (restaurantId != null) {
        await exportService.exportRestaurantStatisticsToCsv(
          restaurantId,
          startDate: _selectedDateRange?.start,
          endDate: _selectedDateRange?.end,
        );

        if (!mounted) return;

        UIErrorHandler.showSnackBar(
          context,
          AppLocalizations.of(context)!.exportSuccess,
          isError: false,
        );
      } else {
        throw Exception('Restaurant ID not found');
      }
    } catch (e) {
      if (!mounted) return;
      UIErrorHandler.showSnackBar(
        context,
        AppLocalizations.of(context)!.exportFailed(e.toString()),
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
