import 'package:catering_flutter/graphql/schema.graphql.dart';
import 'package:flutter/material.dart';
import 'package:catering_flutter/core/utils/date_formatter.dart';
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
import 'package:catering_flutter/core/services/export_service.dart';
import 'package:catering_flutter/core/widgets/stat_card.dart';
import 'package:catering_flutter/core/widgets/global_error_widget.dart';
import 'package:catering_flutter/l10n/app_localizations.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen>
    with SingleTickerProviderStateMixin {
  bool _isExporting = false;
  late TabController _tabController;
  int _currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging == false) {
        setState(() {
          _currentTabIndex = _tabController.index;
        });
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await context.read<StatisticsService>().fetchAdminStatistics();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isNarrow = MediaQuery.of(context).size.width < 700;

    // FAB only shown on statistics tab
    Widget? fab;
    if (_currentTabIndex == 0) {
      fab = isNarrow
          ? FloatingActionButton(
              onPressed: _isExporting ? null : _exportStatistics,
              tooltip: AppLocalizations.of(context)!.exportStatistics,
              child: _isExporting
                  ? const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.download),
            )
          : FloatingActionButton.extended(
              onPressed: _isExporting ? null : _exportStatistics,
              icon: _isExporting
                  ? const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.download),
              label: Text(AppLocalizations.of(context)!.exportStatistics),
            );
    }

    return CustomScaffold(
      title: AppLocalizations.of(context)!.adminDashboard,
      floatingActionButton: fab,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(48),
        child: Column(
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
            const Divider(height: 1, thickness: 1, indent: 0, endIndent: 0),
          ],
        ),
      ),
      child: TabBarView(
        controller: _tabController,
        children: [_buildStatisticsTab(context), _buildManagementTab(context)],
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
        padding: const EdgeInsets.all(16.0),
        child: ResponsiveGrid(
          preferredItemHeight: 250,
          padding: EdgeInsets.zero,
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

  Future<void> _selectDateRange(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      initialDateRange: _selectedDateRange,
    );

    if (picked != null && picked != _selectedDateRange) {
      setState(() {
        _selectedDateRange = picked;
      });
      if (!context.mounted) return;
      await context.read<StatisticsService>().fetchAdminStatistics(
        startDate: _selectedDateRange?.start,
        endDate: _selectedDateRange?.end,
      );
    }
  }

  Widget _buildStatisticsTab(BuildContext context) {
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
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 200,
            child: GlobalErrorWidget(
              message: statisticsService.errorMessage,
              onRetry: _refreshData,
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
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 200,
            child: Center(
              child: Text(AppLocalizations.of(context)!.noStatisticsAvailable),
            ),
          ),
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _refreshData,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Date range header (styled like restaurant dashboard)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 0,
                color: Theme.of(
                  context,
                ).colorScheme.primaryContainer.withValues(alpha: 0.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                  side: BorderSide(
                    color: Theme.of(
                      context,
                    ).colorScheme.primary.withValues(alpha: 0.1),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Theme.of(
                            context,
                          ).colorScheme.primary.withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.calendar_today_rounded,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.overview,
                              style: Theme.of(context).textTheme.labelMedium
                                  ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer
                                        .withValues(alpha: 0.7),
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              _selectedDateRange == null
                                  ? AppLocalizations.of(context)!.last30Days
                                  : '${AppDateFormatter.dayMonth(context, _selectedDateRange!.start)} - ${AppDateFormatter.dayMonthYear(context, _selectedDateRange!.end)}',
                              style: Theme.of(context).textTheme.titleLarge
                                  ?.copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onPrimaryContainer,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          FilledButton.icon(
                            onPressed: () => _selectDateRange(context),
                            icon: const Icon(
                              Icons.date_range_rounded,
                              size: 18,
                            ),
                            label: Text(AppLocalizations.of(context)!.change),
                            style: FilledButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                            ),
                          ),
                          if (_selectedDateRange != null) ...[
                            const SizedBox(height: 8),
                            TextButton.icon(
                              onPressed: () async {
                                setState(() {
                                  _selectedDateRange = null;
                                });
                                await context
                                    .read<StatisticsService>()
                                    .fetchAdminStatistics();
                              },
                              icon: Icon(
                                Icons.close,
                                size: 18,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              label: Text(
                                AppLocalizations.of(context)!.clearFilter,
                                style: Theme.of(context).textTheme.labelLarge
                                    ?.copyWith(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.primary,
                                    ),
                              ),
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                                visualDensity: VisualDensity.compact,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Statistics Cards
                  ResponsiveGrid(
                    preferredItemHeight: 100,
                    children: [
                      StatCard(
                        title: AppLocalizations.of(context)!.totalRevenue,
                        value:
                            '${statistics.totalRevenue.toStringAsFixed(2)} PLN',
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
                        title: AppLocalizations.of(context)!.totalUsers,
                        value: '${statistics.totalUsers}',
                        icon: Icons.people_outline,
                        color: AppColors.primary,
                      ),
                      StatCard(
                        title: AppLocalizations.of(context)!.averageOrderValue,
                        value:
                            '${statistics.averageOrderValue.toStringAsFixed(2)} PLN',
                        icon: Icons.trending_up,
                        color: AppColors.primaryLight,
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
                        title: AppLocalizations.of(context)!.drivers,
                        value: '${statistics.driverCount}',
                        icon: Icons.delivery_dining_outlined,
                        color: AppColors.secondaryDark,
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
                              child: Column(
                                children: [
                                  RevenueLineChart(
                                    revenueTimeSeries:
                                        statistics.revenueTimeSeries,
                                  ),
                                  const SizedBox(height: 16),
                                  DailyOrdersChart(
                                    dailyOrdersTimeSeries:
                                        statistics.dailyOrdersTimeSeries,
                                  ),
                                ],
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
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _exportStatistics() async {
    setState(() {
      _isExporting = true;
    });

    try {
      final exportService = context.read<ExportService>();

      await exportService.exportStatisticsToCsv(
        startDate: _selectedDateRange?.start,
        endDate: _selectedDateRange?.end,
      );

      if (!mounted) return;

      UIErrorHandler.showSnackBar(
        context,
        AppLocalizations.of(context)!.statisticsExportSuccess,
        isError: false,
      );
    } catch (e) {
      if (!mounted) return;
      UIErrorHandler.showSnackBar(
        context,
        AppLocalizations.of(context)!.statisticsExportFailed(e.toString()),
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
