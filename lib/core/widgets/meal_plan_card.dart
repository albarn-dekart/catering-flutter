import 'package:catering_flutter/core/app_router.dart';
import 'package:catering_flutter/core/widgets/app_card.dart';
import 'package:catering_flutter/core/utils/iri_helper.dart';
import 'package:catering_flutter/core/widgets/custom_cached_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:catering_flutter/l10n/app_localizations.dart';
import 'package:catering_flutter/core/widgets/macro_badge.dart';
import 'package:catering_flutter/core/widgets/price_text.dart';

class MealPlanCard extends StatelessWidget {
  final String id;
  final String name;
  final String? imageUrl;
  final String? restaurantName;
  final String? description;
  final double price;
  final int? orderCount;
  final VoidCallback? onTap;

  final double? calories;
  final double? protein;
  final double? fat;
  final double? carbs;
  final List<String>? dietCategories;
  final Widget? actions;

  const MealPlanCard({
    super.key,
    required this.id,
    required this.name,
    this.imageUrl,
    this.restaurantName,
    this.description,
    required this.price,
    this.orderCount,
    this.onTap,
    this.calories,
    this.protein,
    this.fat,
    this.carbs,
    this.dietCategories,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppCard(
      clipBehavior: Clip.antiAlias,
      padding: EdgeInsets.zero,
      onTap:
          onTap ??
          () {
            context.push(
              Uri(
                path: AppRoutes.mealPlanDetails,
                queryParameters: {'id': IriHelper.getId(id)},
              ).toString(),
            );
          },
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isConstrained = constraints.maxHeight < double.infinity;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Image
              SizedBox(
                height: 140,
                width: double.infinity,
                child: imageUrl != null && imageUrl!.isNotEmpty
                    ? CustomCachedImage(imageUrl: imageUrl, fit: BoxFit.cover)
                    : Container(
                        color: theme.colorScheme.surfaceContainerHighest,
                        child: Icon(
                          Icons.restaurant_menu,
                          size: 48,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
              ),
              // Content
              isConstrained
                  ? Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: _buildContent(context, theme, useSpacer: true),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: _buildContent(context, theme, useSpacer: false),
                    ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    ThemeData theme, {
    required bool useSpacer,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Meal plan name
        Text(
          name,
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        // Restaurant name
        if (restaurantName != null)
          Text(
            restaurantName!,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.primary,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        const SizedBox(height: 8),
        // Description
        if (description != null && description!.isNotEmpty)
          Text(
            description!,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              height: 1.3,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),

        if (calories != null ||
            protein != null ||
            fat != null ||
            carbs != null) ...[
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              if (calories != null)
                MacroBadge(
                  text:
                      '${AppLocalizations.of(context)!.calories}: ${calories!.toStringAsFixed(0)}',
                  icon: Icons.local_fire_department_outlined,
                ),
              if (protein != null)
                MacroBadge(
                  text:
                      '${AppLocalizations.of(context)!.protein}: ${protein!.toStringAsFixed(1)}g',
                  icon: Icons.fitness_center_outlined,
                ),
              if (fat != null)
                MacroBadge(
                  text:
                      '${AppLocalizations.of(context)!.fat}: ${fat!.toStringAsFixed(1)}g',
                  icon: Icons.water_drop_outlined,
                ),
              if (carbs != null)
                MacroBadge(
                  text:
                      '${AppLocalizations.of(context)!.carbs}: ${carbs!.toStringAsFixed(1)}g',
                  icon: Icons.grain_outlined,
                ),
            ],
          ),
        ],

        if (dietCategories != null && dietCategories!.isNotEmpty) ...[
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: dietCategories!.map((c) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: theme.colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  c,
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: theme.colorScheme.onSecondaryContainer,
                  ),
                ),
              );
            }).toList(),
          ),
        ],

        if (useSpacer) const Spacer() else const SizedBox(height: 16),
        // Price and order count
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PriceText.fromDouble(
              priceGroszy: price,
              suffix: AppLocalizations.of(context)!.perDay,
              style: theme.textTheme.titleLarge?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (orderCount != null)
              MacroBadge(
                text: '$orderCount',
                icon: Icons.local_fire_department,
              ),
          ],
        ),

        if (actions != null) ...[const SizedBox(height: 8), actions!],
      ],
    );
  }
}
