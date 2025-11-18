import 'package:catering_flutter/features/owner/models/meal_plan_model.dart';

class OrderItem {
  final int id;
  final MealPlan mealPlan;
  final int quantity;

  OrderItem({
    required this.id,
    required this.mealPlan,
    required this.quantity,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      id: json['id'],
      mealPlan: MealPlan.fromJson(json['mealPlan']),
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'mealPlan': mealPlan.toJson(),
      'quantity': quantity,
    };
  }
}