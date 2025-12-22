import 'package:catering_flutter/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart';
import 'package:catering_flutter/features/restaurant/services/diet_category_service.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';
import 'package:catering_flutter/core/widgets/global_error_widget.dart';

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
      title: AppLocalizations.of(context)!.manageDietCategories,
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
                      AppLocalizations.of(context)!.addNewDietCategory,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              labelText: AppLocalizations.of(
                                context,
                              )!.categoryName,
                              hintText: AppLocalizations.of(
                                context,
                              )!.dietCategoryHint,
                              border: const OutlineInputBorder(),
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
                                      AppLocalizations.of(
                                        context,
                                      )!.pleaseEnterCategoryName,
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
                                      AppLocalizations.of(
                                        context,
                                      )!.categoryCreated(
                                        AppLocalizations.of(context)!.diet,
                                      ),
                                      isError: false,
                                    );
                                    await service.getDietCategories();
                                  } catch (e) {
                                    if (!context.mounted) return;
                                    UIErrorHandler.handleError(
                                      context,
                                      e,
                                      customMessage: AppLocalizations.of(
                                        context,
                                      )!.failedToCreateCategory,
                                    );
                                  }
                                },
                          icon: const Icon(Icons.add),
                          label: Text(AppLocalizations.of(context)!.add),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: service.hasError && service.dietCategories.isEmpty
                    ? GlobalErrorWidget(
                        message: service.errorMessage,
                        onRetry: () => context
                            .read<DietCategoryService>()
                            .getDietCategories(),
                        withScaffold: false,
                      )
                    : service.dietCategories.isEmpty
                    ? Center(
                        child: Text(
                          AppLocalizations.of(context)!.noDietCategoriesFound,
                        ),
                      )
                    : RefreshIndicator(
                        onRefresh: () async {
                          await context
                              .read<DietCategoryService>()
                              .getDietCategories();
                        },
                        child: ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
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
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.error,
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
        title: Text(AppLocalizations.of(context)!.editDietCategory),
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
                await context.read<DietCategoryService>().updateDietCategory(
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
                await context.read<DietCategoryService>().getDietCategories();
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

  void _showDeleteDialog(BuildContext context, dynamic category) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(AppLocalizations.of(context)!.deleteDietCategory),
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
                await context.read<DietCategoryService>().deleteDietCategory(
                  category.id,
                );
                if (!context.mounted) return;
                Navigator.pop(context);
                UIErrorHandler.showSnackBar(
                  context,
                  AppLocalizations.of(context)!.categoryDeleted,
                  isError: false,
                );
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
}
