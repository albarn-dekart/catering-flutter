import 'package:catering_flutter/core/widgets/global_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/features/restaurant/services/meal_plan_service.dart';
import 'package:catering_flutter/features/order/services/cart_service.dart';
import 'package:catering_flutter/core/services/auth_service.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';
import 'package:catering_flutter/core/widgets/custom_cached_image.dart';
import 'package:catering_flutter/l10n/app_localizations.dart';
import 'package:catering_flutter/core/widgets/macro_badge.dart';
import 'package:catering_flutter/core/widgets/price_text.dart';

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
            return GlobalErrorWidget(
              message: mealPlanService.errorMessage,
              onRetry: () =>
                  mealPlanService.getMealPlanById(widget.mealPlanIri),
              withScaffold: false,
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
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.primary,
                                            fontWeight: FontWeight.normal,
                                          ),
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
                                Wrap(
                                  spacing: 8,
                                  runSpacing: 4,
                                  children: [
                                    MacroBadge(
                                      text:
                                          '${AppLocalizations.of(context)!.calories}: ${mealPlan.calories?.toStringAsFixed(0)}',
                                      icon:
                                          Icons.local_fire_department_outlined,
                                    ),
                                    MacroBadge(
                                      text:
                                          '${AppLocalizations.of(context)!.protein}: ${mealPlan.protein?.toStringAsFixed(1)}g',
                                      icon: Icons.fitness_center_outlined,
                                    ),
                                    MacroBadge(
                                      text:
                                          '${AppLocalizations.of(context)!.fat}: ${mealPlan.fat?.toStringAsFixed(1)}g',
                                      icon: Icons.water_drop_outlined,
                                    ),
                                    MacroBadge(
                                      text:
                                          '${AppLocalizations.of(context)!.carbs}: ${mealPlan.carbs?.toStringAsFixed(1)}g',
                                      icon: Icons.grain_outlined,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 32),
                                Text(
                                  AppLocalizations.of(context)!.mealsIncluded,
                                  style: Theme.of(context).textTheme.titleLarge
                                      ?.copyWith(fontWeight: FontWeight.normal),
                                ),
                                const SizedBox(height: 16),
                                // Handle GraphQL meals structure
                                ...(mealPlan.meals?.edges?.map((edge) {
                                      final meal = edge?.node;
                                      if (meal == null) return const SizedBox();
                                      return _buildMealCard(context, meal);
                                    }).whereType<Widget>() ??
                                    []),
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
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 8,
                          offset: const Offset(0, -2),
                        ),
                      ],
                    ),
                    child: SafeArea(
                      child: SizedBox(
                        width: double.infinity,
                        child: FilledButton.icon(
                          onPressed: () {
                            if (!authService.isAuthenticated) {
                              UIErrorHandler.showSnackBar(
                                context,
                                AppLocalizations.of(context)!.signInToContinue,
                                isError: false,
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
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text(
                                        AppLocalizations.of(context)!.cancel,
                                      ),
                                    ),
                                    TextButton(
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
                                      child: Text(
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
                          icon: const Icon(Icons.add_shopping_cart),
                          label: Text(AppLocalizations.of(context)!.addToCart),
                          style: FilledButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            );
          }
          return Center(
            child: Text(AppLocalizations.of(context)!.noMealPlanData),
          );
        },
      ),
    );
  }

  Widget _buildMealCard(BuildContext context, dynamic meal) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (meal.imageUrl != null && meal.imageUrl!.isNotEmpty)
            SizedBox(
              height: 150,
              width: double.infinity,
              child: CustomCachedImage(
                imageUrl: meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        meal.name,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    PriceText(
                      priceGroszy: meal.price!,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                if (meal.description != null &&
                    meal.description!.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Text(
                    meal.description!,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
                const SizedBox(height: 16),
                Wrap(
                  spacing: 16,
                  runSpacing: 8,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
