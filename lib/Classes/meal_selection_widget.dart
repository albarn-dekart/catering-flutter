import 'package:catering_app/Classes/category.dart';
import 'package:flutter/material.dart';
import 'package:catering_app/Classes/meal.dart';
import 'package:catering_app/Classes/app_theme.dart';

class MealSelectionWidget extends StatelessWidget {
  final List<Category> categories;
  final Category? selectedCategory;
  final List<Meal> availableMeals;
  final List<Meal> selectedMeals;
  final Function(Category?) onCategoryChanged;
  final Function(Meal) onAddToOrder;
  final Function(Meal) onRemoveFromOrder;

  const MealSelectionWidget({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.availableMeals,
    required this.selectedMeals,
    required this.onCategoryChanged,
    required this.onAddToOrder,
    required this.onRemoveFromOrder,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildSelectedMeals(context),
        const SizedBox(height: AppTheme.defaultPadding),
        _buildCategorySelector(context),
        const SizedBox(height: AppTheme.defaultPadding),
        _buildAvailableMeals(context),
      ],
    );
  }

  Widget _buildCategorySelector(BuildContext context) {
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
    child: Row(
        children: [
          Text('Category:', style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(width: AppTheme.defaultPadding),
          DropdownButton<Category>(
            value: selectedCategory,
            hint: const Text('Select Category'),
            items: categories
                .map((category) => DropdownMenuItem(
                      value: category,
                      child: Text(category.name),
                    ))
                .toList(),
            onChanged: onCategoryChanged,
            underline: Container(),
            borderRadius: BorderRadius.circular(AppTheme.cardRadius),
          ),
        ],
      ),),
    );
  }

  Widget _buildAvailableMeals(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Available Meals', style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(height: AppTheme.defaultPadding / 2),
        ListView.separated(
          shrinkWrap: true,
          itemCount: availableMeals.length,
          separatorBuilder: (_, __) =>
              const SizedBox(height: AppTheme.defaultPadding / 2),
          itemBuilder: (context, index) => MealCard(
            meal: availableMeals[index],
            addToOrderButton: !selectedMeals.contains(availableMeals[index]),
            onAddToOrder: () => onAddToOrder(availableMeals[index]),
          ),
        ),
      ],
    );
  }

  Widget _buildSelectedMeals(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Selected Meals', style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(height: AppTheme.defaultPadding / 2),
        ListView.separated(
          shrinkWrap: true,
          itemCount: selectedMeals.length,
          separatorBuilder: (_, __) =>
              const SizedBox(height: AppTheme.defaultPadding / 2),
          itemBuilder: (context, index) => MealCard(
            meal: selectedMeals[index],
            removeFromOrderButton: true,
            onRemoveFromOrder: () => onRemoveFromOrder(selectedMeals[index]),
          ),
        ),
      ],
    );
  }
}
