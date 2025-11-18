import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/features/owner/services/meal_plan_service.dart';
import 'package:catering_flutter/features/owner/models/meal_model.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart'; // Import CustomScaffold

class MealPlanDetailScreen extends StatefulWidget {
  final int mealPlanId;

  const MealPlanDetailScreen({super.key, required this.mealPlanId});

  @override
  State<MealPlanDetailScreen> createState() => _MealPlanDetailScreenState();
}

class _MealPlanDetailScreenState extends State<MealPlanDetailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MealPlanService>().getMealPlanById(widget.mealPlanId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Meal Plan Details',
      child: Consumer<MealPlanService>(
        builder: (context, mealPlanService, child) {
          if (mealPlanService.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (mealPlanService.hasError) {
            return Center(child: Text(mealPlanService.errorMessage!));
          } else if (mealPlanService.mealPlanDetails != null) {
            final mealPlan = mealPlanService.mealPlanDetails!;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (mealPlan.imageUrl != null &&
                      mealPlan.imageUrl!.isNotEmpty)
                    Image.network(
                      mealPlan.imageUrl!,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.broken_image, size: 200),
                    ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          mealPlan.name,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          mealPlan.description ?? '',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Price: ${(mealPlan.price).toStringAsFixed(2)} PLN/day',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Meals in this plan:',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 8),
                        ...mealPlan.meals.map(
                          (meal) => _buildMealCard(context, meal),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return const Center(child: Text('No meal plan data.'));
        },
      ),
    );
  }

  Widget _buildMealCard(BuildContext context, Meal meal) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(meal.name, style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(height: 4),
            Text(
              meal.description ?? '',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Price: ${meal.price.toStringAsFixed(2)}'),
                Row(
                  children: [
                    Text('Cal: ${meal.calories}'),
                    const SizedBox(width: 8),
                    Text('Prot: ${meal.protein}'),
                    const SizedBox(width: 8),
                    Text('Fat: ${meal.fat}'),
                    const SizedBox(width: 8),
                    Text('Carbs: ${meal.carbs}'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
