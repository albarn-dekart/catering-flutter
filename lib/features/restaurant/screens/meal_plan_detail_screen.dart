import 'package:catering_flutter/core/widgets/app_card.dart';
import 'package:catering_flutter/core/widgets/app_premium_button.dart';
import 'package:catering_flutter/core/widgets/global_error_widget.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/features/restaurant/services/meal_plan_service.dart';
import 'package:catering_flutter/features/order/services/cart_service.dart';
import 'package:catering_flutter/core/services/auth_service.dart';
import 'package:catering_flutter/core/app_router.dart';
import 'package:catering_flutter/core/utils/iri_helper.dart';
import 'package:go_router/go_router.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';
import 'package:catering_flutter/core/widgets/custom_cached_image.dart';
import 'package:catering_flutter/l10n/app_localizations.dart';
import 'package:catering_flutter/core/widgets/nutrient_row.dart';
import 'package:catering_flutter/core/widgets/price_text.dart';
import 'package:catering_flutter/core/widgets/meal_card.dart';
import 'package:catering_flutter/core/widgets/responsive_grid.dart';

class MealPlanDetailScreen extends StatefulWidget {
  final String mealPlanIri;

  const MealPlanDetailScreen({super.key, required this.mealPlanIri});

  @override
  State<MealPlanDetailScreen> createState() => _MealPlanDetailScreenState();
}

class _MealPlanDetailScreenState extends State<MealPlanDetailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await context.read<MealPlanService>().getMealPlanById(widget.mealPlanIri);
    });
  }

  @override
  void dispose() {
    context.read<MealPlanService>().clearError();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authService = context.watch<AuthService>();
    final isCustomer = authService.hasRole("ROLE_CUSTOMER");

    return CustomScaffold(
      title: AppLocalizations.of(context)!.mealPlanDetails,
      child: Consumer2<MealPlanService, CartService>(
        builder: (context, mealPlanService, cartService, child) {
          if (mealPlanService.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (mealPlanService.hasError &&
              mealPlanService.currentMealPlan == null) {
            return RefreshIndicator(
              onRefresh: () =>
                  mealPlanService.getMealPlanById(widget.mealPlanIri),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    child: SizedBox(
                      height: constraints.maxHeight,
                      child: GlobalErrorWidget(
                        message: mealPlanService.errorMessage,
                        onRetry: () =>
                            mealPlanService.getMealPlanById(widget.mealPlanIri),
                        onCancel: () {
                          mealPlanService.clearError();
                          context.pop();
                        },
                        withScaffold: false,
                      ),
                    ),
                  );
                },
              ),
            );
          } else if (mealPlanService.currentMealPlan != null) {
            final mealPlan = mealPlanService.currentMealPlan!;
            final restaurantIri = mealPlan.restaurant?.id;

            return Column(
              children: [
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      await context.read<MealPlanService>().getMealPlanById(
                        widget.mealPlanIri,
                      );
                    },
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Header Image
                          SizedBox(
                            height: 250,
                            width: double.infinity,
                            child:
                                mealPlan.imageUrl != null &&
                                    mealPlan.imageUrl!.isNotEmpty
                                ? CustomCachedImage(
                                    imageUrl: mealPlan.imageUrl,
                                    fit: BoxFit.cover,
                                  )
                                : Container(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.surfaceContainerHighest,
                                    child: Center(
                                      child: Icon(
                                        Icons.restaurant_menu,
                                        size: 64,
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.onSurfaceVariant,
                                      ),
                                    ),
                                  ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        mealPlan.name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium
                                            ?.copyWith(
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ),
                                    PriceText(
                                      priceGroszy: mealPlan.price!,
                                      style: PriceText.standardStyle(context),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                if (mealPlan.description != null &&
                                    mealPlan.description!.isNotEmpty)
                                  Text(
                                    mealPlan.description!,
                                    style: Theme.of(context).textTheme.bodyLarge
                                        ?.copyWith(
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.onSurfaceVariant,
                                        ),
                                  ),
                                const SizedBox(height: 24),
                                Row(
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!.summary,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                    const SizedBox(width: 8),
                                    const Expanded(child: Divider()),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                NutrientRow(
                                  calories: mealPlan.calories,
                                  protein: mealPlan.protein,
                                  fat: mealPlan.fat,
                                  carbs: mealPlan.carbs,
                                  compact: false,
                                ),
                                const SizedBox(height: 32),
                                Text(
                                  AppLocalizations.of(context)!.mealsIncluded,
                                  style: Theme.of(context).textTheme.titleLarge
                                      ?.copyWith(fontWeight: FontWeight.normal),
                                ),
                                const SizedBox(height: 16),
                                // Handle GraphQL meals structure with ResponsiveGrid
                                if (mealPlan.meals?.edges != null &&
                                    mealPlan.meals!.edges!.isNotEmpty)
                                  ResponsiveGrid(
                                    maxColumns: 1,
                                    children: mealPlan.meals!.edges!
                                        .where((edge) => edge?.node != null)
                                        .map((edge) {
                                          final meal = edge!.node!;
                                          return MealCard(
                                            name: meal.name,
                                            imageUrl: meal.imageUrl,
                                            description: meal.description,
                                            priceGroszy:
                                                (meal.price as num? ?? 0)
                                                    .toDouble(),
                                            calories: (meal.calories as num?)
                                                ?.toDouble(),
                                            protein: (meal.protein as num?)
                                                ?.toDouble(),
                                            fat: (meal.fat as num?)?.toDouble(),
                                            carbs: (meal.carbs as num?)
                                                ?.toDouble(),
                                          );
                                        })
                                        .toList(),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Add to Cart button at the bottom
                if ((isCustomer || !authService.isAuthenticated) &&
                    restaurantIri != null)
                  AppCard(
                    padding: const EdgeInsets.all(16),
                    child: SafeArea(
                      child: SizedBox(
                        width: double.infinity,
                        child: AppPremiumButton(
                          onPressed: () {
                            if (!authService.isAuthenticated) {
                              final currentPath = Uri(
                                path: AppRoutes.mealPlanDetails,
                                queryParameters: {
                                  'id': IriHelper.getId(widget.mealPlanIri),
                                },
                              ).toString();
                              context.go(
                                Uri(
                                  path: AppRoutes.login,
                                  queryParameters: {'redirect': currentPath},
                                ).toString(),
                              );
                              return;
                            }

                            if (cartService.isDifferentRestaurant(
                              restaurantIri,
                            )) {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text(
                                    AppLocalizations.of(
                                      context,
                                    )!.clearCartQuestion,
                                  ),
                                  content: Text(
                                    AppLocalizations.of(
                                      context,
                                    )!.clearCartMessage,
                                  ), // Ensure this key exists
                                  actions: [
                                    TextButton.icon(
                                      onPressed: () => Navigator.pop(context),
                                      icon: const Icon(Icons.close),
                                      label: Text(
                                        AppLocalizations.of(context)!.cancel,
                                      ),
                                    ),
                                    TextButton.icon(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        cartService.clearCart();
                                        cartService.addToCart(
                                          mealPlan,
                                          restaurantIri,
                                          mealPlan.restaurant?.deliveryPrice ??
                                              0,
                                          quantity: 1,
                                        );
                                        if (context.mounted) {
                                          UIErrorHandler.showSnackBar(
                                            context,
                                            AppLocalizations.of(
                                              context,
                                            )!.addedToCart(mealPlan.name),
                                            isError: false,
                                          );
                                        }
                                      },
                                      icon: const Icon(
                                        Icons.shopping_cart_checkout,
                                      ),
                                      label: Text(
                                        AppLocalizations.of(
                                          context,
                                        )!.clearAndAdd,
                                      ), // Ensure this key exists
                                    ),
                                  ],
                                ),
                              );
                              return;
                            }

                            cartService.addToCart(
                              mealPlan,
                              restaurantIri,
                              mealPlan.restaurant?.deliveryPrice ?? 0,
                              quantity: 1,
                            );
                            UIErrorHandler.showSnackBar(
                              context,
                              AppLocalizations.of(
                                context,
                              )!.addedToCart(mealPlan.name),
                              isError: false,
                            );
                          },
                          icon: Icons.add_shopping_cart,
                          label: AppLocalizations.of(context)!.addToCart,
                        ),
                      ),
                    ),
                  ),
              ],
            );
          }
          return RefreshIndicator(
            onRefresh: () =>
                mealPlanService.getMealPlanById(widget.mealPlanIri),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  child: SizedBox(
                    height: constraints.maxHeight,
                    child: Center(
                      child: Text(AppLocalizations.of(context)!.noMealPlanData),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
