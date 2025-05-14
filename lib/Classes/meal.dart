import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:catering_app/Classes/api_config.dart';
import 'package:catering_app/Classes/notification_bar.dart';
import 'package:catering_app/Classes/app_theme.dart';
import 'package:catering_app/Classes/authorization.dart';
import 'package:catering_app/Classes/category.dart';
import 'package:catering_app/Classes/button.dart';

class Meal {
  final int? id;
  final String name;
  final List<Category> categories;
  final double calories;
  final double protein;
  final double fat;
  final double carbs;
  final double price;

  Meal(
      {required this.id,
      required this.name,
      required this.categories,
      required this.calories,
      required this.protein,
      required this.fat,
      required this.carbs,
      required this.price});

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is Meal && other.id == id);

  @override
  int get hashCode => id.hashCode;

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      id: json['id'],
      name: json['name'],
      categories: (json['categories'] as List<dynamic>)
          .map(
              (category) => Category.fromJson(category as Map<String, dynamic>))
          .toList(),
      calories: double.parse(json['calories']),
      protein: double.parse(json['protein']),
      fat: double.parse(json['fat']),
      carbs: double.parse(json['carbs']),
      price: double.parse(json['price']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'categories': categories.map((category) => category.id).toList(),
      'calories': calories,
      'protein': protein,
      'fat': fat,
      'carbs': carbs,
      'price': price,
    };
  }

  static Future<List<Meal>> get(String? category) async {
    List<Meal> meals = [];

    try {
      final response = await http.get(ApiConfig.meals(category));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List<dynamic>;
        meals = data
            .map((meal) => Meal.fromJson(meal as Map<String, dynamic>))
            .toList();
      } else {
        final error =
            '${response.statusCode.toString()} - ${jsonDecode(response.body)['error'] ?? 'Unknown error'}';
        NotificationBar().show('Failed to load meals', Colors.red, error);
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

  Future<bool> save() async {
    // Validation
    if (name.isEmpty || name.length > 50) {
      NotificationBar().show(
        'Meal name must not be empty and cannot exceed 50 characters',
        Colors.yellow,
      );
      return false;
    }

    if (categories.isEmpty) {
      NotificationBar().show(
        'Meal must have at least one category',
        Colors.yellow,
      );
      return false;
    }

    if (calories < 0) {
      NotificationBar().show(
        'Calories must be a non-negative number',
        Colors.yellow,
      );
      return false;
    }

    if (protein < 0) {
      NotificationBar().show(
        'Protein must be a non-negative number',
        Colors.yellow,
      );
      return false;
    }

    if (fat < 0) {
      NotificationBar().show(
        'Fat must be a non-negative number',
        Colors.yellow,
      );
      return false;
    }

    if (carbs < 0) {
      NotificationBar().show(
        'Carbs must be a non-negative number',
        Colors.yellow,
      );
      return false;
    }

    if (price <= 0) {
      NotificationBar().show(
        'Price must be greater than 0',
        Colors.yellow,
      );
      return false;
    }

    try {
      final token = await Authorization.getValidToken();
      if (token == null) return false;

      final response = id == null
          ? await http.post(
              ApiConfig.newMeal(),
              headers: {
                'Content-Type': 'application/json',
                'Authorization': 'Bearer $token',
              },
              body: jsonEncode(toJson()),
            )
          : await http.put(
              ApiConfig.updateMeal(id.toString()),
              headers: {
                'Content-Type': 'application/json',
                'Authorization': 'Bearer $token',
              },
              body: jsonEncode(toJson()),
            );

      if (response.statusCode == 201 || response.statusCode == 204) {
        NotificationBar().show('Meal saved successfully!', Colors.green);
        return true;
      } else {
        final error =
            '${response.statusCode.toString()} - ${jsonDecode(response.body)['error'] ?? 'Unknown error'}';
        NotificationBar().show(
          'Failed to save Meal',
          Colors.red,
          error,
        );
      }
    } catch (e) {
      NotificationBar().show('Error saving meal', Colors.red, e.toString());
    }
    return false;
  }

  Future<bool> delete() async {
    try {
      final token = await Authorization.getValidToken();
      if (token == null) return false;

      final response = await http.delete(
        ApiConfig.deleteMeal(id.toString()),
        headers: {'Authorization': 'Bearer $token'},
      );
      if (response.statusCode == 204) {
        NotificationBar().show('Meal deleted!', Colors.green);
        return true;
      } else {
        final error =
            '${response.statusCode.toString()} - ${jsonDecode(response.body)['error'] ?? 'Unknown error'}';
        NotificationBar().show('Failed to delete Meal', Colors.red, error);
      }
    } catch (error) {
      NotificationBar().show(
        'Failed to delete Meal',
        Colors.red,
        error.toString(),
      );
    }
    return false;
  }
}

class MealCard extends StatefulWidget {
  final Meal meal;
  final bool addToOrderButton;
  final bool removeFromOrderButton;
  final bool isAdmin;
  final VoidCallback? onAddToOrder;
  final VoidCallback? onRemoveFromOrder;
  final VoidCallback? onEdit;
  final Function(Meal)? onDelete;

  const MealCard({
    super.key,
    required this.meal,
    this.addToOrderButton = false,
    this.removeFromOrderButton = false,
    this.isAdmin = false,
    this.onAddToOrder,
    this.onRemoveFromOrder,
    this.onEdit,
    this.onDelete,
  });

  @override
  _MealCard createState() => _MealCard();
}

class _MealCard extends State<MealCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppTheme.cardRadius),
      ),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.defaultPadding / 2),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.meal.name,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: AppTheme.defaultPadding / 2),
                  Wrap(
                    spacing: 12,
                    runSpacing: 4,
                    children: [
                      _buildNutritionItem(Icons.local_fire_department,
                          '${widget.meal.calories}kcal'),
                      _buildNutritionItem(
                          Icons.fitness_center, '${widget.meal.protein}g'),
                      _buildNutritionItem(
                          Icons.local_dining, '${widget.meal.fat}g'),
                      _buildNutritionItem(Icons.grain, '${widget.meal.carbs}g'),
                    ],
                  ),
                  const SizedBox(height: AppTheme.defaultPadding / 2),
                  Text(
                    '\$${widget.meal.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            if (widget.isAdmin)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  cardButton('Edit', widget.onEdit, Icons.edit_outlined,
                      AppTheme.primaryColor),
                  const SizedBox(width: AppTheme.defaultPadding / 2),
                  cardButton('Delete', _confirmDelete, Icons.delete_outlined,
                      Colors.red),
                ],
              ),
            if (widget.addToOrderButton || widget.removeFromOrderButton)
              Column(
                children: [
                  if (widget.addToOrderButton)
                    IconButton(
                      icon: const Icon(Icons.add_circle,
                          color: AppTheme.primaryColor),
                      onPressed: widget.onAddToOrder,
                    ),
                  if (widget.removeFromOrderButton)
                    IconButton(
                      icon: const Icon(Icons.remove_circle,
                          color: AppTheme.errorColor),
                      onPressed: widget.onRemoveFromOrder,
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

  Future<void> _confirmDelete() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete Meal?',
            style: Theme.of(context).textTheme.titleMedium),
        content: const Text('This action cannot be undone'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTheme.cardRadius),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            style: TextButton.styleFrom(
              foregroundColor: AppTheme.primaryColor,
            ),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      if (await widget.meal.delete()) {
        widget.onDelete!(widget.meal);
      }
    }
  }
}
