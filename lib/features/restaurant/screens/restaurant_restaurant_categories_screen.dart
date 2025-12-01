import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart';
import 'package:catering_flutter/features/restaurant/services/restaurant_category_service.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';

class ManageRestaurantCategoriesScreen extends StatefulWidget {
  const ManageRestaurantCategoriesScreen({super.key});

  @override
  State<ManageRestaurantCategoriesScreen> createState() =>
      _ManageRestaurantCategoriesScreenState();
}

class _ManageRestaurantCategoriesScreenState
    extends State<ManageRestaurantCategoriesScreen> {
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<RestaurantCategoryService>().getRestaurantCategories();
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Manage Restaurant Categories',
      child: Consumer<RestaurantCategoryService>(
        builder: (context, service, child) {
          if (service.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Column(
            children: [
              // Add category section
              Container(
                padding: const EdgeInsets.all(16.0),
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Add New Restaurant Category',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _nameController,
                            decoration: const InputDecoration(
                              labelText: 'Category Name',
                              hintText: 'e.g., Italian, Chinese, Mexican',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        FilledButton.icon(
                          onPressed: service.isLoading
                              ? null
                              : () async {
                                  if (_nameController.text.trim().isEmpty) {
                                    UIErrorHandler.showSnackBar(
                                      context,
                                      'Please enter a category name',
                                      isError: true,
                                    );
                                    return;
                                  }

                                  try {
                                    await service.createRestaurantCategory(
                                      _nameController.text.trim(),
                                    );
                                    _nameController.clear();
                                    if (!context.mounted) return;
                                    UIErrorHandler.showSnackBar(
                                      context,
                                      'Category created successfully',
                                      isError: false,
                                    );
                                    await service.getRestaurantCategories();
                                  } catch (e) {
                                    if (!context.mounted) return;
                                    UIErrorHandler.handleError(
                                      context,
                                      e,
                                      customMessage:
                                          'Failed to create category',
                                    );
                                  }
                                },
                          icon: const Icon(Icons.add),
                          label: const Text('Add'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Categories list
              Expanded(
                child: service.restaurantCategories.isEmpty
                    ? const Center(
                        child: Text('No restaurant categories found'),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.all(16.0),
                        itemCount: service.restaurantCategories.length,
                        itemBuilder: (context, index) {
                          final category = service.restaurantCategories[index];
                          return Card(
                            margin: const EdgeInsets.only(bottom: 8),
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Theme.of(
                                  context,
                                ).colorScheme.primaryContainer,
                                child: Icon(
                                  Icons.restaurant,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onPrimaryContainer,
                                ),
                              ),
                              title: Text(category.name),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.edit),
                                    onPressed: () =>
                                        _showEditDialog(context, category),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete),
                                    color: Theme.of(context).colorScheme.error,
                                    onPressed: () =>
                                        _showDeleteDialog(context, category),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _showEditDialog(BuildContext context, dynamic category) {
    final controller = TextEditingController(text: category.name);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Restaurant Category'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            labelText: 'Category Name',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () async {
              if (controller.text.trim().isEmpty) {
                UIErrorHandler.showSnackBar(
                  context,
                  'Please enter a category name',
                  isError: true,
                );
                return;
              }

              try {
                await context
                    .read<RestaurantCategoryService>()
                    .updateRestaurantCategory(
                      category.id,
                      controller.text.trim(),
                    );
                if (!context.mounted) return;
                Navigator.pop(context);
                UIErrorHandler.showSnackBar(
                  context,
                  'Category updated successfully',
                  isError: false,
                );
                await context
                    .read<RestaurantCategoryService>()
                    .getRestaurantCategories();
              } catch (e) {
                if (!context.mounted) return;
                UIErrorHandler.handleError(
                  context,
                  e,
                  customMessage: 'Failed to update category',
                );
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, dynamic category) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Restaurant Category'),
        content: Text('Are you sure you want to delete "${category.name}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () async {
              try {
                await context
                    .read<RestaurantCategoryService>()
                    .deleteRestaurantCategory(category.id);
                if (!context.mounted) return;
                Navigator.pop(context);
                UIErrorHandler.showSnackBar(
                  context,
                  'Category deleted successfully',
                  isError: false,
                );
              } catch (e) {
                if (!context.mounted) return;
                Navigator.pop(context);
                UIErrorHandler.handleError(
                  context,
                  e,
                  customMessage: 'Failed to delete category',
                );
              }
            },
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
