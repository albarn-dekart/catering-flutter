import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/core/app_router.dart';
import 'package:catering_flutter/features/restaurant/services/meal_plan_service.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';
import 'package:catering_flutter/core/utils/iri_helper.dart';
import 'package:catering_flutter/core/widgets/searchable_list_screen.dart';
import 'package:catering_flutter/l10n/app_localizations.dart';
import 'package:catering_flutter/core/widgets/meal_plan_card.dart';

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
    final isNarrow = MediaQuery.of(context).size.width < 700;
    return Consumer<MealPlanService>(
      builder: (context, mealPlanService, child) {
        return SearchableListScreen<MealPlan>(
          title: AppLocalizations.of(context)!.manageMealPlans,
          items: mealPlanService.mealPlans,
          isLoading: mealPlanService.isLoading,
          useGrid: true,
          preferredItemHeight: 420,
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
          floatingActionButton: isNarrow
              ? FloatingActionButton(
                  onPressed: () {
                    context.push(
                      Uri(
                        path: AppRoutes.restaurantMealPlanForm,
                        queryParameters: {
                          'restaurantId': IriHelper.getId(widget.restaurantIri),
                        },
                      ).toString(),
                    );
                  },
                  tooltip: AppLocalizations.of(context)!.addMealPlan,
                  child: const Icon(Icons.add),
                )
              : FloatingActionButton.extended(
                  onPressed: () {
                    context.push(
                      Uri(
                        path: AppRoutes.restaurantMealPlanForm,
                        queryParameters: {
                          'restaurantId': IriHelper.getId(widget.restaurantIri),
                        },
                      ).toString(),
                    );
                  },
                  icon: const Icon(Icons.add),
                  label: Text(AppLocalizations.of(context)!.addMealPlan),
                ),
          onRefresh: () async {
            _fetchMealPlans();
          },
          itemBuilder: (context, mealPlan) {
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
              actions: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton.filledTonal(
                    icon: const Icon(Icons.edit_outlined),
                    tooltip: AppLocalizations.of(context)!.edit,
                    onPressed: () {
                      context.push(
                        Uri(
                          path: AppRoutes.restaurantMealPlanForm,
                          queryParameters: {
                            'restaurantId': IriHelper.getId(
                              widget.restaurantIri,
                            ),
                          },
                        ).toString(),
                        extra: mealPlan,
                      );
                    },
                  ),
                  const SizedBox(width: 8),
                  IconButton.filledTonal(
                    icon: const Icon(Icons.delete_outline),
                    tooltip: AppLocalizations.of(context)!.delete,
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
                            AppLocalizations.of(context)!.deleteMealPlan,
                          ),
                          content: Text(
                            AppLocalizations.of(
                              context,
                            )!.deleteMealPlanConfirmation(mealPlan.name),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context, false),
                              child: Text(AppLocalizations.of(context)!.cancel),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context, true),
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.red,
                              ),
                              child: Text(AppLocalizations.of(context)!.delete),
                            ),
                          ],
                        ),
                      );

                      if (confirm == true && context.mounted) {
                        try {
                          await mealPlanService.deleteMealPlan(mealPlan.id);
                          if (context.mounted) {
                            UIErrorHandler.showSnackBar(
                              context,
                              AppLocalizations.of(
                                context,
                              )!.mealPlanDeletedSuccess,
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
                ],
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
