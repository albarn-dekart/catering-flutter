import 'package:catering_flutter/core/widgets/icon_badge.dart';
import 'package:catering_flutter/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class NutrientRow extends StatelessWidget {
  final double? calories;
  final double? protein;
  final double? fat;
  final double? carbs;
  final bool compact;

  const NutrientRow({
    super.key,
    this.calories,
    this.protein,
    this.fat,
    this.carbs,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    // Return empty if no nutrients
    if (calories == null && protein == null && fat == null && carbs == null) {
      return const SizedBox.shrink();
    }

    // Also avoid 0 values being shown if they are the only thing?
    // Usually we want to show 0g if available, but let's stick to non-null checks as per usage.

    final l10n = AppLocalizations.of(context)!;

    return Wrap(
      spacing: 8,
      runSpacing: 4,
      children: [
        if (calories != null)
          _buildBadge(
            context,
            compact
                ? '${calories!.toStringAsFixed(0)} kcal'
                : '${l10n.calories}: ${calories!.toStringAsFixed(0)}',
            Icons.local_fire_department_outlined,
          ),
        if (protein != null)
          _buildBadge(
            context,
            compact
                ? 'P: ${protein!.toStringAsFixed(1)}g'
                : '${l10n.protein}: ${protein!.toStringAsFixed(1)}g',
            Icons.fitness_center_outlined,
          ),
        if (fat != null)
          _buildBadge(
            context,
            compact
                ? 'F: ${fat!.toStringAsFixed(1)}g'
                : '${l10n.fat}: ${fat!.toStringAsFixed(1)}g',
            Icons.water_drop_outlined,
          ),
        if (carbs != null)
          _buildBadge(
            context,
            compact
                ? 'C: ${carbs!.toStringAsFixed(1)}g'
                : '${l10n.carbs}: ${carbs!.toStringAsFixed(1)}g',
            Icons.grain_outlined,
          ),
      ],
    );
  }

  Widget _buildBadge(BuildContext context, String text, IconData icon) {
    return IconBadge(text: text, icon: icon);
  }
}
