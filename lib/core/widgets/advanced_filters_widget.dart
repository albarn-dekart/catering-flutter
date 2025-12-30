import 'package:catering_flutter/core/widgets/app_card.dart';
import 'package:flutter/material.dart';
import 'package:catering_flutter/l10n/app_localizations.dart';

class AdvancedFiltersWidget extends StatelessWidget {
  final double maxPrice;
  final RangeValues? priceRange;
  final ValueChanged<RangeValues> onPriceChanged;

  final double maxCalories;
  final RangeValues? calorieRange;
  final ValueChanged<RangeValues> onCaloriesChanged;

  final double maxProtein;
  final RangeValues? proteinRange;
  final ValueChanged<RangeValues> onProteinChanged;

  final double maxFat;
  final RangeValues? fatRange;
  final ValueChanged<RangeValues> onFatChanged;

  final double maxCarbs;
  final RangeValues? carbRange;
  final ValueChanged<RangeValues> onCarbsChanged;

  const AdvancedFiltersWidget({
    super.key,
    required this.maxPrice,
    required this.priceRange,
    required this.onPriceChanged,
    required this.maxCalories,
    required this.calorieRange,
    required this.onCaloriesChanged,
    required this.maxProtein,
    required this.proteinRange,
    required this.onProteinChanged,
    required this.maxFat,
    required this.fatRange,
    required this.onFatChanged,
    required this.maxCarbs,
    required this.carbRange,
    required this.onCarbsChanged,
  });

  @override
  Widget build(BuildContext context) {
    // Helper to safely construct RangeValues within bounds
    RangeValues safeRange(RangeValues? current, double max) {
      if (max <= 0) return const RangeValues(0, 0);
      final start = (current?.start ?? 0.0).clamp(0.0, max);
      final end = (current?.end ?? max).clamp(start, max);
      return RangeValues(start, end);
    }

    // Helper to build a single slider row to save space
    Widget buildSlider({
      required String label,
      required RangeValues? currentRange,
      required double max,
      required ValueChanged<RangeValues> onChanged,
      required String badgeUnit,
      double step = 1.0,
    }) {
      final safeCurrent = safeRange(currentRange, max);
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: double.infinity,
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 4,
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.normal,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Text(
                  '${safeCurrent.start.toStringAsFixed(0)} - ${safeCurrent.end.toStringAsFixed(0)} $badgeUnit',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 36, // Force compact height for slider
            child: RangeSlider(
              values: safeCurrent,
              min: 0,
              max: max > 0 ? max : 1.0,
              divisions: max > 0 ? (max / step).round() : 1,
              onChanged: onChanged,
            ),
          ),
        ],
      );
    }

    return AppCard(
      padding: const EdgeInsets.all(16),
      color: Theme.of(context).colorScheme.surfaceContainerLow,
      child: Column(
        children: [
          // Price is usually important, keep it full width or top
          buildSlider(
            label: AppLocalizations.of(context)!.priceRange,
            currentRange: priceRange,
            max: maxPrice,
            onChanged: onPriceChanged,
            badgeUnit: 'PLN',
            step: 1,
          ),
          const SizedBox(height: 8),
          // Grid for Macros
          Row(
            children: [
              Expanded(
                child: buildSlider(
                  label: AppLocalizations.of(context)!.caloriesRange,
                  currentRange: calorieRange,
                  max: maxCalories,
                  onChanged: onCaloriesChanged,
                  badgeUnit: 'kcal',
                  step: 50,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: buildSlider(
                  label: AppLocalizations.of(context)!.proteinRange,
                  currentRange: proteinRange,
                  max: maxProtein,
                  onChanged: onProteinChanged,
                  badgeUnit: 'g',
                  step: 5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: buildSlider(
                  label: AppLocalizations.of(context)!.fatRange,
                  currentRange: fatRange,
                  max: maxFat,
                  onChanged: onFatChanged,
                  badgeUnit: 'g',
                  step: 5,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: buildSlider(
                  label: AppLocalizations.of(context)!.carbsRange,
                  currentRange: carbRange,
                  max: maxCarbs,
                  onChanged: onCarbsChanged,
                  badgeUnit: 'g',
                  step: 5,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Helper class to track and dynamically update filter limits (growing max strategy).
class FilterLimitTracker {
  // Default safety buffers (higher than typical values to avoid initial clipping)
  double maxPrice = 0;
  double maxCalories = 0;
  double maxProtein = 0;
  double maxFat = 0;
  double maxCarbs = 0;

  void updateFrom<T>(
    List<T> items, {
    required double? Function(T) getPricePLN,
    required double? Function(T) getCalories,
    required double? Function(T) getProtein,
    required double? Function(T) getFat,
    required double? Function(T) getCarbs,
  }) {
    for (final item in items) {
      final p = getPricePLN(item);
      if (p != null && p > maxPrice) maxPrice = p;

      final c = getCalories(item);
      if (c != null && c > maxCalories) maxCalories = c;

      final pr = getProtein(item);
      if (pr != null && pr > maxProtein) maxProtein = pr;

      final f = getFat(item);
      if (f != null && f > maxFat) maxFat = f;

      final cb = getCarbs(item);
      if (cb != null && cb > maxCarbs) maxCarbs = cb;
    }
  }
}
