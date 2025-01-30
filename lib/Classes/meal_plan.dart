import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:catering_app/Classes/api_config.dart';

import 'package:catering_app/Classes/notification_bar.dart';
import 'package:catering_app/Classes/build_image.dart';
import 'package:catering_app/Classes/meal.dart';
import 'package:catering_app/Classes/app_theme.dart';
import 'package:catering_app/Classes/authorization.dart';

class MealPlan {
  final int? id;
  final String name;
  final String? description;
  final String? imageUrl;
  final List<Meal> meals;
  bool isSelected;

  MealPlan({
    this.id,
    required this.name,
    required this.meals,
    this.description,
    this.imageUrl,
    this.isSelected = false,
  });

  factory MealPlan.fromJson(Map<String, dynamic> json) {
    return MealPlan(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      meals: (json['meals'] as List<dynamic>)
          .map((meal) => Meal.fromJson(meal as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'meals': meals.map((meal) => {"id": meal.id}).toList(),
    };
  }

  static Future<List<MealPlan>> fetch() async {
    List<MealPlan> mealPlans = [];

    try {
      final response = await http.get(ApiConfig.getMealPlansUrl());
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List<dynamic>;
        mealPlans = data
            .map((plan) => MealPlan.fromJson(plan as Map<String, dynamic>))
            .toList();
      } else {
        NotificationBar().show(
          'Failed to load meal plans',
          Colors.red,
          '${response.statusCode} - ${jsonDecode(response.body)['message']}',
        );
      }
    } catch (error) {
      NotificationBar().show(
        'Failed to load meal plans',
        Colors.red,
        error.toString(),
      );
    }

    return mealPlans;
  }

  Future<void> save() async {
    try {
      final token = await Authorization.getValidToken();
      if (token == null) {
        return;
      }

      final response = id == null
          ? await http.post(
              ApiConfig.createMealPlanUrl(),
              body: jsonEncode(toJson()),
              headers: {
                'Content-Type': 'application/json',
                'Authorization': 'Bearer $token',
              },
            )
          : await http.put(
              ApiConfig.updateMealPlanUrl(id!.toString()),
              body: jsonEncode(toJson()),
              headers: {
                'Content-Type': 'application/json',
                'Authorization': 'Bearer $token',
              },
            );

      if (response.statusCode == 201) {
        NotificationBar().show('Meal Plan saved!', Colors.green);
      } else {
        final error =
            '${response.statusCode.toString()} - ${jsonDecode(response.body)['message'] ?? 'Unknown error'}';
        NotificationBar().show(
          'Failed to save Meal Plan',
          Colors.red,
          error,
        );
      }
    } catch (error) {
      NotificationBar()
          .show('Failed to save Meal Plan', Colors.red, error.toString());
    }
  }

  Future<void> delete() async {
    try {
      final token = await Authorization.getValidToken();
      if (token == null) {
        return;
      }

      final response = await http.delete(
        ApiConfig.deleteMealPlanUrl(id.toString()),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 204) {
        NotificationBar().show('Meal Plan deleted!', Colors.green);
      } else {
        final error =
            '${response.statusCode.toString()} - ${jsonDecode(response.body)['message'] ?? 'Unknown error'}';
        NotificationBar().show('Failed to delete Meal Plan', Colors.red, error);
      }
    } catch (error) {
      NotificationBar()
          .show('Failed to delete Meal Plan', Colors.red, error.toString());
    }
  }
}

class MealPlanCard extends StatefulWidget {
  final MealPlan mealPlan;
  final VoidCallback? onEdit;
  final VoidCallback? onSelect;
  final ValueChanged<int>? onDelete;
  final bool isAdmin;

  const MealPlanCard({
    super.key,
    required this.mealPlan,
    this.onEdit,
    this.onDelete,
    this.onSelect,
    this.isAdmin = false,
  });

  @override
  _MealPlanCard createState() => _MealPlanCard();
}

class _MealPlanCard extends State<MealPlanCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildImage(widget.mealPlan.imageUrl, 100),
                const SizedBox(width: AppTheme.defaultPadding),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title and buttons row
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.mealPlan.name,
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                if (widget.mealPlan.description != null)
                                  Text(
                                    widget.mealPlan.description!,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                              ],
                            ),
                          ),
                          if (widget.isAdmin)
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                OutlinedButton.icon(
                                  onPressed: widget.onEdit,
                                  icon:
                                      const Icon(Icons.edit_outlined, size: 18),
                                  label: const Text('EDIT'),
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: AppTheme.primaryColor,
                                    side: const BorderSide(
                                        color: AppTheme.primaryColor),
                                  ),
                                ),
                                const SizedBox(
                                    width: AppTheme.defaultPadding / 2),
                                OutlinedButton.icon(
                                  onPressed: _confirmDelete,
                                  icon: const Icon(Icons.delete_outlined,
                                      size: 18, color: Colors.red),
                                  label: const Text('DELETE'),
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: Colors.red,
                                    side: const BorderSide(color: Colors.red),
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppTheme.defaultPadding),
            ...widget.mealPlan.meals.map((meal) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: MealCard(meal: meal),
                )),
            Align(
              alignment: Alignment.centerRight,
              child: Wrap(
                spacing: AppTheme.defaultPadding / 2,
                runSpacing: AppTheme.defaultPadding / 2,
                alignment: WrapAlignment.end,
                children: [
                  if (!widget.isAdmin)
                    OutlinedButton.icon(
                      onPressed: widget.onSelect,
                      icon: widget.mealPlan.isSelected
                          ? const Icon(Icons.cancel_outlined,
                              size: 18, color: AppTheme.secondaryColor)
                          : const Icon(Icons.check_circle_outlined, size: 18),
                      label: Text(widget.mealPlan.isSelected
                          ? 'Deselect'
                          : 'Select Plan'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: widget.mealPlan.isSelected
                            ? AppTheme.secondaryColor
                            : AppTheme.primaryColor,
                        side: BorderSide(
                          color: widget.mealPlan.isSelected
                              ? AppTheme.secondaryColor
                              : AppTheme.primaryColor,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _confirmDelete() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete Meal Plan?',
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
            child: const Text('CANCEL'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('DELETE', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await widget.mealPlan.delete();
      widget.onDelete!(widget.mealPlan.id!);
    }
  }
}
