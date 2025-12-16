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
  DateTime _selectedDate = DateTime.now().add(const Duration(days: 1));

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
          // Date selector header
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                            ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        AppDateFormatter.fullDate(context, _selectedDate),
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
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
                FilledButton.tonalIcon(
                  onPressed: () => _selectDate(context),
                  icon: const Icon(Icons.calendar_today),
                  label: Text(AppLocalizations.of(context)!.change),
                ),
              ],
            ),
          ),

          // Content
          Expanded(
            child: service.isLoading
                ? const Center(child: CircularProgressIndicator())
                : service.hasError
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error_outline,
                          size: 48,
                          color: Theme.of(context).colorScheme.error,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          service.errorMessage ??
                              AppLocalizations.of(context)!.somethingWentWrong,
                        ),
                        const SizedBox(height: 16),
                        FilledButton(
                          onPressed: _fetchData,
                          child: Text(AppLocalizations.of(context)!.retry),
                        ),
                      ],
                    ),
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
                            leading: CircleAvatar(
                              backgroundColor: Theme.of(
                                context,
                              ).colorScheme.secondaryContainer,
                              child: Icon(
                                Icons.restaurant,
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSecondaryContainer,
                              ),
                            ),
                            title: Text(
                              item.mealName,
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.w600),
                            ),
                            trailing: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: Theme.of(
                                  context,
                                ).colorScheme.primaryContainer,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                '${item.count}',
                                style: Theme.of(context).textTheme.titleMedium
                                    ?.copyWith(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onPrimaryContainer,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          ),

          // Total footer with padding for FAB
          if (!service.isLoading && service.productionItems.isNotEmpty)
            Container(
              padding: const EdgeInsets.fromLTRB(
                20,
                20,
                100,
                20,
              ), // Right padding for FAB
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 10,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      AppLocalizations.of(context)!.totalMeals,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      '${service.productionItems.fold(0, (sum, item) => sum + item.count)}',
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
