import 'package:catering_flutter/core/utils/iri_helper.dart';
import 'package:catering_flutter/core/widgets/custom_cached_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/core/app_routes.dart';
import 'package:catering_flutter/features/restaurant/services/meal_service.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';
import 'package:catering_flutter/core/widgets/searchable_list_screen.dart';

class RestaurantMealsScreen extends StatefulWidget {
  final String restaurantIri;

  const RestaurantMealsScreen({super.key, required this.restaurantIri});

  @override
  State<RestaurantMealsScreen> createState() => _RestaurantMealsScreenState();
}

class _RestaurantMealsScreenState extends State<RestaurantMealsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MealService>().fetchMealsByRestaurant(widget.restaurantIri);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MealService>(
      builder: (context, mealService, child) {
        return SearchableListScreen<Meal>(
          title: 'Manage Meals',
          items: mealService.meals,
          isLoading: mealService.isLoading || mealService.isFetchingMore,
          onLoadMore: () => mealService.loadMoreMeals(widget.restaurantIri),
          searchHint: 'Search meals...',
          filter: (meal, query) =>
              meal.name.toLowerCase().contains(query) ||
              (meal.description?.toLowerCase().contains(query) ?? false),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              context.push(
                Uri(
                  path: AppRoutes.restaurantMealForm,
                  queryParameters: {
                    'restaurantId': IriHelper.getId(widget.restaurantIri),
                  },
                ).toString(),
              );
            },
            icon: const Icon(Icons.add),
            label: const Text('Add Meal'),
          ),
          onRefresh: () async {
            await mealService.fetchMealsByRestaurant(widget.restaurantIri);
          },
          itemBuilder: (context, meal) {
            return Card(
              elevation: 2,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(12),
                leading: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Theme.of(
                      context,
                    ).colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: meal.imageUrl != null && meal.imageUrl!.isNotEmpty
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: CustomCachedImage(
                            imageUrl: meal.imageUrl,
                            fit: BoxFit.cover,
                          ),
                        )
                      : Icon(
                          Icons.fastfood,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                ),
                title: Text(
                  meal.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  meal.description ?? 'No description',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit_outlined),
                      onPressed: () {
                        context.push(
                          Uri(
                            path: AppRoutes.restaurantMealForm,
                            queryParameters: {
                              'restaurantId': IriHelper.getId(
                                widget.restaurantIri,
                              ),
                            },
                          ).toString(),
                          extra: meal,
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete_outline),
                      color: Theme.of(context).colorScheme.error,
                      onPressed: () async {
                        final confirm = await showDialog<bool>(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Delete Meal'),
                            content: Text(
                              'Are you sure you want to delete "${meal.name}"?',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context, false),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, true),
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.red,
                                ),
                                child: const Text('Delete'),
                              ),
                            ],
                          ),
                        );

                        if (confirm == true && context.mounted) {
                          try {
                            await mealService.deleteMeal(meal.id);
                            if (context.mounted) {
                              UIErrorHandler.showSnackBar(
                                context,
                                'Meal deleted successfully!',
                                isError: false,
                              );
                            }
                          } catch (e) {
                            if (context.mounted) {
                              UIErrorHandler.handleError(
                                context,
                                e,
                                customMessage: 'Failed to delete meal',
                              );
                            }
                          }
                        }
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
