import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart';
import 'package:catering_flutter/features/restaurant/services/category_service.dart';
import 'package:catering_flutter/features/restaurant/services/restaurant_service.dart';
import 'package:catering_flutter/features/user/services/user_service.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';

class ManageCategoriesScreen extends StatefulWidget {
  final String restaurantIri;

  const ManageCategoriesScreen({super.key, required this.restaurantIri});

  @override
  State<ManageCategoriesScreen> createState() => _ManageCategoriesScreenState();
}

class _ManageCategoriesScreenState extends State<ManageCategoriesScreen> {
  List<String> _selectedCategoryIds = [];
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadData();
    });
  }

  Future<void> _loadData() async {
    final categoryService = context.read<CategoryService>();
    final restaurantService = context.read<RestaurantService>();

    // Fetch categories
    await categoryService.getCategories();

    // Get current restaurant categories
    final restaurant = restaurantService.currentRestaurant;
    if (restaurant != null && !_isInitialized) {
      setState(() {
        // Extract category IDs from GraphQL edges/nodes structure
        _selectedCategoryIds =
            restaurant.categories?.edges
                ?.map((e) => e?.node?.id)
                .whereType<String>()
                .toList() ??
            [];
        _isInitialized = true;
      });
    }
  }

  Future<void> _saveCategories() async {
    final restaurantService = context.read<RestaurantService>();

    try {
      await restaurantService.updateRestaurantCategories(
        widget.restaurantIri,
        _selectedCategoryIds,
      );

      if (!mounted) return;

      UIErrorHandler.showSnackBar(
        context,
        'Categories updated successfully',
        isError: false,
      );
      // Refresh restaurant data
      await context.read<UserService>().fetchCurrentRestaurant();
    } catch (e) {
      if (!mounted) return;
      UIErrorHandler.handleError(
        context,
        e,
        customMessage: 'Failed to update categories',
      );
    }
  }

  void _toggleCategory(String categoryId) {
    setState(() {
      if (_selectedCategoryIds.contains(categoryId)) {
        _selectedCategoryIds.remove(categoryId);
      } else {
        _selectedCategoryIds.add(categoryId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Manage Categories',
      child: Consumer2<CategoryService, RestaurantService>(
        builder: (context, categoryService, restaurantService, child) {
          if (categoryService.isLoading || restaurantService.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Select categories for your restaurant',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              color: Theme.of(
                                context,
                              ).colorScheme.onSurfaceVariant,
                            ),
                      ),
                      const SizedBox(height: 24),
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: categoryService.categories.map((category) {
                          final isSelected = _selectedCategoryIds.contains(
                            category.id,
                          );
                          return FilterChip(
                            label: Text(category.name),
                            selected: isSelected,
                            onSelected: (_) => _toggleCategory(category.id),
                            backgroundColor: Theme.of(
                              context,
                            ).colorScheme.surface,
                            selectedColor: Theme.of(
                              context,
                            ).colorScheme.primaryContainer,
                            checkmarkColor: Theme.of(
                              context,
                            ).colorScheme.onPrimaryContainer,
                            labelStyle: TextStyle(
                              color: isSelected
                                  ? Theme.of(
                                      context,
                                    ).colorScheme.onPrimaryContainer
                                  : Theme.of(context).colorScheme.onSurface,
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide(
                                color: isSelected
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(context).colorScheme.outline,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 24),
                      if (_selectedCategoryIds.isEmpty)
                        Card(
                          color: Theme.of(context).colorScheme.errorContainer,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.warning,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onErrorContainer,
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    'Please select at least one category',
                                    style: TextStyle(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onErrorContainer,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 150),
                      blurRadius: 4,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                child: SafeArea(
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: FilledButton.icon(
                      onPressed:
                          _selectedCategoryIds.isEmpty ||
                              restaurantService.isLoading
                          ? null
                          : _saveCategories,
                      icon: restaurantService.isLoading
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Icon(Icons.save),
                      label: Text(
                        restaurantService.isLoading
                            ? 'Saving...'
                            : 'Save Categories',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
