import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/core/widgets/searchable_list_screen.dart';
import 'package:catering_flutter/features/restaurant/services/meal_service.dart';

class RestaurantMealSelectionScreen extends StatefulWidget {
  final String restaurantIri;
  final List<String> initiallySelectedIds;

  const RestaurantMealSelectionScreen({
    super.key,
    required this.restaurantIri,
    required this.initiallySelectedIds,
  });

  @override
  State<RestaurantMealSelectionScreen> createState() =>
      _RestaurantMealSelectionScreenState();
}

class _RestaurantMealSelectionScreenState
    extends State<RestaurantMealSelectionScreen> {
  late List<String> _selectedIds;

  @override
  void initState() {
    super.initState();
    _selectedIds = List.from(widget.initiallySelectedIds);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MealService>().fetchMealsByRestaurant(widget.restaurantIri);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MealService>(
      builder: (context, mealService, child) {
        return SearchableListScreen<dynamic>(
          title: 'Select Meals',
          items: mealService.meals,
          isLoading: mealService.isLoading,
          searchHint: 'Search meals...',
          filter: (meal, query) =>
              meal.name.toLowerCase().contains(query) ||
              (meal.description?.toLowerCase().contains(query) ?? false),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.pop(_selectedIds);
            },
            child: const Icon(Icons.check),
          ),
          itemBuilder: (context, meal) {
            final isSelected = _selectedIds.contains(meal.id);
            return CheckboxListTile(
              title: Text(meal.name),
              subtitle: meal.description != null
                  ? Text(
                      meal.description!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  : null,
              secondary: Text(
                '${(meal.price / 100.0).toStringAsFixed(2)} PLN',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              value: isSelected,
              onChanged: (bool? value) {
                setState(() {
                  if (value == true) {
                    _selectedIds.add(meal.id);
                  } else {
                    _selectedIds.remove(meal.id);
                  }
                });
              },
            );
          },
        );
      },
    );
  }
}
