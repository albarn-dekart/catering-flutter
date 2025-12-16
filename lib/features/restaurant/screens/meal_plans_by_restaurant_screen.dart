import 'dart:async';
import 'package:flutter/material.dart';
import 'package:catering_flutter/core/widgets/advanced_filters_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/core/app_router.dart';
import 'package:catering_flutter/features/restaurant/services/meal_plan_service.dart';
import 'package:catering_flutter/core/utils/iri_helper.dart';
import 'package:catering_flutter/core/widgets/searchable_list_screen.dart';
import 'package:catering_flutter/l10n/app_localizations.dart';
import 'package:catering_flutter/core/widgets/meal_plan_card.dart';
import 'package:catering_flutter/core/services/auth_service.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';

class MealPlansByRestaurant extends StatefulWidget {
  final String restaurantIri;

  const MealPlansByRestaurant({super.key, required this.restaurantIri});

  @override
  State<MealPlansByRestaurant> createState() => _MealPlansByRestaurantState();
}

class _MealPlansByRestaurantState extends State<MealPlansByRestaurant> {
  String? _selectedCategory;
  RangeValues? _calorieRange;
  RangeValues? _proteinRange;
  RangeValues? _fatRange;
  RangeValues? _carbRange;
  RangeValues? _priceRange;

  // Track maximum values seen to adapt filters dynamically
  final FilterLimitTracker _filterLimits = FilterLimitTracker();

  bool _showAdvancedFilters = false;
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
      context.read<MealPlanService>().fetchMealPlansByRestaurant(
        widget.restaurantIri,
      );
    });
  }

  void _onFilterChanged() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      final service = context.read<MealPlanService>();
      service.fetchMealPlansByRestaurant(
        widget.restaurantIri,
        searchQuery: service.currentSearchQuery,
        category: _selectedCategory,
        priceRange: _priceRange,
        calorieRange: _calorieRange,
        proteinRange: _proteinRange,
        fatRange: _fatRange,
        carbRange: _carbRange,
      );
    });
  }

  final Set<String> _availableCategories = {};

  // ... (existing helper methods if any, usually none here)

  @override
  Widget build(BuildContext context) {
    final isNarrow = MediaQuery.of(context).size.width < 700;
    return Consumer<MealPlanService>(
      builder: (context, mealPlanService, child) {
        // Extract unique categories from meal plans only when not filtering by category
        // This ensures we don't lose the list of other categories when one is selected.
        if (_selectedCategory == null && mealPlanService.mealPlans.isNotEmpty) {
          final newCategories = mealPlanService.mealPlans
              .expand(
                (mealPlan) =>
                    mealPlan.dietCategories?.edges?.map((e) => e?.node?.name) ??
                    [],
              )
              .whereType<String>();
          _availableCategories.addAll(newCategories);
        }

        List<String> uniqueCategories = _availableCategories.toList();

        // Dynamically update filter limits based on loaded data
        _filterLimits.updateFrom(
          mealPlanService.mealPlans,
          getPricePLN: (plan) =>
              plan.price != null ? plan.price! / 100.0 : null,
          getCalories: (plan) => plan.calories,
          getProtein: (plan) => plan.protein,
          getFat: (plan) => plan.fat,
          getCarbs: (plan) => plan.carbs,
        );

        double maxPrice = _filterLimits.maxPrice;
        double maxCalories = _filterLimits.maxCalories;
        double maxProtein = _filterLimits.maxProtein;
        double maxFat = _filterLimits.maxFat;
        double maxCarbs = _filterLimits.maxCarbs;

        return SearchableListScreen(
          title: AppLocalizations.of(context)!.mealPlans,
          items: mealPlanService.mealPlans,
          isLoading: mealPlanService.isLoading,
          searchHint: AppLocalizations.of(context)!.searchMealPlans,
          onRefresh: () async {
            await mealPlanService.fetchMealPlansByRestaurant(
              widget.restaurantIri,
            );
          },
          floatingActionButton: isNarrow
              ? FloatingActionButton(
                  onPressed: () {
                    final authService = context.read<AuthService>();
                    if (!authService.isAuthenticated) {
                      UIErrorHandler.showSnackBar(
                        context,
                        AppLocalizations.of(context)!.signInToContinue,
                        isError: false,
                      );
                      return;
                    }
                    context.push(
                      Uri(
                        path: AppRoutes.customMealPlanBuilder,
                        queryParameters: {
                          'restaurantId': IriHelper.getId(widget.restaurantIri),
                        },
                      ).toString(),
                    );
                  },
                  tooltip: AppLocalizations.of(context)!.createCustomPlan,
                  child: const Icon(Icons.add),
                )
              : FloatingActionButton.extended(
                  onPressed: () {
                    final authService = context.read<AuthService>();
                    if (!authService.isAuthenticated) {
                      UIErrorHandler.showSnackBar(
                        context,
                        AppLocalizations.of(context)!.signInToContinue,
                        isError: false,
                      );
                      return;
                    }
                    context.push(
                      Uri(
                        path: AppRoutes.customMealPlanBuilder,
                        queryParameters: {
                          'restaurantId': IriHelper.getId(widget.restaurantIri),
                        },
                      ).toString(),
                    );
                  },
                  label: Text(AppLocalizations.of(context)!.createCustomPlan),
                  icon: const Icon(Icons.add),
                ),
          onLoadMore: () async {
            if (!mealPlanService.isFetchingMore &&
                mealPlanService.hasNextPage) {
              await mealPlanService.loadMoreMealPlansByRestaurant(
                widget.restaurantIri,
              );
            }
          },
          useGrid: true,
          preferredItemHeight: 420,
          customFilters: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FilterChipsBar<String>(
                  values: uniqueCategories,
                  selectedValue: _selectedCategory,
                  allLabel: AppLocalizations.of(context)!.all,
                  labelBuilder: (category) => category,
                  onSelected: (category) {
                    setState(() {
                      _selectedCategory = category;
                    });
                    _onFilterChanged();
                  },
                ),
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
            mealPlanService.fetchMealPlansByRestaurant(
              widget.restaurantIri,
              searchQuery: query,
              category: _selectedCategory,
              priceRange: _priceRange,
              calorieRange: _calorieRange,
              proteinRange: _proteinRange,
              fatRange: _fatRange,
              carbRange: _carbRange,
            );
          },
          itemBuilder: (context, mealPlan) {
            final dietCategories =
                mealPlan.dietCategories?.edges
                    ?.map((e) => e?.node?.name)
                    .whereType<String>()
                    .toList() ??
                [];

            return MealPlanCard(
              id: mealPlan.id,
              name: mealPlan.name,
              description: mealPlan.description,
              imageUrl: mealPlan.imageUrl,
              price: (mealPlan.price ?? 0).toDouble(),
              calories: mealPlan.calories?.toDouble(),
              protein: mealPlan.protein?.toDouble(),
              fat: mealPlan.fat?.toDouble(),
              carbs: mealPlan.carbs?.toDouble(),
              dietCategories: dietCategories,
              onTap: () {
                context.push(
                  Uri(
                    path: AppRoutes.mealPlanDetails,
                    queryParameters: {
                      'id': IriHelper.getId(mealPlan.id),
                      'restaurantId': IriHelper.getId(widget.restaurantIri),
                    },
                  ).toString(),
                );
              },
            );
          },
        );
      },
    );
  }
}
