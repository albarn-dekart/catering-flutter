import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:catering_flutter/core/utils/date_formatter.dart';
import 'package:provider/provider.dart';
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
import 'package:catering_flutter/core/services/export_service.dart';
import 'package:catering_flutter/l10n/app_localizations.dart';
import 'package:catering_flutter/core/utils/price_formatter.dart';

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
  int _currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging == false) {
        setState(() {
          _currentTabIndex = _tabController.index;
        });
      }
    });
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
  void dispose() {
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

    final isNarrow = MediaQuery.of(context).size.width < 700;

    // FAB only shown on statistics tab
    Widget? fab;
    if (_currentTabIndex == 0 && restaurant != null) {
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
      title: AppLocalizations.of(context)!.restaurantDashboard,
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
                    const Icon(Icons.local_shipping),
                    const SizedBox(width: 8),
                    Text(AppLocalizations.of(context)!.operations),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  children: [
                    const Icon(Icons.restaurant_menu),
                    const SizedBox(width: 8),
                    Text(AppLocalizations.of(context)!.menu),
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
                '${AppLocalizations.of(context)!.error}: $errorMessage',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
            );
          }

          if (restaurant == null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppLocalizations.of(context)!.noRestaurantFound),
                  const SizedBox(height: 16),
                  FilledButton(
                    onPressed: () =>
                        context.push(AppRoutes.adminRestaurantCreate),
                    child: Text(AppLocalizations.of(context)!.createRestaurant),
                  ),
                ],
              ),
            );
          }

          return TabBarView(
            controller: _tabController,
            children: [
              _buildStatisticsTab(context, restaurant),
              _buildOperationsTab(context, restaurant),
              _buildMenuTab(context, restaurant),
            ],
          );
        },
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
      if (widget.restaurantIri != null) {
        await context.read<StatisticsService>().fetchRestaurantStatistics(
          widget.restaurantIri!,
          startDate: _selectedDateRange?.start,
          endDate: _selectedDateRange?.end,
        );
      } else {
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
  }

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

  Widget _buildStatisticsTab(BuildContext context, dynamic restaurant) {
    final statisticsService = context.watch<StatisticsService>();
    final stats = statisticsService.restaurantStatistics;

    // Build the complete layout with charts
    return RefreshIndicator(
      onRefresh: _refreshData,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Date range header (styled like production screen)
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
                            await _refreshData();
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
                  if (stats != null) ...[
                    ResponsiveGrid(
                      preferredItemHeight: 250,
                      children: [
                        DashboardCard(
                          title: AppLocalizations.of(context)!.totalRevenue,
                          subtitle: stats.totalRevenue.toPln(),
                          icon: Icons.euro,
                          color: Colors.green,
                          onTap: () {},
                        ),
                        DashboardCard(
                          title: AppLocalizations.of(context)!.totalOrders,
                          subtitle:
                              '${stats.totalOrders} ${AppLocalizations.of(context)!.orders.toLowerCase()}',
                          icon: Icons.receipt_long,
                          color: Colors.blue,
                          onTap: () {},
                        ),
                        DashboardCard(
                          title: AppLocalizations.of(context)!.activeOrders,
                          subtitle:
                              '${stats.activeOrders} ${AppLocalizations.of(context)!.statusActive.toLowerCase()}',
                          icon: Icons.pending_actions,
                          color: Colors.orange,
                          onTap: () {},
                        ),
                        DashboardCard(
                          title: AppLocalizations.of(context)!.deliverySuccess,
                          subtitle:
                              '${stats.deliverySuccessRate.toStringAsFixed(1)}%',
                          icon: Icons.check_circle,
                          color: Colors.teal,
                          onTap: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final isWide = constraints.maxWidth > 900;

                        final revenueChart = RevenueLineChart(
                          revenueTimeSeries: stats.revenueTimeSeries,
                          title:
                              '${AppLocalizations.of(context)!.restaurantRevenue} (${_selectedDateRange != null ? AppLocalizations.of(context)!.selectedPeriod : AppLocalizations.of(context)!.last30Days})',
                        );

                        final dailyOrdersChart = DailyOrdersChart(
                          dailyOrdersTimeSeries: stats.dailyOrdersTimeSeries,
                        );

                        final popularPlansChart =
                            stats.popularMealPlans.isNotEmpty
                            ? HorizontalBarChartWidget(
                                data: stats.popularMealPlans
                                    .map(
                                      (mp) => MapEntry(
                                        mp['name'] as String,
                                        mp['orderCount'] as int,
                                      ),
                                    )
                                    .toList(),
                                title: AppLocalizations.of(
                                  context,
                                )!.popularMealPlans,
                                valueLabel: AppLocalizations.of(
                                  context,
                                )!.orders,
                                barColor: Colors.pink,
                              )
                            : null;

                        if (isWide) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    revenueChart,
                                    const SizedBox(height: 16),
                                    popularPlansChart ?? const SizedBox(),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(child: dailyOrdersChart),
                            ],
                          );
                        } else {
                          return Column(
                            children: [
                              revenueChart,
                              const SizedBox(height: 16),
                              dailyOrdersChart,
                              if (popularPlansChart != null) ...[
                                const SizedBox(height: 16),
                                popularPlansChart,
                              ],
                            ],
                          );
                        }
                      },
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOperationsTab(BuildContext context, dynamic restaurant) {
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
              title: AppLocalizations.of(context)!.drivers,
              icon: Icons.delivery_dining,
              color: Colors.deepPurple,
              onTap: () => context.push(
                Uri(
                  path: AppRoutes.restaurantDrivers,
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
        padding: const EdgeInsets.all(16.0),
        child: ResponsiveGrid(
          preferredItemHeight: 250,
          padding: EdgeInsets.zero,
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

  Future<void> _exportStatistics() async {
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
          AppLocalizations.of(context)!.statisticsExportSuccess,
          isError: false,
        );
      } else {
        throw Exception('Restaurant ID not found');
      }
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
}
