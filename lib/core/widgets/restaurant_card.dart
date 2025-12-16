import 'package:catering_flutter/core/app_router.dart';
import 'package:catering_flutter/core/widgets/app_card.dart';
import 'package:catering_flutter/core/utils/iri_helper.dart';
import 'package:catering_flutter/core/widgets/custom_cached_image.dart';
import 'package:catering_flutter/core/widgets/macro_badge.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:catering_flutter/l10n/app_localizations.dart';

class RestaurantCard extends StatelessWidget {
  final String id;
  final String name;
  final String? description;
  final String? imageUrl;
  final int? orderCount;
  final List<String>? categories;
  final VoidCallback? onTap;
  final Widget? actions;

  const RestaurantCard({
    super.key,
    required this.id,
    required this.name,
    this.description,
    this.imageUrl,
    this.orderCount,
    this.categories,
    this.onTap,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppCard(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      padding: EdgeInsets.zero,
      onTap:
          onTap ??
          () {
            context.push(
              Uri(
                path: AppRoutes.mealPlansByRestaurant,
                queryParameters: {'restaurantId': IriHelper.getId(id)},
              ).toString(),
            );
          },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Restaurant Image
          SizedBox(
            height: 140,
            width: double.infinity,
            child: imageUrl != null && imageUrl!.isNotEmpty
                ? CustomCachedImage(imageUrl: imageUrl, fit: BoxFit.cover)
                : Container(
                    color: theme.colorScheme.surfaceContainerHighest,
                    child: Center(
                      child: Icon(
                        Icons.restaurant,
                        size: 48,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (onTap !=
                        null) // Show arrow if custom tap (usually implies navigation list)
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: theme.colorScheme.primary,
                      ),
                  ],
                ),
                if (categories != null && categories!.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 4,
                    children: categories!.map((c) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.secondaryContainer,
                          borderRadius: BorderRadius.circular(8),
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
                const SizedBox(height: 4),
                // Description
                if (description != null && description!.isNotEmpty)
                  Text(
                    description!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                const SizedBox(height: 8),
                // Order count badge
                if (orderCount != null)
                  MacroBadge(
                    text: AppLocalizations.of(
                      context,
                    )!.ordersCount(orderCount!),
                    icon: Icons.trending_up,
                  ),

                if (actions != null) ...[const SizedBox(height: 8), actions!],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
