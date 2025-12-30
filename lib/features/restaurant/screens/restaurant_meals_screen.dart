import 'package:catering_flutter/core/utils/iri_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/core/app_router.dart';
import 'package:catering_flutter/features/restaurant/services/meal_service.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';
import 'package:catering_flutter/core/widgets/searchable_list_screen.dart';
import 'package:catering_flutter/l10n/app_localizations.dart';
import 'package:catering_flutter/core/widgets/advanced_filters_widget.dart';
import 'package:catering_flutter/core/widgets/meal_card.dart';
import 'package:catering_flutter/core/widgets/card_action_buttons.dart';

import 'dart:async';

class RestaurantMealsScreen extends StatefulWidget {
  final String restaurantIri;
  final bool isSelectionMode;

  const RestaurantMealsScreen({
    super.key,
    required this.restaurantIri,
    this.isSelectionMode = false,
  });

  @override
  State<RestaurantMealsScreen> createState() => _RestaurantMealsScreenState();
}

class _RestaurantMealsScreenState extends State<RestaurantMealsScreen> {
  String _currentSearchQuery = '';
  bool _showAdvancedFilters = false;

  RangeValues? _calorieRange;
  RangeValues? _proteinRange;
  RangeValues? _fatRange;
  RangeValues? _carbRange;
  RangeValues? _priceRange;

  // Track maximum values seen to adapt filters dynamically
  final FilterLimitTracker _filterLimits = FilterLimitTracker();
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchMeals();
    });
  }

  void _fetchMeals() {
    context.read<MealService>().fetchMealsByRestaurant(
      widget.restaurantIri,
      searchQuery: _currentSearchQuery,
      priceRange: _priceRange,
      calorieRange: _calorieRange,
      proteinRange: _proteinRange,
      fatRange: _fatRange,
      carbRange: _carbRange,
    );
  }

  void _onFilterChanged() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      _fetchMeals();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MealService>(
      builder: (context, mealService, child) {
        // Calculate max values for filters dynamically
        _filterLimits.updateFrom(
          mealService.meals,
          getPricePLN: (meal) => meal.price / 100.0,
          getCalories: (meal) => meal.calories,
          getProtein: (meal) => meal.protein,
          getFat: (meal) => meal.fat,
          getCarbs: (meal) => meal.carbs,
        );

        double maxPrice = _filterLimits.maxPrice;
        double maxCalories = _filterLimits.maxCalories;
        double maxProtein = _filterLimits.maxProtein;
        double maxFat = _filterLimits.maxFat;
        double maxCarbs = _filterLimits.maxCarbs;

        return SearchableListScreen<Meal>(
          title: widget.isSelectionMode
              ? AppLocalizations.of(context)!.selectMeal
              : AppLocalizations.of(context)!.manageMeals,
          items: mealService.meals,
          isLoading: mealService.isLoading,
          isLoadingMore: mealService.isFetchingMore,
          onLoadMore: () =>
              mealService.loadMoreMealsByRestaurant(widget.restaurantIri),
          searchHint: AppLocalizations.of(context)!.searchMeals,
          useGrid: true,

          customFilters: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton.icon(
                  onPressed: () {
                    setState(() {
                      _showAdvancedFilters = !_showAdvancedFilters;
                    });
                  },
                  icon: Icon(
                    _showAdvancedFilters
                        ? Icons.expand_less
                        : Icons.expand_more,
                  ),
                  label: Text(AppLocalizations.of(context)!.advancedFilters),
                ),
                if (_showAdvancedFilters) ...[
                  const SizedBox(height: 8),
                  AdvancedFiltersWidget(
                    maxPrice: maxPrice,
                    priceRange: _priceRange,
                    onPriceChanged: (values) {
                      setState(() => _priceRange = values);
                      _onFilterChanged();
                    },
                    maxCalories: maxCalories,
                    calorieRange: _calorieRange,
                    onCaloriesChanged: (values) {
                      setState(() => _calorieRange = values);
                      _onFilterChanged();
                    },
                    maxProtein: maxProtein,
                    proteinRange: _proteinRange,
                    onProteinChanged: (values) {
                      setState(() => _proteinRange = values);
                      _onFilterChanged();
                    },
                    maxFat: maxFat,
                    fatRange: _fatRange,
                    onFatChanged: (values) {
                      setState(() => _fatRange = values);
                      _onFilterChanged();
                    },
                    maxCarbs: maxCarbs,
                    carbRange: _carbRange,
                    onCarbsChanged: (values) {
                      setState(() => _carbRange = values);
                      _onFilterChanged();
                    },
                  ),
                ],
              ],
            ),
          ),
          onSearch: (query) {
            _currentSearchQuery = query;
            _fetchMeals();
          },
          onCreate: widget.isSelectionMode
              ? null
              : () {
                  context.push(
                    Uri(
                      path: AppRoutes.restaurantMealForm,
                      queryParameters: {
                        'restaurantId': IriHelper.getId(widget.restaurantIri),
                      },
                    ).toString(),
                  );
                },
          onRefresh: () async {
            _fetchMeals();
          },
          hasError: mealService.hasError,
          errorMessage: mealService.errorMessage,
          onRetry: _fetchMeals,
          itemBuilder: (context, meal) {
            Widget actionWidget;
            if (widget.isSelectionMode) {
              actionWidget = FilledButton.tonalIcon(
                onPressed: () {
                  context.pop(meal);
                },
                icon: const Icon(Icons.check),
                label: Text(AppLocalizations.of(context)!.selectMeal),
              );
            } else {
              actionWidget = CardActionButtons(
                onEdit: () {
                  context.push(
                    Uri(
                      path: AppRoutes.restaurantMealForm,
                      queryParameters: {
                        'restaurantId': IriHelper.getId(widget.restaurantIri),
                      },
                    ).toString(),
                    extra: meal,
                  );
                },
                onDelete: () async {
                  final confirmed = await DeleteConfirmationDialog.show(
                    context: context,
                    title: AppLocalizations.of(context)!.deleteMeal,
                    message: AppLocalizations.of(
                      context,
                    )!.deleteMealConfirmation(meal.name),
                  );

                  if (confirmed && context.mounted) {
                    try {
                      await mealService.deleteMeal(meal.id);
                      if (context.mounted) {
                        UIErrorHandler.showSnackBar(
                          context,
                          AppLocalizations.of(context)!.mealDeleted,
                          isError: false,
                        );
                      }
                    } catch (e) {
                      if (context.mounted) {
                        UIErrorHandler.handleError(
                          context,
                          e,
                          customMessage: AppLocalizations.of(
                            context,
                          )!.mealDeleteFailed,
                        );
                      }
                    }
                  }
                },
              );
            }

            return MealCard(
              name: meal.name,
              description: meal.description,
              imageUrl: meal.imageUrl,
              priceGroszy: meal.price.toDouble(),
              calories: meal.calories,
              protein: meal.protein,
              fat: meal.fat,
              carbs: meal.carbs,
              actions: actionWidget,
            );
          },
        );
      },
    );
  }
}
