import 'package:catering_flutter/graphql/schema.graphql.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/core/app_theme.dart';
import 'package:catering_flutter/core/app_router.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart';
import 'package:catering_flutter/core/widgets/responsive_grid.dart';
import 'package:catering_flutter/core/widgets/dashboard_card.dart';
import 'package:catering_flutter/features/admin/services/statistics_service.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';
import 'package:catering_flutter/core/widgets/charts/revenue_line_chart.dart';
import 'package:catering_flutter/core/widgets/charts/order_status_pie_chart.dart';
import 'package:catering_flutter/core/widgets/charts/daily_orders_chart.dart';
import 'package:catering_flutter/core/widgets/charts/horizontal_bar_chart.dart';
import 'package:catering_flutter/core/services/export_service.dart';
import 'package:catering_flutter/core/widgets/stat_card.dart';
import 'package:catering_flutter/core/widgets/global_error_widget.dart';
import 'package:catering_flutter/l10n/app_localizations.dart';
import 'package:catering_flutter/core/utils/price_formatter.dart';
import 'package:catering_flutter/core/widgets/easy_date_picker.dart';
import 'package:catering_flutter/core/widgets/app_export_button.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen>
    with SingleTickerProviderStateMixin {
  bool _isExporting = false;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await context.read<StatisticsService>().fetchAdminStatistics();
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
    _statisticsService.clearAdminStatistics();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: AppLocalizations.of(context)!.adminDashboard,
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
                      const Icon(Icons.dashboard, size: 20),
                      const SizedBox(width: 8),
                      Text(AppLocalizations.of(context)!.management),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final isNarrow = constraints.maxWidth < 700;
                return TabBarView(
                  controller: _tabController,
                  children: [
                    _buildStatisticsTab(context, constraints, isNarrow),
                    _buildManagementTab(context),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _refreshData() async {
    await context.read<StatisticsService>().fetchAdminStatistics(
      startDate: _selectedDateRange?.start,
      endDate: _selectedDateRange?.end,
    );
  }

  Widget _buildManagementTab(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refreshData,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        child: ResponsiveGrid(
          children: [
            DashboardCard(
              title: AppLocalizations.of(context)!.manageRestaurants,
              icon: Icons.store,
              color: AppColors.secondary,
              onTap: () => context.push(AppRoutes.adminRestaurants),
            ),
            DashboardCard(
              title: AppLocalizations.of(context)!.manageUsers,
              icon: Icons.people,
              color: AppColors.primary,
              onTap: () => context.push(AppRoutes.adminUsers),
            ),
            DashboardCard(
              title: AppLocalizations.of(context)!.restaurantCategories,
              icon: Icons.restaurant,
              color: AppColors.success,
              onTap: () => context.push(AppRoutes.adminRestaurantCategories),
            ),
            DashboardCard(
              title: AppLocalizations.of(context)!.dietCategories,
              icon: Icons.restaurant_menu,
              color: AppColors.info,
              onTap: () => context.push(AppRoutes.adminDietCategories),
            ),
          ],
        ),
      ),
    );
  }

  DateTimeRange? _selectedDateRange;

  Widget _buildStatisticsTab(
    BuildContext context,
    BoxConstraints constraints,
    bool isNarrow,
  ) {
    final statisticsService = context.watch<StatisticsService>();
    final statistics = statisticsService.adminStatistics;

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
              onCancel: () => statisticsService.clearAdminStatistics(),
              withScaffold: false,
            ),
          ),
        ),
      );
    }

    if (statistics == null) {
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

    // Helper functions to build card lists
    List<Widget> buildOverviewCards() => [
      StatCard(
        title: AppLocalizations.of(context)!.totalUsers,
        value: '${statistics.totalUsers}',
        icon: Icons.people_outline,
        color: AppColors.primary,
      ),
      StatCard(
        title: AppLocalizations.of(context)!.customers,
        value: '${statistics.customerCount}',
        icon: Icons.person_outline,
        color: AppColors.primary,
      ),
      StatCard(
        title: AppLocalizations.of(context)!.restaurants,
        value: '${statistics.restaurantCount}',
        icon: Icons.store_outlined,
        color: AppColors.secondary,
      ),
      StatCard(
        title: AppLocalizations.of(context)!.couriers,
        value: '${statistics.courierCount}',
        icon: Icons.delivery_dining_outlined,
        color: AppColors.secondaryDark,
      ),
    ];

    List<Widget> buildSummaryCards() => [
      StatCard(
        title: AppLocalizations.of(context)!.totalRevenue,
        value: statistics.totalRevenue.toPln(),
        icon: Icons.payments_outlined,
        color: AppColors.success,
      ),
      StatCard(
        title: AppLocalizations.of(context)!.totalOrders,
        value: '${statistics.totalOrders}',
        icon: Icons.receipt_long_outlined,
        color: AppColors.info,
      ),
      StatCard(
        title: AppLocalizations.of(context)!.activeOrders,
        value: '${statistics.activeOrders}',
        icon: Icons.pending_actions_outlined,
        color: AppColors.warning,
      ),
      StatCard(
        title: AppLocalizations.of(context)!.averageOrderValue,
        value: statistics.averageOrderValue.toPln(),
        icon: Icons.trending_up,
        color: AppColors.primaryLight,
      ),
    ];

    return RefreshIndicator(
      onRefresh: _refreshData,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isChartsRow = constraints.maxWidth > 900;

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1. Overview Section (All Time)
                  Text(
                    AppLocalizations.of(context)!.overview,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 12),
                  ResponsiveGrid(
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    maxColumns: 4,
                    children: buildOverviewCards(),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Divider(),
                  ),
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
                    maxColumns: 4,
                    children: buildSummaryCards(),
                  ),

                  // 3. Charts Section
                  const SizedBox(height: 24),
                  if (isChartsRow)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              RevenueLineChart(
                                revenueTimeSeries: statistics.revenueTimeSeries,
                              ),
                              const SizedBox(height: 16),
                              HorizontalBarChartWidget(
                                data: statistics.topRestaurants
                                    .map(
                                      (r) => MapEntry(
                                        r['name'] as String,
                                        ((r['revenue'] as num).toDouble() / 100)
                                            .toInt(),
                                      ),
                                    )
                                    .toList(),
                                title: AppLocalizations.of(
                                  context,
                                )!.topRestaurants,
                                valueLabel: 'PLN',
                                barColor: Colors.orange,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            children: [
                              DailyOrdersChart(
                                dailyOrdersTimeSeries:
                                    statistics.dailyOrdersTimeSeries,
                              ),
                              const SizedBox(height: 16),
                              OrderStatusPieChart(
                                ordersByStatus: _convertMapToList(
                                  statistics.ordersByStatus,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  else
                    Column(
                      children: [
                        RevenueLineChart(
                          revenueTimeSeries: statistics.revenueTimeSeries,
                        ),
                        const SizedBox(height: 16),
                        DailyOrdersChart(
                          dailyOrdersTimeSeries:
                              statistics.dailyOrdersTimeSeries,
                        ),
                        const SizedBox(height: 16),
                        HorizontalBarChartWidget(
                          data: statistics.topRestaurants
                              .map(
                                (r) => MapEntry(
                                  r['name'] as String,
                                  ((r['revenue'] as num).toDouble() / 100)
                                      .toInt(),
                                ),
                              )
                              .toList(),
                          title: AppLocalizations.of(context)!.topRestaurants,
                          valueLabel: 'PLN',
                          barColor: Colors.orange,
                        ),
                        const SizedBox(height: 16),
                        OrderStatusPieChart(
                          ordersByStatus: _convertMapToList(
                            statistics.ordersByStatus,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            );
          },
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

      await exportService.exportDataToCsv(
        startDate: _selectedDateRange?.start,
        endDate: _selectedDateRange?.end,
      );

      if (!mounted) return;

      UIErrorHandler.showSnackBar(
        context,
        AppLocalizations.of(context)!.exportSuccess,
        isError: false,
      );
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
