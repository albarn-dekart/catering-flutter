import 'package:catering_flutter/features/owner/models/meal_model.dart';
import 'package:catering_flutter/features/owner/models/category_model.dart';
import 'package:catering_flutter/features/owner/models/restaurant_model.dart';

class MealPlan {
  final int id;
  final String name;
  final String? description;
  final int price;
  final String? imageUrl;
  final List<Meal> meals;
  final List<Category> categories;
  final Restaurant? restaurant;

  MealPlan({
    required this.id,
    required this.name,
    this.description,
    required this.price,
    this.imageUrl,
    this.meals = const [],
    this.categories = const [],
    this.restaurant,
  });

  factory MealPlan.fromJson(Map<String, dynamic> json) {
    return MealPlan(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'] / 100,
      imageUrl: json['imageUrl'],
      meals: (json['meals'] as List<dynamic>?)
              ?.map((e) => Meal.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      restaurant: json['restaurant'] != null
          ? Restaurant.fromJson(json['restaurant'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price * 100,
      'imageUrl': imageUrl,
      'meals': meals.map((e) => e.toJson()).toList(),
      'categories': categories.map((e) => e.toJson()).toList(),
      'restaurant': restaurant?.toJson(),
    };
  }
}