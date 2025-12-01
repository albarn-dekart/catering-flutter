import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/core/app_routes.dart';
import 'package:catering_flutter/features/restaurant/services/meal_plan_service.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';

import 'package:catering_flutter/core/utils/iri_helper.dart';
import 'package:catering_flutter/core/utils/image_helper.dart';
import 'package:catering_flutter/core/widgets/responsive_grid.dart';

class ManageMealPlansScreen extends StatefulWidget {
  final String restaurantIri;

  const ManageMealPlansScreen({super.key, required this.restaurantIri});

  @override
  State<ManageMealPlansScreen> createState() => _ManageMealPlansScreenState();
}

class _ManageMealPlansScreenState extends State<ManageMealPlansScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MealPlanService>().fetchMealPlansByRestaurant(
        widget.restaurantIri,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Manage Meal Plans',
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(
            Uri(
              path: AppRoutes.mealPlanForm,
              queryParameters: {
                'restaurantId': IriHelper.getId(widget.restaurantIri),
              },
            ).toString(),
          );
        },
        child: const Icon(Icons.add),
      ),
      child: Consumer<MealPlanService>(
        builder: (context, mealPlanService, child) {
          if (mealPlanService.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (mealPlanService.hasError) {
            return Center(child: Text(mealPlanService.errorMessage!));
          } else if (mealPlanService.mealPlans.isEmpty) {
            return const Center(child: Text('No meal plans found.'));
          } else {
            final mealPlans = mealPlanService.mealPlans;
            return ResponsiveGridBuilder(
              itemCount: mealPlans.length,
              childAspectRatio: 2.5,
              itemBuilder: (context, index) {
                final mealPlan = mealPlans[index];
                return Card(
                  elevation: 2,
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      // Image
                      Container(
                        width: 100,
                        height: 100,
                        color: Theme.of(
                          context,
                        ).colorScheme.surfaceContainerHighest,
                        child:
                            mealPlan.imageUrl != null &&
                                mealPlan.imageUrl!.isNotEmpty
                            ? Image.network(
                                ImageHelper.getFullImageUrl(
                                  mealPlan.imageUrl!,
                                )!,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    Icon(
                                      Icons.restaurant_menu,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onSurfaceVariant,
                                    ),
                              )
                            : Icon(
                                Icons.restaurant_menu,
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurfaceVariant,
                              ),
                      ),
                      // Content
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                mealPlan.name,
                                style: Theme.of(context).textTheme.titleMedium
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                mealPlan.description ?? 'No description',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.bodySmall
                                    ?.copyWith(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onSurfaceVariant,
                                    ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton.filledTonal(
                                    icon: const Icon(Icons.edit, size: 18),
                                    onPressed: () {
                                      context.push(
                                        Uri(
                                          path: AppRoutes.mealPlanForm,
                                          queryParameters: {
                                            'restaurantId': IriHelper.getId(
                                              widget.restaurantIri,
                                            ),
                                          },
                                        ).toString(),
                                        extra: mealPlan,
                                      );
                                    },
                                    constraints: const BoxConstraints(
                                      minWidth: 32,
                                      minHeight: 32,
                                    ),
                                    padding: EdgeInsets.zero,
                                  ),
                                  const SizedBox(width: 8),
                                  IconButton.filledTonal(
                                    icon: const Icon(Icons.delete, size: 18),
                                    style: IconButton.styleFrom(
                                      backgroundColor: Theme.of(
                                        context,
                                      ).colorScheme.errorContainer,
                                      foregroundColor: Theme.of(
                                        context,
                                      ).colorScheme.onErrorContainer,
                                    ),
                                    onPressed: () async {
                                      try {
                                        await mealPlanService.deleteMealPlan(
                                          mealPlan.id,
                                        );
                                        if (!context.mounted) return;

                                        UIErrorHandler.showSnackBar(
                                          context,
                                          'Meal Plan deleted successfully!',
                                          isError: false,
                                        );
                                        mealPlanService
                                            .fetchMealPlansByRestaurant(
                                              widget.restaurantIri,
                                            );
                                      } catch (e) {
                                        if (!context.mounted) return;
                                        UIErrorHandler.handleError(
                                          context,
                                          e,
                                          customMessage:
                                              'Failed to delete Meal Plan',
                                        );
                                      }
                                    },
                                    constraints: const BoxConstraints(
                                      minWidth: 32,
                                      minHeight: 32,
                                    ),
                                    padding: EdgeInsets.zero,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
