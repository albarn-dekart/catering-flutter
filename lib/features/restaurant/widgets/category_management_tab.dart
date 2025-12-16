import 'package:flutter/material.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';
import 'package:catering_flutter/l10n/app_localizations.dart';

class CategoryItem {
  final String id;
  final String name;

  CategoryItem({required this.id, required this.name});
}

class CategoryManagementTab extends StatefulWidget {
  final String title;
  final String categoryType;
  final Future<List<CategoryItem>> Function() fetchCategories;
  final Future<void> Function(String name) createCategory;
  final Future<void> Function(String id, String name) updateCategory;
  final Future<void> Function(String id) deleteCategory;

  const CategoryManagementTab({
    super.key,
    required this.title,
    required this.categoryType,
    required this.fetchCategories,
    required this.createCategory,
    required this.updateCategory,
    required this.deleteCategory,
  });

  @override
  State<CategoryManagementTab> createState() => _CategoryManagementTabState();
}

class _CategoryManagementTabState extends State<CategoryManagementTab> {
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _createController = TextEditingController();
  List<CategoryItem> _categories = [];
  List<CategoryItem> _filteredCategories = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadCategories();
    _searchController.addListener(_filterCategories);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _createController.dispose();
    super.dispose();
  }

  Future<void> _loadCategories() async {
    setState(() => _isLoading = true);
    try {
      final categories = await widget.fetchCategories();
      if (mounted) {
        setState(() {
          _categories = categories;
          _filterCategories();
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isLoading = false);
        UIErrorHandler.handleError(
          context,
          e,
          customMessage: AppLocalizations.of(context)!.failedToLoadCategories,
        );
      }
    }
  }

  void _filterCategories() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        _filteredCategories = List.from(_categories);
      } else {
        _filteredCategories = _categories
            .where((c) => c.name.toLowerCase().contains(query))
            .toList();
      }
    });
  }

  Future<void> _handleCreate() async {
    final name = _createController.text.trim();
    if (name.isEmpty) {
      UIErrorHandler.showSnackBar(
        context,
        AppLocalizations.of(context)!.pleaseEnterCategoryName,
        isError: true,
      );
      return;
    }

    setState(() => _isLoading = true);
    try {
      await widget.createCategory(name);
      _createController.clear();
      if (mounted) {
        UIErrorHandler.showSnackBar(
          context,
          AppLocalizations.of(context)!.categoryCreated(widget.categoryType),
          isError: false,
        );
        await _loadCategories();
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isLoading = false);
        UIErrorHandler.handleError(
          context,
          e,
          customMessage: AppLocalizations.of(context)!.failedToCreateCategory,
        );
      }
    }
  }

  void _showEditDialog(CategoryItem category) {
    final controller = TextEditingController(text: category.name);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          AppLocalizations.of(context)!.editCategory(widget.categoryType),
        ),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: AppLocalizations.of(context)!.categoryName,
            border: const OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(AppLocalizations.of(context)!.cancel),
          ),
          FilledButton(
            onPressed: () async {
              if (controller.text.trim().isEmpty) {
                UIErrorHandler.showSnackBar(
                  context,
                  AppLocalizations.of(context)!.pleaseEnterCategoryName,
                  isError: true,
                );
                return;
              }

              try {
                await widget.updateCategory(
                  category.id,
                  controller.text.trim(),
                );
                if (!context.mounted) return;
                Navigator.pop(context);
                UIErrorHandler.showSnackBar(
                  context,
                  AppLocalizations.of(context)!.categoryUpdated,
                  isError: false,
                );
                _loadCategories();
              } catch (e) {
                if (!context.mounted) return;
                UIErrorHandler.handleError(
                  context,
                  e,
                  customMessage: AppLocalizations.of(
                    context,
                  )!.failedToUpdateCategory,
                );
              }
            },
            child: Text(AppLocalizations.of(context)!.save),
          ),
        ],
      ),
    );
  }

  void _showDeleteDialog(CategoryItem category) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          AppLocalizations.of(context)!.deleteCategory(widget.categoryType),
        ),
        content: Text(
          AppLocalizations.of(
            context,
          )!.deleteCategoryConfirmation(category.name),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(AppLocalizations.of(context)!.cancel),
          ),
          TextButton(
            onPressed: () async {
              try {
                await widget.deleteCategory(category.id);
                if (!context.mounted) return;
                Navigator.pop(context);
                UIErrorHandler.showSnackBar(
                  context,
                  AppLocalizations.of(context)!.categoryDeleted,
                  isError: false,
                );
                _loadCategories();
              } catch (e) {
                if (!context.mounted) return;
                Navigator.pop(context);
                UIErrorHandler.handleError(
                  context,
                  e,
                  customMessage: AppLocalizations.of(
                    context,
                  )!.failedToDeleteCategory,
                );
              }
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: Text(AppLocalizations.of(context)!.delete),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading && _categories.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return Column(
      children: [
        // Creation and Search Section
        Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Create New
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _createController,
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(
                          context,
                        )!.newCategory(widget.categoryType),
                        hintText: AppLocalizations.of(context)!.enterName,
                        prefixIcon: const Icon(Icons.add_circle_outline),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  FilledButton(
                    onPressed: _isLoading ? null : _handleCreate,
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: _isLoading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : Text(AppLocalizations.of(context)!.add),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Search
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.searchCategories,
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.surfaceContainerLow,
                ),
              ),
            ],
          ),
        ),
        // List Section
        Expanded(
          child: _filteredCategories.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.category_outlined,
                        size: 64,
                        color: Theme.of(context).colorScheme.outline,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        AppLocalizations.of(context)!.noCategoriesFound,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              color: Theme.of(context).colorScheme.outline,
                            ),
                      ),
                    ],
                  ),
                )
              : RefreshIndicator(
                  onRefresh: _loadCategories,
                  child: ListView.separated(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(16),
                    itemCount: _filteredCategories.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 8),
                    itemBuilder: (context, index) {
                      final category = _filteredCategories[index];
                      return Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(
                            color: Theme.of(context).colorScheme.outlineVariant,
                          ),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Theme.of(
                              context,
                            ).colorScheme.primaryContainer,
                            child: Text(
                              category.name[0].toUpperCase(),
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onPrimaryContainer,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          title: Text(
                            category.name,
                            style: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(fontWeight: FontWeight.w500),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit_outlined),
                                onPressed: () => _showEditDialog(category),
                                tooltip: AppLocalizations.of(context)!.edit,
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete_outline),
                                color: Theme.of(context).colorScheme.error,
                                onPressed: () => _showDeleteDialog(category),
                                tooltip: AppLocalizations.of(context)!.delete,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
        ),
      ],
    );
  }
}
