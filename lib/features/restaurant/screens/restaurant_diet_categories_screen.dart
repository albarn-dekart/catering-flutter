import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart';
import 'package:catering_flutter/features/restaurant/services/diet_category_service.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';

class ManageDietCategoriesScreen extends StatefulWidget {
  const ManageDietCategoriesScreen({super.key});

  @override
  State<ManageDietCategoriesScreen> createState() =>
      _ManageDietCategoriesScreenState();
}

class _ManageDietCategoriesScreenState
    extends State<ManageDietCategoriesScreen> {
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<DietCategoryService>().getDietCategories();
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
      title: 'Manage Diet Categories',
      child: Consumer<DietCategoryService>(
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
                      'Add New Diet Category',
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
                              hintText: 'e.g., Vegan, Keto, Gluten-Free',
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
                                    await service.createDietCategory(
                                      _nameController.text.trim(),
                                    );
                                    _nameController.clear();
                                    if (!context.mounted) return;
                                    UIErrorHandler.showSnackBar(
                                      context,
                                      'Category created successfully',
                                      isError: false,
                                    );
                                    await service.getDietCategories();
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
                child: service.dietCategories.isEmpty
                    ? const Center(child: Text('No diet categories found'))
                    : ListView.builder(
                        padding: const EdgeInsets.all(16.0),
                        itemCount: service.dietCategories.length,
                        itemBuilder: (context, index) {
                          final category = service.dietCategories[index];
                          return Card(
                            margin: const EdgeInsets.only(bottom: 8),
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Theme.of(
                                  context,
                                ).colorScheme.primaryContainer,
                                child: Icon(
                                  Icons.restaurant_menu,
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
        title: const Text('Edit Diet Category'),
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
                await context.read<DietCategoryService>().updateDietCategory(
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
                await context.read<DietCategoryService>().getDietCategories();
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
        title: const Text('Delete Diet Category'),
        content: Text('Are you sure you want to delete "${category.name}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () async {
              try {
                await context.read<DietCategoryService>().deleteDietCategory(
                  category.id,
                );
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
