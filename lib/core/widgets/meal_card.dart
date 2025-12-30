import 'package:catering_flutter/core/app_router.dart';
import 'package:catering_flutter/core/widgets/app_card.dart';
import 'package:catering_flutter/core/utils/iri_helper.dart';
import 'package:catering_flutter/core/widgets/custom_cached_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:catering_flutter/core/widgets/icon_badge.dart';
import 'package:catering_flutter/core/widgets/nutrient_row.dart';
import 'package:catering_flutter/core/widgets/category_badge.dart';
import 'package:catering_flutter/core/widgets/price_text.dart';

class MealCard extends StatelessWidget {
  final String? id;
  final String name;
  final String? imageUrl;
  final String? description;
  final double priceGroszy;
  final String? priceSuffix;
  final double? calories;
  final double? protein;
  final double? fat;
  final double? carbs;
  final List<String>? dietCategories;
  final String? restaurantName;
  final int? orderCount;
  final VoidCallback? onTap;
  final Widget? actions;

  const MealCard({
    super.key,
    this.id,
    required this.name,
    this.imageUrl,
    this.description,
    required this.priceGroszy,
    this.priceSuffix,
    this.calories,
    this.protein,
    this.fat,
    this.carbs,
    this.dietCategories,
    this.restaurantName,
    this.orderCount,
    this.onTap,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppCard(
      onTap:
          onTap ??
          (id != null
              ? () {
                  context.push(
                    Uri(
                      path: AppRoutes.mealPlanDetails,
                      queryParameters: {'id': IriHelper.getId(id!)},
                    ).toString(),
                  );
                }
              : null),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          SizedBox(
            height: 150,
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
          // Content - Expanded to fill available space and push actions to bottom
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name and Price Row
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          name,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 8),
                      PriceText.fromDouble(
                        priceGroszy: priceGroszy,
                        suffix: priceSuffix ?? '',
                        style: PriceText.standardStyle(context),
                      ),
                    ],
                  ),

                  // Restaurant Name
                  if (restaurantName != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      restaurantName!,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.primary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],

                  // Description
                  if (description != null && description!.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Text(
                      description!,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],

                  // Nutrients
                  if (calories != null ||
                      protein != null ||
                      fat != null ||
                      carbs != null) ...[
                    const SizedBox(height: 16),
                    NutrientRow(
                      calories: calories,
                      protein: protein,
                      fat: fat,
                      carbs: carbs,
                      compact: true,
                    ),
                  ],

                  // Diet Categories
                  if (dietCategories != null && dietCategories!.isNotEmpty) ...[
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 4,
                      children: dietCategories!
                          .map((c) => CategoryBadge(text: c))
                          .toList(),
                    ),
                  ],

                  // Order Count and Actions - Always at bottom
                  if (orderCount != null || actions != null) ...[
                    const Spacer(),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        if (orderCount != null)
                          IconBadge(
                            text: '$orderCount',
                            icon: Icons.local_fire_department,
                          ),
                        if (actions != null) ...[const Spacer(), actions!],
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
