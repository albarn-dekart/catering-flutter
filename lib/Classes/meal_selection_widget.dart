import 'package:flutter/material.dart';
import 'package:catering_app/Classes/meal.dart';
import 'package:catering_app/Classes/app_theme.dart';

class MealSelectionWidget extends StatelessWidget {
  final List<String> categories;
  final String? selectedCategory;
  final List<Meal> availableMeals;
  final List<Meal> selectedMeals;
  final Function(String?) onCategoryChanged;
  final Function(Meal) onMealSelected;
  final Function(Meal) onMealRemoved;

  const MealSelectionWidget({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.availableMeals,
    required this.selectedMeals,
    required this.onCategoryChanged,
    required this.onMealSelected,
    required this.onMealRemoved,
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
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.defaultPadding / 2),
        child: Row(
          children: [
            Text('Category:', style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(width: AppTheme.defaultPadding),
            DropdownButton<String>(
              value: selectedCategory,
              hint: const Text('Select Category'),
              items: categories
                  .map((category) => DropdownMenuItem(
                        value: category,
                        child: Text(category),
                      ))
                  .toList(),
              onChanged: onCategoryChanged,
              underline: Container(),
              borderRadius: BorderRadius.circular(AppTheme.cardRadius),
            ),
          ],
        ),
      ),
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
            showAddButton: !selectedMeals.contains(availableMeals[index]),
            onAddToOrder: () => onMealSelected(availableMeals[index]),
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
            showDeleteButton: true,
            onDelete: () => onMealRemoved(selectedMeals[index]),
          ),
        ),
      ],
    );
  }
}
