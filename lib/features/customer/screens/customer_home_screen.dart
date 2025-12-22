import 'package:catering_flutter/core/widgets/global_error_widget.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart';
import 'package:go_router/go_router.dart';
import 'package:catering_flutter/core/app_router.dart';
import 'package:catering_flutter/core/widgets/restaurant_card.dart';
import 'package:catering_flutter/core/widgets/meal_plan_card.dart';
import 'package:catering_flutter/core/widgets/responsive_grid.dart';
import 'package:catering_flutter/features/customer/services/home_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/l10n/app_localizations.dart';

class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({super.key});

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await context.read<HomeService>().fetchHomeData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CustomScaffold(
      title: AppLocalizations.of(context)!.home,
      child: Consumer<HomeService>(
        builder: (context, homeService, child) {
          final homeData = homeService.homeData;

          if (homeService.hasError && (homeData == null)) {
            return GlobalErrorWidget(
              message: homeService.errorMessage,
              onRetry: () => homeService.fetchHomeData(),
              withScaffold: false,
            );
          }

          if (homeService.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (homeData == null) {
            return Center(
              child: Text(AppLocalizations.of(context)!.unableToLoadHomeData),
            );
          }

          return RefreshIndicator(
            onRefresh: () => context.read<HomeService>().fetchHomeData(),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Hero Section
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          theme.colorScheme.primary,
                          theme.colorScheme.primary.withValues(alpha: 0.8),
                          Color.lerp(
                            theme.colorScheme.primary,
                            theme.colorScheme.shadow,
                            0.2,
                          )!,
                        ],
                        stops: const [0.0, 0.5, 1.0],
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 64,
                      horizontal: 24,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.welcomeBack,
                          style: theme.textTheme.displaySmall?.copyWith(
                            color: theme.colorScheme.onPrimary,
                            fontWeight: FontWeight.normal,
                            letterSpacing: -1,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          AppLocalizations.of(context)!.discoverMessage,
                          style: theme.textTheme.titleLarge?.copyWith(
                            color: theme.colorScheme.onPrimary.withValues(
                              alpha: 0.9,
                            ),
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Custom Meal Plan Promo
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Card(
                      elevation: 0,
                      color: theme.colorScheme.surfaceContainerHighest,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: BorderSide(
                          color: theme.colorScheme.outlineVariant,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.edit_note,
                                  size: 32,
                                  color: theme.colorScheme.primary,
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    AppLocalizations.of(
                                      context,
                                    )!.customMealPlanPromoTitle,
                                    style: theme.textTheme.titleLarge?.copyWith(
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              AppLocalizations.of(
                                context,
                              )!.customMealPlanPromoSubtitle,
                              style: theme.textTheme.bodyLarge?.copyWith(
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                            const SizedBox(height: 24),
                            Wrap(
                              spacing: 12,
                              runSpacing: 12,
                              children: [
                                FilledButton.icon(
                                  onPressed: () =>
                                      context.push(AppRoutes.restaurants),
                                  icon: const Icon(Icons.add),
                                  label: Text(
                                    AppLocalizations.of(context)!.startBuilding,
                                  ),
                                ),
                                OutlinedButton.icon(
                                  onPressed: () =>
                                      context.push(AppRoutes.myMealPlans),
                                  icon: const Icon(Icons.list_alt),
                                  label: Text(
                                    AppLocalizations.of(context)!.viewMyPlans,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Featured Restaurants Section
                  if (homeData.featuredRestaurants.isNotEmpty) ...[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: Wrap(
                          alignment: WrapAlignment.spaceBetween,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          runSpacing: 12.0,
                          spacing: 16.0,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.featuredRestaurants,
                              style: theme.textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            TextButton(
                              onPressed: () =>
                                  context.push(AppRoutes.restaurants),
                              child: Text(
                                AppLocalizations.of(context)!.viewAll,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: ResponsiveGrid(
                        preferredItemHeight: 300,
                        children: homeData.featuredRestaurants
                            .map(
                              (restaurant) => RestaurantCard(
                                id: restaurant.id,
                                name: restaurant.name,
                                description: restaurant.description,
                                imageUrl: restaurant.imageUrl,
                                orderCount: restaurant.orderCount,
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],

                  // Popular Meal Plans Section
                  if (homeData.popularMealPlans.isNotEmpty) ...[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.popularMealPlans,
                            style: theme.textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Icon(
                            Icons.local_fire_department,
                            color: theme.colorScheme.primary,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: ResponsiveGrid(
                        preferredItemHeight: 300,
                        padding: EdgeInsets.zero,
                        children: homeData.popularMealPlans
                            .map(
                              (mealPlan) => MealPlanCard(
                                id: mealPlan.id,
                                name: mealPlan.name,
                                imageUrl: mealPlan.imageUrl,
                                restaurantName: mealPlan.restaurantName,
                                description: mealPlan.description,
                                price: mealPlan.price,
                                orderCount: mealPlan.orderCount,
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    const SizedBox(height: 32),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
