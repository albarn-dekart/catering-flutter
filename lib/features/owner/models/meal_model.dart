import 'package:catering_flutter/features/owner/models/restaurant_model.dart';
import 'package:catering_flutter/features/owner/models/meal_plan_model.dart';

class Meal {
  final int id;
  final String name;
  final String? description;
  final double? calories;
  final double? protein;
  final double? fat;
  final double? carbs;
  final int price;
  final Restaurant? restaurant;
  final List<MealPlan> mealPlans;
  final String? imageUrl;

  Meal({
    required this.id,
    required this.name,
    this.description,
    this.calories,
    this.protein,
    this.fat,
    this.carbs,
    required this.price,
    this.restaurant,
    this.mealPlans = const [],
    this.imageUrl,
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      calories: (json['calories'] as num?)?.toDouble(),
      protein: (json['protein'] as num?)?.toDouble(),
      fat: (json['fat'] as num?)?.toDouble(),
      carbs: (json['carbs'] as num?)?.toDouble(),
      price: json['price'] / 100,
      restaurant: json['restaurant'] != null
          ? Restaurant.fromJson(json['restaurant'])
          : null,
      mealPlans: (json['mealPlans'] as List<dynamic>?)
              ?.map((e) => MealPlan.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'calories': calories,
      'protein': protein,
      'fat': fat,
      'carbs': carbs,
      'price': price * 100,
      'restaurant': restaurant?.toJson(),
      'mealPlans': mealPlans.map((e) => e.toJson()).toList(),
      'imageUrl': imageUrl,
    };
  }
}