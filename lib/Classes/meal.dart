import 'dart:convert';
import 'package:catering_app/Classes/build_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:catering_app/Classes/api_config.dart';
import 'package:catering_app/Classes/notification_bar.dart';
import 'package:catering_app/Classes/app_theme.dart';

class Meal {
  final int id;
  final String name;
  final List<String> categories;
  final String? imageUrl;
  final double calories;
  final double protein;
  final double fat;
  final double carbs;
  final double price;

  Meal(
      {required this.id,
        required this.name,
        required this.categories,
      required this.imageUrl,
      required this.calories,
      required this.protein,
      required this.fat,
      required this.carbs,
      required this.price});

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      id: json['id'],
      name: json['name'],
      categories: List<String>.from(json['categories']),
      imageUrl: json['imageUrl'],
      calories: double.parse(json['calories']),
      protein: double.parse(json['protein']),
      fat: double.parse(json['fat']),
      carbs: double.parse(json['carbs']),
      price: double.parse(json['price']),
    );
  }

  static Future<List<String>> fetchCategories() async {
    List<String> categories = [];

    try {
      final response = await http.get(ApiConfig.getMealCategoriesUrl());
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List<dynamic>;
        categories = data.map((category) => category.toString()).toList();
      } else {
        NotificationBar().show(
          'Failed to load categories',
          Colors.red,
          '${response.statusCode} - ${jsonDecode(response.body)['message']}',
        );
      }
    } catch (error) {
      NotificationBar().show(
        'Failed to load categories',
        Colors.red,
        error.toString(),
      );
    }

    return categories;
  }

  static Future<List<Meal>> fetch(String? category) async {
    List<Meal> meals = [];

    try {
      final response = await http.get(ApiConfig.getMealsUrl(category));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List<dynamic>;
        meals = data
            .map((plan) => Meal.fromJson(plan as Map<String, dynamic>))
            .toList();
      } else {
        NotificationBar().show(
          'Failed to load meals',
          Colors.red,
          '${response.statusCode} - ${jsonDecode(response.body)['message']}',
        );
      }
    } catch (error) {
      NotificationBar().show(
        'Failed to load meals',
        Colors.red,
        error.toString(),
      );
    }

    return meals;
  }
}

class MealCard extends StatelessWidget {
  final Meal meal;
  final bool showAddButton;
  final bool showDeleteButton;
  final VoidCallback? onAddToOrder;
  final VoidCallback? onDelete;

  const MealCard({
    super.key,
    required this.meal,
    this.showAddButton = false,
    this.showDeleteButton = false,
    this.onAddToOrder,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.defaultPadding),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildImage(meal.imageUrl, 80),
            const SizedBox(width: AppTheme.defaultPadding),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    meal.name,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: AppTheme.defaultPadding / 2),
                  Wrap(
                    spacing: 12,
                    runSpacing: 4,
                    children: [
                      _buildNutritionItem(
                          Icons.local_fire_department, '${meal.calories}kcal'),
                      _buildNutritionItem(
                          Icons.fitness_center, '${meal.protein}g'),
                      _buildNutritionItem(Icons.local_dining, '${meal.fat}g'),
                      _buildNutritionItem(Icons.grain, '${meal.carbs}g'),
                    ],
                  ),
                  const SizedBox(height: AppTheme.defaultPadding / 2),
                  Text(
                    '\$${meal.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            if (showAddButton || showDeleteButton)
              Column(
                children: [
                  if (showAddButton)
                    IconButton(
                      icon: const Icon(Icons.add_circle,
                          color: AppTheme.primaryColor),
                      onPressed: onAddToOrder,
                    ),
                  if (showDeleteButton)
                    IconButton(
                      icon: const Icon(Icons.remove_circle,
                          color: AppTheme.errorColor),
                      onPressed: onDelete,
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildNutritionItem(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: Colors.grey[600]),
        const SizedBox(width: AppTheme.defaultPadding / 4),
        Text(text, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
