import 'package:catering_flutter/core/utils/iri_helper.dart';
import 'package:catering_flutter/core/widgets/custom_cached_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/core/app_router.dart';
import 'package:catering_flutter/features/restaurant/services/meal_service.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';
import 'package:catering_flutter/core/widgets/searchable_list_screen.dart';
import 'package:catering_flutter/l10n/app_localizations.dart';
import 'package:catering_flutter/core/widgets/advanced_filters_widget.dart';
import 'package:catering_flutter/core/widgets/macro_badge.dart';
import 'package:catering_flutter/core/widgets/price_text.dart';
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
    final isNarrow = MediaQuery.of(context).size.width < 700;
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
          isLoading: mealService.isLoading || mealService.isFetchingMore,
          onLoadMore: () =>
              mealService.loadMoreMealsByRestaurant(widget.restaurantIri),
          searchHint: AppLocalizations.of(context)!.searchMeals,
          useGrid: true,
          preferredItemHeight: 350,
          customFilters: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextButton.icon(
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
                ),
                if (_showAdvancedFilters)
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
            ),
          ),
          onSearch: (query) {
            _currentSearchQuery = query;
            _fetchMeals();
          },
          floatingActionButton: widget.isSelectionMode
              ? null
              : isNarrow
              ? FloatingActionButton(
                  onPressed: () {
                    context.push(
                      Uri(
                        path: AppRoutes.restaurantMealForm,
                        queryParameters: {
                          'restaurantId': IriHelper.getId(widget.restaurantIri),
                        },
                      ).toString(),
                    );
                  },
                  tooltip: AppLocalizations.of(context)!.addMeal,
                  child: const Icon(Icons.add),
                )
              : FloatingActionButton.extended(
                  onPressed: () {
                    context.push(
                      Uri(
                        path: AppRoutes.restaurantMealForm,
                        queryParameters: {
                          'restaurantId': IriHelper.getId(widget.restaurantIri),
                        },
                      ).toString(),
                    );
                  },
                  icon: const Icon(Icons.add),
                  label: Text(AppLocalizations.of(context)!.addMeal),
                ),
          onRefresh: () async {
            _fetchMeals();
          },
          itemBuilder: (context, meal) {
            Widget descriptionWidget = Text(
              meal.description ?? AppLocalizations.of(context)!.noDescription,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            );

            // Always use Expanded for description in Grid
            descriptionWidget = Expanded(child: descriptionWidget);

            Widget actionWidget;
            if (widget.isSelectionMode) {
              actionWidget = Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PriceText(
                    priceGroszy: meal.price,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  FilledButton.tonalIcon(
                    onPressed: () {
                      context.pop(meal);
                    },
                    icon: const Icon(Icons.check),
                    label: const Text('Select'),
                  ),
                ],
              );
            } else {
              actionWidget = Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PriceText(
                    priceGroszy: meal.price,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton.filledTonal(
                        icon: const Icon(Icons.edit_outlined),
                        onPressed: () {
                          context.push(
                            Uri(
                              path: AppRoutes.restaurantMealForm,
                              queryParameters: {
                                'restaurantId': IriHelper.getId(
                                  widget.restaurantIri,
                                ),
                              },
                            ).toString(),
                            extra: meal,
                          );
                        },
                      ),
                      const SizedBox(width: 8),
                      IconButton.filledTonal(
                        icon: const Icon(Icons.delete_outline),
                        style: IconButton.styleFrom(
                          foregroundColor: Theme.of(context).colorScheme.error,
                          backgroundColor: Theme.of(
                            context,
                          ).colorScheme.errorContainer,
                        ),
                        onPressed: () async {
                          final confirm = await showDialog<bool>(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text(
                                AppLocalizations.of(context)!.deleteMeal,
                              ),
                              content: Text(
                                AppLocalizations.of(
                                  context,
                                )!.deleteMealConfirmation(meal.name),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, false),
                                  child: Text(
                                    AppLocalizations.of(context)!.cancel,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.pop(context, true),
                                  style: TextButton.styleFrom(
                                    foregroundColor: Colors.red,
                                  ),
                                  child: Text(
                                    AppLocalizations.of(context)!.delete,
                                  ),
                                ),
                              ],
                            ),
                          );

                          if (confirm == true && context.mounted) {
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
                      ),
                    ],
                  ),
                ],
              );
            }

            Widget content = Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  meal.name,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                descriptionWidget,
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  children: [
                    MacroBadge(
                      text:
                          '${AppLocalizations.of(context)!.calories}: ${meal.calories.toStringAsFixed(1)}',
                      icon: Icons.local_fire_department_outlined,
                    ),
                    MacroBadge(
                      text:
                          '${AppLocalizations.of(context)!.protein}: ${meal.protein.toStringAsFixed(1)}g',
                      icon: Icons.fitness_center_outlined,
                    ),
                    MacroBadge(
                      text:
                          '${AppLocalizations.of(context)!.fat}: ${meal.fat.toStringAsFixed(1)}g',
                      icon: Icons.water_drop_outlined,
                    ),
                    MacroBadge(
                      text:
                          '${AppLocalizations.of(context)!.carbs}: ${meal.carbs.toStringAsFixed(1)}g',
                      icon: Icons.grain_outlined,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                actionWidget,
              ],
            );

            // Always Expanded in Grid view (which we are now using for both modes)
            content = Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: content,
              ),
            );

            return Card(
              elevation: 2,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 140,
                    width: double.infinity,
                    child: meal.imageUrl != null && meal.imageUrl!.isNotEmpty
                        ? CustomCachedImage(
                            imageUrl: meal.imageUrl,
                            fit: BoxFit.cover,
                          )
                        : Container(
                            color: Theme.of(
                              context,
                            ).colorScheme.surfaceContainerHighest,
                            child: Icon(
                              Icons.fastfood,
                              size: 48,
                              color: Theme.of(
                                context,
                              ).colorScheme.onSurfaceVariant,
                            ),
                          ),
                  ),
                  content,
                ],
              ),
            );
          },
        );
      },
    );
  }
}
