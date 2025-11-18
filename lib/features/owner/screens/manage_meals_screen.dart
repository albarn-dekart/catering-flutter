import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/core/app_routes.dart';
import 'package:catering_flutter/features/owner/services/meal_service.dart';
import 'package:catering_flutter/features/owner/services/restaurant_service.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart'; // Import CustomScaffold

class ManageMealsScreen extends StatefulWidget {
  const ManageMealsScreen({super.key});

  @override
  State<ManageMealsScreen> createState() => _ManageMealsScreenState();
}

class _ManageMealsScreenState extends State<ManageMealsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final restaurantService = context.read<RestaurantService>();
      if (restaurantService.currentRestaurant != null) {
        context.read<MealService>().getMeals(
          restaurantService.currentRestaurant!.id,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Manage Meals',
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
            return ListView.builder(
              itemCount: meals.length,
              itemBuilder: (context, index) {
                final meal = meals[index];
                return ListTile(
                  title: Text(meal.name),
                  subtitle: Text(meal.description ?? ''),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          context.push(AppRoutes.saveMeal, extra: meal);
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () async {
                          await mealService.deleteMeal(meal.id);
                          if (!context.mounted) return;
                          if (mealService.isSuccess) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Meal deleted successfully!'),
                              ),
                            );
                            final restaurantService = context
                                .read<RestaurantService>();
                            if (restaurantService.currentRestaurant != null) {
                              mealService.getMeals(
                                restaurantService.currentRestaurant!.id,
                              );
                            }
                          } else if (mealService.hasError) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Failed to delete Meal: ${mealService.errorMessage}',
                                ),
                              ),
                            );
                          }
                        },
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
