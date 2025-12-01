import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/core/app_routes.dart';
import 'package:catering_flutter/features/restaurant/services/meal_plan_service.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';
import 'package:catering_flutter/core/utils/iri_helper.dart';
import 'package:catering_flutter/core/utils/image_helper.dart';
import 'package:catering_flutter/core/widgets/searchable_list_screen.dart';

class RestaurantMealPlansScreen extends StatefulWidget {
  final String restaurantIri;

  const RestaurantMealPlansScreen({super.key, required this.restaurantIri});

  @override
  State<RestaurantMealPlansScreen> createState() => _RestaurantMealPlansScreenState();
}

class _RestaurantMealPlansScreenState extends State<RestaurantMealPlansScreen> {
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
    return Consumer<MealPlanService>(
      builder: (context, mealPlanService, child) {
        return SearchableListScreen<MealPlan>(
          title: 'Manage Meal Plans',
          items: mealPlanService.mealPlans,
          isLoading: mealPlanService.isLoading,
          searchHint: 'Search meal plans...',
          filter: (mealPlan, query) =>
              mealPlan.name.toLowerCase().contains(query) ||
              (mealPlan.description?.toLowerCase().contains(query) ?? false),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              context.push(
                Uri(
                  path: AppRoutes.restaurantMealPlanForm,
                  queryParameters: {
                    'restaurantId': IriHelper.getId(widget.restaurantIri),
                  },
                ).toString(),
              );
            },
            icon: const Icon(Icons.add),
            label: const Text('Add Meal Plan'),
          ),
          onRefresh: () async {
            await mealPlanService.fetchMealPlansByRestaurant(
              widget.restaurantIri,
            );
          },
          itemBuilder: (context, mealPlan) {
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
                  child:
                      mealPlan.imageUrl != null && mealPlan.imageUrl!.isNotEmpty
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            ImageHelper.getFullImageUrl(mealPlan.imageUrl!)!,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => Icon(
                              Icons.restaurant_menu,
                              color: Theme.of(
                                context,
                              ).colorScheme.onSurfaceVariant,
                            ),
                          ),
                        )
                      : Icon(
                          Icons.restaurant_menu,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                ),
                title: Text(
                  mealPlan.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  mealPlan.description ?? 'No description',
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
                            path: AppRoutes.restaurantMealPlanForm,
                            queryParameters: {
                              'restaurantId': IriHelper.getId(
                                widget.restaurantIri,
                              ),
                            },
                          ).toString(),
                          extra: mealPlan,
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
                            title: const Text('Delete Meal Plan'),
                            content: Text(
                              'Are you sure you want to delete "${mealPlan.name}"?',
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
                            await mealPlanService.deleteMealPlan(mealPlan.id);
                            if (context.mounted) {
                              UIErrorHandler.showSnackBar(
                                context,
                                'Meal Plan deleted successfully!',
                                isError: false,
                              );
                            }
                          } catch (e) {
                            if (context.mounted) {
                              UIErrorHandler.handleError(
                                context,
                                e,
                                customMessage: 'Failed to delete meal plan',
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
