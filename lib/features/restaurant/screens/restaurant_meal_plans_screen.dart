import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/core/app_router.dart';
import 'package:catering_flutter/features/restaurant/services/meal_plan_service.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';
import 'package:catering_flutter/core/utils/iri_helper.dart';
import 'package:catering_flutter/core/widgets/searchable_list_screen.dart';
import 'package:catering_flutter/l10n/app_localizations.dart';
import 'package:catering_flutter/core/widgets/meal_card.dart';
import 'package:catering_flutter/core/widgets/card_action_buttons.dart';

class RestaurantMealPlansScreen extends StatefulWidget {
  final String restaurantIri;

  const RestaurantMealPlansScreen({super.key, required this.restaurantIri});

  @override
  State<RestaurantMealPlansScreen> createState() =>
      _RestaurantMealPlansScreenState();
}

class _RestaurantMealPlansScreenState extends State<RestaurantMealPlansScreen> {
  String _currentSearchQuery = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchMealPlans();
    });
  }

  void _fetchMealPlans() {
    context.read<MealPlanService>().fetchMealPlansByRestaurant(
      widget.restaurantIri,
      searchQuery: _currentSearchQuery,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MealPlanService>(
      builder: (context, mealPlanService, child) {
        return SearchableListScreen<MealPlan>(
          title: AppLocalizations.of(context)!.manageMealPlans,
          items: mealPlanService.mealPlans,
          isLoading: mealPlanService.isLoading,
          isLoadingMore: mealPlanService.isFetchingMore,
          useGrid: true,
          onLoadMore: () async {
            if (!mealPlanService.isFetchingMore &&
                mealPlanService.hasNextPage) {
              await mealPlanService.loadMoreMealPlansByRestaurant(
                widget.restaurantIri,
              );
            }
          },
          searchHint: AppLocalizations.of(context)!.searchMealPlans,

          onSearch: (query) {
            _currentSearchQuery = query;
            _fetchMealPlans();
          },
          onCreate: () {
            context.push(
              Uri(
                path: AppRoutes.restaurantMealPlanForm,
                queryParameters: {
                  'restaurantId': IriHelper.getId(widget.restaurantIri),
                },
              ).toString(),
            );
          },
          onRefresh: () async {
            _fetchMealPlans();
          },
          hasError: mealPlanService.hasError,
          errorMessage: mealPlanService.errorMessage,
          onRetry: _fetchMealPlans,
          itemBuilder: (context, mealPlan) {
            return MealCard(
              id: mealPlan.id,
              name: mealPlan.name,
              description: mealPlan.description,
              imageUrl: mealPlan.imageUrl,
              priceGroszy: (mealPlan.price ?? 0).toDouble(),
              priceSuffix: AppLocalizations.of(context)!.perDay,
              calories: mealPlan.calories?.toDouble(),
              protein: mealPlan.protein?.toDouble(),
              fat: mealPlan.fat?.toDouble(),
              carbs: mealPlan.carbs?.toDouble(),
              dietCategories: mealPlan.dietCategories?.edges
                  ?.map((e) => e?.node?.name)
                  .whereType<String>()
                  .toList(),

              actions: CardActionButtons(
                onEdit: () {
                  context.push(
                    Uri(
                      path: AppRoutes.restaurantMealPlanForm,
                      queryParameters: {
                        'restaurantId': IriHelper.getId(widget.restaurantIri),
                      },
                    ).toString(),
                    extra: mealPlan,
                  );
                },
                onDelete: () async {
                  final confirmed = await DeleteConfirmationDialog.show(
                    context: context,
                    title: AppLocalizations.of(context)!.deleteMealPlan,
                    message: AppLocalizations.of(
                      context,
                    )!.deleteMealPlanConfirmation(mealPlan.name),
                  );

                  if (confirmed && context.mounted) {
                    try {
                      await mealPlanService.deleteMealPlan(mealPlan.id);
                      if (context.mounted) {
                        UIErrorHandler.showSnackBar(
                          context,
                          AppLocalizations.of(context)!.mealPlanDeletedSuccess,
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
                          )!.mealPlanDeleteFailed,
                        );
                      }
                    }
                  }
                },
              ),
              onTap: () {
                // Navigate to details if needed, or maybe just edit?
                // Usually managerial list tap -> edit or details.
                // Let's go to details for now.
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
