import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/core/app_routes.dart';
import 'package:catering_flutter/features/owner/services/meal_plan_service.dart';
import 'package:catering_flutter/features/owner/services/restaurant_service.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart'; // Import CustomScaffold

class ManageMealPlansScreen extends StatefulWidget {
  const ManageMealPlansScreen({super.key});

  @override
  State<ManageMealPlansScreen> createState() => _ManageMealPlansScreenState();
}

class _ManageMealPlansScreenState extends State<ManageMealPlansScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final restaurantService = context.read<RestaurantService>();
      if (restaurantService.currentRestaurant != null) {
        context.read<MealPlanService>().getMealPlans(
          restaurantService.currentRestaurant!.id,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Manage Meal Plans',
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
            return ListView.builder(
              itemCount: mealPlans.length,
              itemBuilder: (context, index) {
                final mealPlan = mealPlans[index];
                return ListTile(
                  title: Text(mealPlan.name),
                  subtitle: Text(mealPlan.description ?? ''),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          context.push(AppRoutes.saveMealPlan, extra: mealPlan);
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () async {
                          await mealPlanService.deleteMealPlan(mealPlan.id);
                          if (!context.mounted) return;
                          if (mealPlanService.isSuccess) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Meal Plan deleted successfully!',
                                ),
                              ),
                            );
                            final restaurantService = context
                                .read<RestaurantService>();
                            if (restaurantService.currentRestaurant != null) {
                              mealPlanService.getMealPlans(
                                restaurantService.currentRestaurant!.id,
                              );
                            }
                          } else if (mealPlanService.hasError) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Failed to delete Meal Plan: ${mealPlanService.errorMessage}',
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
