import 'package:catering_flutter/core/widgets/global_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/core/utils/date_formatter.dart';
import 'package:catering_flutter/l10n/app_localizations.dart';
import 'package:catering_flutter/features/restaurant/services/production_service.dart';
import 'package:catering_flutter/core/services/export_service.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart';

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

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
      _fetchData();
    }
  }

  Future<void> _exportCsv() async {
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
    }
  }

  @override
  Widget build(BuildContext context) {
    final service = context.watch<ProductionService>();
    final isNarrow = MediaQuery.of(context).size.width < 700;

    return CustomScaffold(
      title: AppLocalizations.of(context)!.productionPlan,
      floatingActionButton: isNarrow
          ? FloatingActionButton(
              onPressed: _exportCsv,
              tooltip: AppLocalizations.of(context)!.downloadPlan,
              child: const Icon(Icons.download),
            )
          : FloatingActionButton.extended(
              onPressed: _exportCsv,
              icon: const Icon(Icons.download),
              label: Text(AppLocalizations.of(context)!.downloadPlan),
            ),
      child: Column(
        children: [
          // Date selector header (refined for consistency)
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
                            AppLocalizations.of(context)!.productionDate,
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
                            AppDateFormatter.fullDate(context, _selectedDate),
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
                    FilledButton.icon(
                      onPressed: () => _selectDate(context),
                      icon: const Icon(Icons.date_range_rounded, size: 18),
                      label: Text(AppLocalizations.of(context)!.change),
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Content
          Expanded(
            child: service.isLoading
                ? const Center(child: CircularProgressIndicator())
                : service.hasError
                ? GlobalErrorWidget(
                    message: service.errorMessage,
                    onRetry: _fetchData,
                    withScaffold: false,
                  )
                : service.productionItems.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.soup_kitchen_outlined,
                          size: 64,
                          color: Theme.of(
                            context,
                          ).colorScheme.outline.withValues(alpha: 0.5),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          AppLocalizations.of(context)!.noProductionData,
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.outline,
                              ),
                        ),
                      ],
                    ),
                  )
                : RefreshIndicator(
                    onRefresh: _fetchData,
                    child: ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(16),
                      itemCount: service.productionItems.length,
                      itemBuilder: (context, index) {
                        final item = service.productionItems[index];
                        return Card(
                          margin: const EdgeInsets.only(bottom: 12),
                          child: ListTile(
                            leading: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Theme.of(
                                  context,
                                ).colorScheme.primary.withValues(alpha: 0.1),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.restaurant_rounded,
                                size: 20,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            title: Text(
                              item.mealName,
                              style: Theme.of(context).textTheme.titleMedium,
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
                                style: Theme.of(context).textTheme.titleMedium
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
                      },
                    ),
                  ),
          ),

          // Total footer (refined for premium look)
          if (!service.isLoading && service.productionItems.isNotEmpty)
            Container(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainer,
                border: Border(
                  top: BorderSide(
                    color: Theme.of(
                      context,
                    ).dividerColor.withValues(alpha: 0.1),
                  ),
                ),
              ),
              child: SafeArea(
                top: false,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.totalMeals,
                            style: Theme.of(context).textTheme.titleSmall
                                ?.copyWith(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurfaceVariant,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            AppLocalizations.of(context)!.productionSummary,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(
                              context,
                            ).colorScheme.primary.withValues(alpha: 0.3),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Text(
                        '${service.productionItems.fold(0, (sum, item) => sum + item.count)}',
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ),
                    // Space for FAB on mobile if needed, but FAB is usually at bottom right
                    if (isNarrow) const SizedBox(width: 72),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
