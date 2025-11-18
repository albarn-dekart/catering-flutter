import 'package:catering_flutter/features/authentication/models/user.dart';
import 'package:catering_flutter/features/owner/models/category_model.dart';
import 'package:catering_flutter/features/owner/models/meal_model.dart';
import 'package:catering_flutter/features/owner/models/meal_plan_model.dart';
import 'package:catering_flutter/features/customer/models/order_model.dart';

class Restaurant {
  final int id;
  final String name;
  final String? description;
  final String? imageUrl;
  final User? owner;
  final List<Category> categories;
  final List<Meal> meals;
  final List<MealPlan> mealPlans;
  final List<Order> orders;

  Restaurant({
    required this.id,
    required this.name,
    this.description,
    this.imageUrl,
    this.owner,
    this.categories = const [],
    this.meals = const [],
    this.mealPlans = const [],
    this.orders = const [],
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      owner: json['owner'] != null ? User.fromJson(json['owner']) : null,
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      meals: (json['meals'] as List<dynamic>?)
              ?.map((e) => Meal.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      mealPlans: (json['mealPlans'] as List<dynamic>?)
              ?.map((e) => MealPlan.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      orders: (json['orders'] as List<dynamic>?)
              ?.map((e) => Order.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'owner': owner?.toJson(),
      'categories': categories.map((e) => e.toJson()).toList(),
      'meals': meals.map((e) => e.toJson()).toList(),
      'mealPlans': mealPlans.map((e) => e.toJson()).toList(),
      'orders': orders.map((e) => e.toJson()).toList(),
    };
  }

  Restaurant copyWith({
    int? id,
    String? name,
    String? description,
    String? imageUrl,
    User? owner,
    List<Category>? categories,
    List<Meal>? meals,
    List<MealPlan>? mealPlans,
    List<Order>? orders,
  }) {
    return Restaurant(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      owner: owner ?? this.owner,
      categories: categories ?? this.categories,
      meals: meals ?? this.meals,
      mealPlans: mealPlans ?? this.mealPlans,
      orders: orders ?? this.orders,
    );
  }
}