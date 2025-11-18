import 'package:catering_flutter/features/owner/models/meal_plan_model.dart';

class CartItem {
  final MealPlan mealPlan;
  int quantity;
  final int restaurantId;

  CartItem({
    required this.mealPlan,
    required this.quantity,
    required this.restaurantId,
  });
}
