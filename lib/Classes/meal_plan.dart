import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:catering_app/Classes/api_config.dart';

import 'package:catering_app/Classes/notification_bar.dart';
import 'package:catering_app/Classes/meal.dart';
import 'package:catering_app/Classes/app_theme.dart';
import 'package:catering_app/Classes/authorization.dart';
import 'package:catering_app/Classes/button.dart';
import 'package:catering_app/Classes/network_image.dart';

class MealPlan {
  final int? id;
  final String name;
  final String? description;
  final String imageFile;
  final List<Meal> meals;
  bool isSelected;

  MealPlan({
    this.id,
    required this.name,
    required this.meals,
    required this.imageFile,
    this.description,
    this.isSelected = false,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is MealPlan && other.id == id);

  @override
  int get hashCode => id.hashCode;

  factory MealPlan.fromJson(Map<String, dynamic> json) {
    return MealPlan(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageFile: json['imageFile'],
      meals: (json['meals'] as List<dynamic>)
          .map((meal) => Meal.fromJson(meal as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'imageFile': imageFile,
      'meals': meals.map((meal) => meal.id).toList(),
    };
  }

  static Future<List<MealPlan>> get() async {
    List<MealPlan> mealPlans = [];

    try {
      final response = await http.get(ApiConfig.mealPlans());
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List<dynamic>;
        mealPlans = data
            .map((plan) => MealPlan.fromJson(plan as Map<String, dynamic>))
            .toList();
      } else {
        final error =
            '${response.statusCode.toString()} - ${jsonDecode(response.body)['error'] ?? 'Unknown error'}';
        NotificationBar().show('Failed to load meal plans', Colors.red, error);
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

  Future<bool> save() async {
    // Validation
    if (name.isEmpty || name.length > 50) {
      NotificationBar().show(
        'Meal plan name must not be empty and cannot exceed 50 characters',
        Colors.yellow,
      );
      return false;
    }

    if (description!.isEmpty || description!.length > 500) {
      NotificationBar().show(
        'Description must not be empty and cannot exceed 500 characters',
        Colors.yellow,
      );
      return false;
    }

    if (meals.isEmpty) {
      NotificationBar().show(
        'Meal plan must have at least one meal',
        Colors.yellow,
      );
      return false;
    }

    try {
      final token = await Authorization.getValidToken();
      if (token == null) return false;

      final response = id == null
          ? await http.post(
              ApiConfig.newMealPlan(),
              body: jsonEncode(toJson()),
              headers: {
                'Content-Type': 'application/json',
                'Authorization': 'Bearer $token',
              },
            )
          : await http.put(
              ApiConfig.updateMealPlan(id!.toString()),
              body: jsonEncode(toJson()),
              headers: {
                'Content-Type': 'application/json',
                'Authorization': 'Bearer $token',
              },
            );

      if (response.statusCode == 201 || response.statusCode == 204) {
        NotificationBar().show('Meal Plan saved!', Colors.green);
        return true;
      } else {
        final error =
            '${response.statusCode.toString()} - ${jsonDecode(response.body)['error'] ?? 'Unknown error'}';
        NotificationBar().show(
          'Failed to save Meal Plan',
          Colors.red,
          error,
        );
      }
    } catch (error) {
      NotificationBar().show(
        'Failed to save Meal Plan',
        Colors.red,
        error.toString(),
      );
    }
    return false;
  }

  Future<bool> delete() async {
    try {
      final token = await Authorization.getValidToken();
      if (token == null) return false;

      final response = await http.delete(
        ApiConfig.deleteMealPlan(id.toString()),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 204) {
        NotificationBar().show('Meal Plan deleted!', Colors.green);
        return true;
      } else {
        final error =
            '${response.statusCode.toString()} - ${jsonDecode(response.body)['message'] ?? 'Unknown error'}';
        NotificationBar().show('Failed to delete Meal Plan', Colors.red, error);
      }
    } catch (error) {
      NotificationBar()
          .show('Failed to delete Meal Plan', Colors.red, error.toString());
    }
    return false;
  }
}

class MealPlanCard extends StatefulWidget {
  final MealPlan mealPlan;
  final VoidCallback? onEdit;
  final VoidCallback? onSelect;
  final Function(MealPlan)? onDelete;
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
    final bool isMobile = MediaQuery.of(context).size.width < 600;
    final double imageSize = 200;

    return Card(
      margin: EdgeInsets.symmetric(
        vertical: AppTheme.defaultPadding / 2,
        horizontal:
            isMobile ? AppTheme.defaultPadding / 2 : AppTheme.defaultPadding,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppTheme.cardRadius),
      ),
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(
            isMobile ? AppTheme.defaultPadding / 2 : AppTheme.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImageAndContent(imageSize, isMobile),
            const SizedBox(height: AppTheme.defaultPadding),
            ...widget.mealPlan.meals.map(
              (meal) => MealCard(meal: meal),
            ),
            const SizedBox(height: AppTheme.defaultPadding),
            _buildSelectButton(isMobile),
          ],
        ),
      ),
    );
  }

  Widget _buildImageAndContent(double imageSize, bool isMobile) {
    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.mealPlan.name,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: isMobile ? 18 : null,
                        ),
                  ),
                  if (widget.mealPlan.description != null)
                    Text(
                      widget.mealPlan.description!,
                      style: Theme.of(context).textTheme.bodyMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                ],
              ),
            ),
            if (widget.isAdmin) _buildAdminControls(isMobile),
          ],
        ),
      ],
    );

    return isMobile
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: NetworkImageWidget(
                filename: widget.mealPlan.imageFile,
                size: imageSize,
              )),
              const SizedBox(height: AppTheme.defaultPadding),
              content,
            ],
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NetworkImageWidget(
                filename: widget.mealPlan.imageFile,
                size: imageSize,
              ),
              const SizedBox(width: AppTheme.defaultPadding),
              Expanded(child: content),
            ],
          );
  }

  Widget _buildAdminControls(bool isMobile) {
    final buttons = [
      cardButton('Edit', widget.onEdit, Icons.edit_outlined,
          AppTheme.primaryColor, isMobile),
      const SizedBox(width: AppTheme.defaultPadding / 2),
      cardButton('Delete', _confirmDelete, Icons.delete_outlined, Colors.red,
          isMobile),
    ];

    return isMobile
        ? Column(
            children: buttons,
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: buttons,
          );
  }

  Widget _buildSelectButton(bool isMobile) {
    if (widget.isAdmin) return const SizedBox.shrink();

    return Align(
      alignment: isMobile ? Alignment.center : Alignment.centerRight,
      child: SizedBox(
          width: isMobile ? double.infinity : null,
          child: cardButton(
              widget.mealPlan.isSelected ? 'Deselect' : 'Select Plan',
              widget.onSelect,
              widget.mealPlan.isSelected
                  ? Icons.cancel_outlined
                  : Icons.check_circle_outlined,
              widget.mealPlan.isSelected
                  ? AppTheme.secondaryColor
                  : AppTheme.primaryColor,
              isMobile)),
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
            style: TextButton.styleFrom(foregroundColor: AppTheme.primaryColor),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (confirmed == true && await widget.mealPlan.delete()) {
      widget.onDelete?.call(widget.mealPlan);
    }
  }
}

class HomeMealPlanCard extends StatelessWidget {
  final MealPlan mealPlan;
  final VoidCallback onSelect;

  const HomeMealPlanCard({
    super.key,
    required this.mealPlan,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Card(
      margin: EdgeInsets.symmetric(
        vertical: AppTheme.defaultPadding / 2,
        horizontal: AppTheme.defaultPadding / 2,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppTheme.cardRadius),
      ),
      elevation: 2,
      child: InkWell(
        borderRadius: BorderRadius.circular(AppTheme.cardRadius),
        onTap: onSelect,
        child: Padding(
          padding: EdgeInsets.all(AppTheme.defaultPadding),
          child: isMobile
              ? _buildMobileLayout(context)
              : _buildDesktopLayout(context),
        ),
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image row
        Center(
            child: NetworkImageWidget(
          filename: mealPlan.imageFile,
          size: 240,
        )),
        const SizedBox(height: AppTheme.defaultPadding),

        // Text content
        Text(mealPlan.name, style: Theme.of(context).textTheme.titleLarge),
        if (mealPlan.description != null)
          Padding(
            padding: const EdgeInsets.only(top: AppTheme.defaultPadding / 4),
            child: Text(
              mealPlan.description!,
              style: Theme.of(context).textTheme.bodyMedium,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),

        const SizedBox(height: AppTheme.defaultPadding),
        Text(
          '\$${_calculateTotalPrice().toStringAsFixed(2)}/day',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppTheme.primaryColor,
                fontWeight: FontWeight.w600,
              ),
        ),

        const SizedBox(height: AppTheme.defaultPadding),
        ...mealPlan.meals.map((meal) => Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: AppTheme.defaultPadding / 4),
              child: Text('• ${meal.name}',
                  style: Theme.of(context).textTheme.bodyMedium),
            )),

        const SizedBox(height: AppTheme.defaultPadding),
        _buildSelectButton(true),
      ],
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left column - image
        NetworkImageWidget(
          filename: mealPlan.imageFile,
          size: 300,
        ),
        const SizedBox(width: AppTheme.defaultPadding),

        // Right column - text content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(mealPlan.name,
                  style: Theme.of(context).textTheme.titleLarge),
              if (mealPlan.description != null)
                Padding(
                  padding:
                      const EdgeInsets.only(top: AppTheme.defaultPadding / 4),
                  child: Text(
                    mealPlan.description!,
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              const SizedBox(height: AppTheme.defaultPadding),
              Text(
                '\$${_calculateTotalPrice().toStringAsFixed(2)}/day',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppTheme.primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(height: AppTheme.defaultPadding),
              ...mealPlan.meals.map((meal) => Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: AppTheme.defaultPadding / 4),
                    child: Text('• ${meal.name}',
                        style: Theme.of(context).textTheme.bodyMedium),
                  )),
              const SizedBox(height: AppTheme.defaultPadding),
              _buildSelectButton(false),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSelectButton(bool isMobile) {
    return Align(
      alignment: isMobile ? Alignment.center : Alignment.centerRight,
      child: SizedBox(
        width: isMobile ? double.infinity : null,
        child: cardButton(
          'Order Meal Plan',
          onSelect,
          Icons.shopping_cart,
          AppTheme.primaryColor,
          isMobile,
        ),
      ),
    );
  }

  double _calculateTotalPrice() {
    return mealPlan.meals.fold(0.0, (sum, meal) => sum + meal.price);
  }
}
