import 'package:catering_flutter/features/owner/models/restaurant_model.dart';
import 'package:catering_flutter/features/owner/models/meal_plan_model.dart';

class Category {
  final int id;
  final String name;
  final List<Restaurant> restaurants;
  final List<MealPlan> mealPlans;

  Category({
    required this.id,
    required this.name,
    this.restaurants = const [],
    this.mealPlans = const [],
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      restaurants: (json['restaurants'] as List<dynamic>?)
              ?.map((e) => Restaurant.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      mealPlans: (json['mealPlans'] as List<dynamic>?)
              ?.map((e) => MealPlan.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'restaurants': restaurants.map((e) => e.toJson()).toList(),
      'mealPlans': mealPlans.map((e) => e.toJson()).toList(),
    };
  }
}