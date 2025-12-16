import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:catering_flutter/core/app_router.dart';
import 'package:catering_flutter/features/restaurant/services/meal_plan_service.dart';
import 'package:catering_flutter/core/utils/iri_helper.dart';
import 'package:catering_flutter/core/widgets/searchable_list_screen.dart';
import 'package:catering_flutter/l10n/app_localizations.dart';
import 'package:catering_flutter/core/services/auth_service.dart';
import 'package:catering_flutter/core/widgets/meal_plan_card.dart';

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
    final isNarrow = MediaQuery.of(context).size.width < 700;
    return Consumer<MealPlanService>(
      builder: (context, mealPlanService, child) {
        return SearchableListScreen(
          title: AppLocalizations.of(context)!.myMealPlans,
          items: mealPlanService.mealPlans,
          isLoading: mealPlanService.isLoading,
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
          floatingActionButton: isNarrow
              ? FloatingActionButton(
                  onPressed: () {
                    context.push(AppRoutes.restaurants);
                  },
                  tooltip: AppLocalizations.of(context)!.createCustomPlan,
                  child: const Icon(Icons.add),
                )
              : FloatingActionButton.extended(
                  onPressed: () {
                    context.push(AppRoutes.restaurants);
                  },
                  icon: const Icon(Icons.add),
                  label: Text(AppLocalizations.of(context)!.createCustomPlan),
                ),
          useGrid: true,
          preferredItemHeight: 350,
          itemBuilder: (context, mealPlan) {
            return MealPlanCard(
              id: mealPlan.id,
              name: mealPlan.name,
              imageUrl: mealPlan.imageUrl,
              restaurantName: mealPlan.restaurant?.name,
              price: (mealPlan.price ?? 0).toDouble(),
              calories: mealPlan.calories?.toDouble(),
              protein: mealPlan.protein?.toDouble(),
              fat: mealPlan.fat?.toDouble(),
              carbs: mealPlan.carbs?.toDouble(),
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
