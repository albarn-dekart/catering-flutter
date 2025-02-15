import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:catering_app/Classes/api_config.dart';
import 'package:catering_app/Classes/notification_bar.dart';
import 'package:catering_app/Classes/authorization.dart';
import 'package:catering_app/Classes/app_theme.dart';
import 'package:catering_app/Classes/user_manager.dart';
import 'package:catering_app/Classes/button.dart';

class Category {
  final int? id;
  final String name;

  Category({
    required this.id,
    required this.name,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is Category && other.id == id);

  @override
  int get hashCode => id.hashCode;

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }

  static Future<List<Category>> get() async {
    List<Category> categories = [];

    try {
      final response = await http.get(ApiConfig.categories());
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List<dynamic>;
        categories = data
            .map((category) =>
                Category.fromJson(category as Map<String, dynamic>))
            .toList();
      } else {
        final error =
            '${response.statusCode.toString()} - ${jsonDecode(response.body)['error'] ?? 'Unknown error'}';
        NotificationBar().show('Failed to load categories', Colors.red, error);
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

  Future<bool> save() async {
    // Validation
    if (name.isEmpty || name.length > 50) {
      NotificationBar().show(
        'Category name must not be empty and cannot exceed 50 characters',
        Colors.yellow,
      );
      return false;
    }

    try {
      final token = await Authorization.getValidToken();
      if (token == null) return false;

      final response = id == null
          ? await http.post(
              ApiConfig.newCategory(),
              headers: {
                'Content-Type': 'application/json',
                'Authorization': 'Bearer $token',
              },
              body: jsonEncode(toJson()),
            )
          : await http.put(
              ApiConfig.updateCategory(id.toString()),
              headers: {
                'Content-Type': 'application/json',
                'Authorization': 'Bearer $token',
              },
              body: jsonEncode(toJson()),
            );

      if (response.statusCode == 201 || response.statusCode == 204) {
        NotificationBar().show('Category saved successfully!', Colors.green);
        return true;
      } else {
        final error =
            '${response.statusCode.toString()} - ${jsonDecode(response.body)['error'] ?? 'Unknown error'}';
        NotificationBar().show(
          'Failed to save Category',
          Colors.red,
          error,
        );
      }
    } catch (e) {
      NotificationBar().show('Error saving category', Colors.red, e.toString());
    }
    return false;
  }

  Future<bool> delete() async {
    try {
      final token = await Authorization.getValidToken();
      if (token == null) return false;

      final response = await http.delete(
        ApiConfig.deleteCategory(id.toString()),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 204) {
        NotificationBar().show('Category deleted!', Colors.green);
        return true;
      } else {
        final error =
            '${response.statusCode.toString()} - ${jsonDecode(response.body)['error'] ?? 'Unknown error'}';
        NotificationBar().show('Failed to delete Category', Colors.red, error);
      }
    } catch (error) {
      NotificationBar().show(
        'Failed to delete Category',
        Colors.red,
        error.toString(),
      );
    }
    return false;
  }
}

class CategoryCard extends StatefulWidget {
  final Category category;
  final Function(Category) onDelete;
  final VoidCallback onSaved;

  const CategoryCard({
    super.key,
    required this.category,
    required this.onDelete,
    required this.onSaved,
  });

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  late TextEditingController _nameController;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.category.name);
  }

  Future<void> _handleSave() async {
    if (await Category(id: widget.category.id, name: _nameController.text)
        .save()) {
      widget.onSaved();
      setState(() => _isEditing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        vertical: AppTheme.defaultPadding / 2,
        horizontal: AppTheme.defaultPadding,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppTheme.cardRadius),
      ),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.defaultPadding),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: _isEditing
                      ? TextField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(AppTheme.cardRadius),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: AppTheme.defaultPadding),
                          ),
                        )
                      : Text(
                          widget.category.name,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                ),
                if (UserManager().hasRole('ROLE_ADMIN') && !_isEditing) ...[
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      cardButton(
                          'Edit',
                          () => setState(() => _isEditing = true),
                          Icons.edit_outlined,
                          AppTheme.primaryColor),
                      const SizedBox(width: AppTheme.defaultPadding / 2),
                      cardButton(
                          'Delete',
                          () => widget.onDelete(widget.category),
                          Icons.delete_outlined,
                          Colors.red),
                    ],
                  ),
                ]
              ],
            ),
            if (_isEditing)
              Padding(
                padding: const EdgeInsets.only(top: AppTheme.defaultPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => setState(() => _isEditing = false),
                      child: const Text('Cancel'),
                    ),
                    const SizedBox(width: AppTheme.defaultPadding),
                    ElevatedButton(
                      onPressed: _handleSave,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primaryColor,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Save'),
                    ),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
