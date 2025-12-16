import 'package:catering_flutter/graphql/schema.graphql.dart';
import 'package:flutter/material.dart';
import 'package:catering_flutter/core/utils/date_formatter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
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
        preferredSize: const Size.fromHeight(60),
        child: Container(
          margin: const EdgeInsets.fromLTRB(16, 0, 16, 8),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
          child: TabBar(
            controller: _tabController,
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
            tabs: [
              Tab(
                child: Row(
                  children: [
                    const Icon(Icons.bar_chart),
                    const SizedBox(width: 8),
                    Text(AppLocalizations.of(context)!.statistics),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  children: [
                    const Icon(Icons.dashboard),
                    const SizedBox(width: 8),
                    Text(AppLocalizations.of(context)!.management),
                  ],
                ),
              ),
            ],
          ),
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
              color: Colors.orange,
              onTap: () => context.push(AppRoutes.adminRestaurants),
            ),
            DashboardCard(
              title: AppLocalizations.of(context)!.manageUsers,
              icon: Icons.people,
              color: Colors.blue,
              onTap: () => context.push(AppRoutes.adminUsers),
            ),
            DashboardCard(
              title: AppLocalizations.of(context)!.restaurantCategories,
              icon: Icons.restaurant,
              color: Colors.teal,
              onTap: () => context.push(AppRoutes.adminRestaurantCategories),
            ),
            DashboardCard(
              title: AppLocalizations.of(context)!.dietCategories,
              icon: Icons.restaurant_menu,
              color: Colors.indigo,
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
            height:
                MediaQuery.of(context).size.height -
                200, // Ensure scrollability for refresh
            child: Center(
              child: Text(
                '${AppLocalizations.of(context)!.error}: ${statisticsService.errorMessage}',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
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
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
              child: Row(
                children: [
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
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    children: [
                      FilledButton.tonalIcon(
                        onPressed: () => _selectDateRange(context),
                        icon: const Icon(Icons.date_range),
                        label: Text(AppLocalizations.of(context)!.change),
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
                          icon: const Icon(Icons.close, size: 16),
                          label: Text(
                            AppLocalizations.of(context)!.clearFilter,
                          ),
                          style: TextButton.styleFrom(
                            foregroundColor: Theme.of(
                              context,
                            ).colorScheme.onPrimaryContainer,
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Statistics Cards
                  ResponsiveGrid(
                    preferredItemHeight: 250,
                    children: [
                      DashboardCard(
                        title: AppLocalizations.of(context)!.totalRevenue,
                        subtitle:
                            '${statistics.totalRevenue.toStringAsFixed(2)} PLN',
                        icon: Icons.euro,
                        color: Colors.green,
                        onTap: () {},
                      ),
                      DashboardCard(
                        title: AppLocalizations.of(context)!.totalOrders,
                        subtitle:
                            '${statistics.totalOrders} ${AppLocalizations.of(context)!.orders.toLowerCase()}',
                        icon: Icons.receipt_long,
                        color: Colors.blue,
                        onTap: () {},
                      ),
                      DashboardCard(
                        title: AppLocalizations.of(context)!.activeOrders,
                        subtitle:
                            '${statistics.activeOrders} ${AppLocalizations.of(context)!.statusActive.toLowerCase()}',
                        icon: Icons.pending_actions,
                        color: Colors.orange,
                        onTap: () {},
                      ),
                      DashboardCard(
                        title: AppLocalizations.of(context)!.totalUsers,
                        subtitle:
                            '${statistics.totalUsers} ${AppLocalizations.of(context)!.totalUsers.toLowerCase()}',
                        icon: Icons.people,
                        color: Colors.purple,
                        onTap: () {},
                      ),
                      DashboardCard(
                        title: AppLocalizations.of(context)!.averageOrderValue,
                        subtitle:
                            '${statistics.averageOrderValue.toStringAsFixed(2)} PLN',
                        icon: Icons.trending_up,
                        color: Colors.teal,
                        onTap: () {},
                      ),
                      DashboardCard(
                        title: AppLocalizations.of(context)!.customers,
                        subtitle:
                            '${statistics.customerCount} ${AppLocalizations.of(context)!.customers.toLowerCase()}',
                        icon: Icons.person,
                        color: Colors.indigo,
                        onTap: () {},
                      ),
                      DashboardCard(
                        title: AppLocalizations.of(context)!.restaurants,
                        subtitle:
                            '${statistics.restaurantCount} ${AppLocalizations.of(context)!.restaurants.toLowerCase()}',
                        icon: Icons.store,
                        color: Colors.deepOrange,
                        onTap: () {},
                      ),
                      DashboardCard(
                        title: AppLocalizations.of(context)!.drivers,
                        subtitle:
                            '${statistics.driverCount} ${AppLocalizations.of(context)!.drivers.toLowerCase()}',
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
