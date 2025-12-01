import 'package:catering_flutter/core/utils/iri_helper.dart';
import 'package:catering_flutter/core/utils/image_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/core/app_routes.dart';
import 'package:catering_flutter/features/restaurant/services/meal_service.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';
import 'package:catering_flutter/core/widgets/responsive_grid.dart';

class ManageMealsScreen extends StatefulWidget {
  final String restaurantIri;

  const ManageMealsScreen({super.key, required this.restaurantIri});

  @override
  State<ManageMealsScreen> createState() => _ManageMealsScreenState();
}

class _ManageMealsScreenState extends State<ManageMealsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MealService>().fetchMealsByRestaurant(widget.restaurantIri);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Manage Meals',
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(
            Uri(
              path: AppRoutes.mealForm,
              queryParameters: {
                'restaurantId': IriHelper.getId(widget.restaurantIri),
              },
            ).toString(),
          );
        },
        child: const Icon(Icons.add),
      ),
      child: Consumer<MealService>(
        builder: (context, mealService, child) {
          if (mealService.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (mealService.hasError) {
            return Center(child: Text(mealService.errorMessage!));
          } else if (mealService.meals.isEmpty) {
            return const Center(child: Text('No meals found.'));
          } else {
            final meals = mealService.meals;
            return ResponsiveGridBuilder(
              itemCount: meals.length,
              childAspectRatio: 2.5,
              itemBuilder: (context, index) {
                final meal = meals[index];
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
                            meal.imageUrl != null && meal.imageUrl!.isNotEmpty
                            ? Image.network(
                                ImageHelper.getFullImageUrl(meal.imageUrl!)!,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    Icon(
                                      Icons.fastfood,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onSurfaceVariant,
                                    ),
                              )
                            : Icon(
                                Icons.fastfood,
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
                                meal.name,
                                style: Theme.of(context).textTheme.titleMedium
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                meal.description ?? 'No description',
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
                                          path: AppRoutes.mealForm,
                                          queryParameters: {
                                            'restaurantId': IriHelper.getId(
                                              widget.restaurantIri,
                                            ),
                                          },
                                        ).toString(),
                                        extra: meal,
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
                                        await mealService.deleteMeal(meal.id);
                                        if (!context.mounted) return;

                                        UIErrorHandler.showSnackBar(
                                          context,
                                          'Meal deleted successfully!',
                                          isError: false,
                                        );
                                        mealService.fetchMealsByRestaurant(
                                          widget.restaurantIri,
                                        );
                                      } catch (e) {
                                        if (!context.mounted) return;
                                        UIErrorHandler.handleError(
                                          context,
                                          e,
                                          customMessage:
                                              'Failed to delete Meal',
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
