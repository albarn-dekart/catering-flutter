import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:catering_flutter/core/app_router.dart';
import 'package:catering_flutter/features/restaurant/services/meal_plan_service.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';
import 'package:catering_flutter/core/utils/iri_helper.dart';
import 'package:catering_flutter/core/widgets/searchable_list_screen.dart';
import 'package:catering_flutter/l10n/app_localizations.dart';
import 'package:catering_flutter/core/services/auth_service.dart';
import 'package:catering_flutter/core/widgets/meal_card.dart';
import 'package:catering_flutter/core/widgets/card_action_buttons.dart';

class CustomerMealPlansScreen extends StatefulWidget {
  const CustomerMealPlansScreen({super.key});

  @override
  State<CustomerMealPlansScreen> createState() =>
      _CustomerMealPlansScreenState();
}

class _CustomerMealPlansScreenState extends State<CustomerMealPlansScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final userIri = context.read<AuthService>().userIri;
      if (userIri != null) {
        context.read<MealPlanService>().fetchMyCustomMealPlans(userIri);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MealPlanService>(
      builder: (context, mealPlanService, child) {
        return SearchableListScreen(
          title: AppLocalizations.of(context)!.myMealPlans,
          items: mealPlanService.mealPlans,
          isLoading: mealPlanService.isLoading,
          totalItems: mealPlanService.totalItems,
          hasError: mealPlanService.hasError,
          errorMessage: mealPlanService.errorMessage,
          onRetry: () {
            final userIri = context.read<AuthService>().userIri;
            if (userIri != null) {
              mealPlanService.fetchMyCustomMealPlans(userIri);
            }
          },
          searchHint: AppLocalizations.of(context)!.searchMealPlans,
          onSearch: (query) {
            final userIri = context.read<AuthService>().userIri;
            if (userIri != null) {
              mealPlanService.fetchMyCustomMealPlans(
                userIri,
                searchQuery: query,
              );
            }
          },
          onRefresh: () async {
            final userIri = context.read<AuthService>().userIri;
            if (userIri != null) {
              await mealPlanService.fetchMyCustomMealPlans(userIri);
            }
          },
          onCreate: () =>
              context.push('${AppRoutes.restaurants}?intent=build_meal_plan'),
          useGrid: true,

          itemBuilder: (context, mealPlan) {
            return MealCard(
              id: mealPlan.id,
              name: mealPlan.name,
              description: mealPlan.description,
              imageUrl: mealPlan.imageUrl,
              restaurantName: mealPlan.restaurant?.name,
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
                onEdit: mealPlan.restaurant?.id != null
                    ? () {
                        context.push(
                          Uri(
                            path: AppRoutes.customMealPlanBuilder,
                            queryParameters: {
                              'restaurantId': IriHelper.getId(
                                mealPlan.restaurant!.id,
                              ),
                            },
                          ).toString(),
                          extra: mealPlan,
                        );
                      }
                    : null,
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
                context.push(
                  Uri(
                    path: AppRoutes.mealPlanDetails,
                    queryParameters: {
                      'id': IriHelper.getId(mealPlan.id),
                      if (mealPlan.restaurant?.id != null)
                        'restaurantId': IriHelper.getId(
                          mealPlan.restaurant!.id,
                        ),
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
