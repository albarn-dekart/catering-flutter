import 'package:catering_flutter/core/widgets/app_card.dart';
import 'package:catering_flutter/core/widgets/app_export_button.dart';
import 'package:catering_flutter/core/widgets/global_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/core/widgets/easy_date_picker.dart';
import 'package:catering_flutter/l10n/app_localizations.dart';
import 'package:catering_flutter/features/restaurant/services/production_service.dart';
import 'package:catering_flutter/core/services/export_service.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart';
import 'package:catering_flutter/core/widgets/responsive_grid.dart';

class RestaurantProductionScreen extends StatefulWidget {
  final String restaurantId;

  const RestaurantProductionScreen({super.key, required this.restaurantId});

  @override
  State<RestaurantProductionScreen> createState() =>
      _RestaurantProductionScreenState();
}

class _RestaurantProductionScreenState
    extends State<RestaurantProductionScreen> {
  DateTime _selectedDate = DateTime.now();
  bool _isExporting = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchData();
    });
  }

  Future<void> _fetchData() async {
    await context.read<ProductionService>().fetchProductionPlan(
      widget.restaurantId,
      date: _selectedDate,
    );
  }

  Future<void> _exportCsv() async {
    setState(() {
      _isExporting = true;
    });
    try {
      await context.read<ExportService>().exportProductionPlan(
        widget.restaurantId,
        date: _selectedDate,
      );
      if (mounted) {
        UIErrorHandler.showSnackBar(
          context,
          AppLocalizations.of(context)!.exportSuccess,
          isError: false,
        );
      }
    } catch (e) {
      if (mounted) {
        UIErrorHandler.handleError(context, e);
      }
    } finally {
      if (mounted) {
        setState(() {
          _isExporting = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final service = context.watch<ProductionService>();
    final isNarrow = MediaQuery.of(context).size.width < 700;

    return CustomScaffold(
      title: AppLocalizations.of(context)!.productionPlan,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EasyDatePicker(
            selectedDateRange: DateTimeRange(
              start: _selectedDate,
              end: _selectedDate,
            ),
            showAllTime: false,
            onDateRangeChanged: (range) {
              if (range != null) {
                setState(() {
                  _selectedDate = range.start;
                });
                _fetchData();
              }
            },
            isLoading: service.isLoading,
          ),
          const SizedBox(height: 8),
          const Divider(),
          const SizedBox(height: 8),
          // Content
          Expanded(
            child: RefreshIndicator(
              onRefresh: _fetchData,
              child: service.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      child: ResponsiveGrid(
                        maxColumns: 1,
                        mainAxisSpacing: 12,
                        children: [
                          if (service.hasError)
                            GlobalErrorWidget(
                              message: service.errorMessage,
                              onRetry: _fetchData,
                              onCancel: () => service.clearError(),
                              withScaffold: false,
                            )
                          else if (service.productionItems.isEmpty)
                            Padding(
                              padding: const EdgeInsets.only(top: 100),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.soup_kitchen_outlined,
                                      size: 64,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .outline
                                          .withValues(alpha: 0.5),
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      AppLocalizations.of(
                                        context,
                                      )!.noProductionData,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.outline,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          else
                            ...service.productionItems.map((item) {
                              return AppCard(
                                child: ListTile(
                                  leading: Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary
                                          .withValues(alpha: 0.1),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.restaurant_rounded,
                                      size: 20,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.primary,
                                    ),
                                  ),
                                  title: Text(
                                    item.mealName,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.titleMedium,
                                  ),
                                  trailing: Container(
                                    width: 40,
                                    height: 40,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.secondaryContainer,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Text(
                                      '${item.count}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.onSecondaryContainer,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                        ],
                      ),
                    ),
            ),
          ),

          // Integrated Footer Toolbar
          if (!service.isLoading)
            AppCard(
              padding: EdgeInsets.all(16.0),
              color: Theme.of(
                context,
              ).colorScheme.tertiary.withValues(alpha: 0.1),
              child: Row(
                children: [
                  // Summary Section
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.totalMeals,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurfaceVariant,
                              ),
                        ),
                        if (!isNarrow)
                          Text(
                            AppLocalizations.of(context)!.productionSummary,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    '${service.productionItems.fold(0, (sum, item) => sum + item.count)}',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Action Button
                  AppExportButton(
                    onPressed: service.productionItems.isEmpty
                        ? null
                        : _exportCsv,
                    isLoading: _isExporting,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
