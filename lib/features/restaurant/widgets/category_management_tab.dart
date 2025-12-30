import 'package:catering_flutter/core/widgets/searchable_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';
import 'package:catering_flutter/l10n/app_localizations.dart';
import 'package:catering_flutter/core/widgets/app_card.dart';
import 'package:catering_flutter/core/widgets/custom_text_field.dart';
import 'package:catering_flutter/core/widgets/app_premium_button.dart';
import 'package:catering_flutter/core/widgets/card_action_buttons.dart';

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
  final bool hasError;
  final String? errorMessage;
  final VoidCallback? onRetry;
  final VoidCallback? onCancel;

  const CategoryManagementTab({
    super.key,
    required this.title,
    required this.categoryType,
    required this.fetchCategories,
    required this.createCategory,
    required this.updateCategory,
    required this.deleteCategory,
    this.hasError = false,
    this.errorMessage,
    this.onRetry,
    this.onCancel,
  });

  @override
  State<CategoryManagementTab> createState() => _CategoryManagementTabState();
}

class _CategoryManagementTabState extends State<CategoryManagementTab> {
  final TextEditingController _createController = TextEditingController();
  List<CategoryItem> _categories = [];
  List<CategoryItem> _filteredCategories = [];
  bool _isLoading = false;
  String _currentQuery = '';

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  @override
  void dispose() {
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
          _applyFilter(_currentQuery);
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

  void _applyFilter(String query) {
    _currentQuery = query.toLowerCase();
    setState(() {
      if (_currentQuery.isEmpty) {
        _filteredCategories = List.from(_categories);
      } else {
        _filteredCategories = _categories
            .where((c) => c.name.toLowerCase().contains(_currentQuery))
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
        title: Text(AppLocalizations.of(context)!.editRestaurantCategory),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: AppLocalizations.of(context)!.categoryName,
          ),
        ),
        actions: [
          TextButton.icon(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close),
            label: Text(AppLocalizations.of(context)!.cancel),
          ),
          AppPremiumButton(
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
            icon: Icons.save,
            label: AppLocalizations.of(context)!.save,
          ),
        ],
      ),
    );
  }

  Future<void> _showDeleteDialog(CategoryItem category) async {
    final confirmed = await DeleteConfirmationDialog.show(
      context: context,
      title: AppLocalizations.of(context)!.deleteCategory(widget.categoryType),
      message: AppLocalizations.of(
        context,
      )!.deleteCategoryConfirmation(category.name),
    );

    if (confirmed && mounted) {
      try {
        await widget.deleteCategory(category.id);
        if (!mounted) return;
        UIErrorHandler.showSnackBar(
          context,
          AppLocalizations.of(context)!.categoryDeleted,
          isError: false,
        );
        _loadCategories();
      } catch (e) {
        if (!mounted) return;
        UIErrorHandler.handleError(
          context,
          e,
          customMessage: AppLocalizations.of(context)!.failedToDeleteCategory,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SearchableListScreen<CategoryItem>(
      title: widget.title,
      withScaffold: false,
      items: _filteredCategories,
      isLoading: _isLoading,
      hasError: widget.hasError,
      errorMessage: widget.errorMessage,
      onRetry: widget.onRetry,
      onCancel: widget.onCancel,
      onRefresh: _loadCategories,
      onSearch: _applyFilter,
      searchHint: AppLocalizations.of(context)!.searchCategories,
      header: Row(
        children: [
          Expanded(
            child: CustomTextField(
              controller: _createController,
              labelText: AppLocalizations.of(
                context,
              )!.newCategory(widget.categoryType),
              hintText: AppLocalizations.of(context)!.enterName,
              prefixIcon: const Icon(Icons.add_circle_outline),
            ),
          ),
          const SizedBox(width: 12),
          AppPremiumButton(
            onPressed: _handleCreate,
            label: AppLocalizations.of(context)!.add,
            isLoading: _isLoading,
            icon: Icons.add,
            isFullWidth: false,
          ),
        ],
      ),
      itemBuilder: (context, category) {
        final theme = Theme.of(context);
        return AppCard(
          margin: EdgeInsets.zero,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: theme.colorScheme.primaryContainer.withValues(
                alpha: 0.5,
              ),
              foregroundColor: theme.colorScheme.primary,
              child: Text(
                category.name[0].toUpperCase(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            title: Text(
              category.name,
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: CardActionButtons(
              onEdit: () => _showEditDialog(category),
              onDelete: () => _showDeleteDialog(category),
            ),
          ),
        );
      },
    );
  }
}
