import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/core/app_routes.dart';
import 'package:catering_flutter/features/restaurant/services/meal_plan_service.dart';
import 'package:catering_flutter/features/order/services/cart_service.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';
import 'package:catering_flutter/core/utils/iri_helper.dart';
import 'package:catering_flutter/core/auth_service.dart';
import 'package:catering_flutter/core/utils/image_helper.dart';
import 'package:catering_flutter/core/widgets/responsive_grid.dart';

class MealPlansScreen extends StatefulWidget {
  final String restaurantIri;

  const MealPlansScreen({super.key, required this.restaurantIri});

  @override
  State<MealPlansScreen> createState() => _MealPlansScreenState();
}

class _MealPlansScreenState extends State<MealPlansScreen> {
  String? _selectedCategory;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MealPlanService>().fetchMealPlansByRestaurant(
        widget.restaurantIri,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Meal Plans',
      child: Consumer2<MealPlanService, CartService>(
        builder: (context, mealPlanService, cartService, child) {
          if (mealPlanService.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (mealPlanService.hasError) {
            return Center(child: Text(mealPlanService.errorMessage!));
          } else if (mealPlanService.mealPlans.isEmpty) {
            return const Center(child: Text('No meal plans found.'));
          } else {
            // Extract unique categories from meal plans
            List<String> uniqueCategories = [];
            if (mealPlanService.mealPlans.isNotEmpty) {
              uniqueCategories = mealPlanService.mealPlans
                  .expand(
                    (mealPlan) =>
                        mealPlan.categories?.edges?.map((e) => e?.node?.name) ??
                        [],
                  )
                  .whereType<String>()
                  .toSet()
                  .toList();
            }

            // Filter meal plans by selected category
            final filteredMealPlans = _selectedCategory == null
                ? mealPlanService.mealPlans
                : mealPlanService.mealPlans.where((mealPlan) {
                    return mealPlan.categories?.edges?.any(
                          (e) => e?.node?.name == _selectedCategory,
                        ) ??
                        false;
                  }).toList();

            return Column(
              children: [
                _buildCategoryFilters(uniqueCategories),
                Expanded(
                  child: ResponsiveGridBuilder(
                    itemCount: filteredMealPlans.length,
                    childAspectRatio: 0.85,
                    itemBuilder: (context, index) {
                      final mealPlan = filteredMealPlans[index];
                      return Card(
                        elevation: 2,
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: InkWell(
                          onTap: () {
                            context.push(
                              Uri(
                                path: AppRoutes.mealPlanDetails,
                                queryParameters: {
                                  'id': IriHelper.getId(mealPlan.id),
                                },
                              ).toString(),
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Meal Plan Image
                              SizedBox(
                                height: 180,
                                width: double.infinity,
                                child:
                                    mealPlan.imageUrl != null &&
                                        mealPlan.imageUrl!.isNotEmpty
                                    ? Image.network(
                                        ImageHelper.getFullImageUrl(
                                          mealPlan.imageUrl!,
                                        )!,
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                Container(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .surfaceContainerHighest,
                                                  child: Center(
                                                    child: Icon(
                                                      Icons.fastfood,
                                                      size: 48,
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .onSurfaceVariant,
                                                    ),
                                                  ),
                                                ),
                                      )
                                    : Container(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.surfaceContainerHighest,
                                        child: Center(
                                          child: Icon(
                                            Icons.fastfood,
                                            size: 48,
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.onSurfaceVariant,
                                          ),
                                        ),
                                      ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            mealPlan.name,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge
                                                ?.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                        Text(
                                          '${((mealPlan.price ?? 0) / 100.0).toStringAsFixed(2)} PLN',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium
                                              ?.copyWith(
                                                color: Theme.of(
                                                  context,
                                                ).colorScheme.primary,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ],
                                    ),
                                    if (mealPlan.description != null &&
                                        mealPlan.description!.isNotEmpty) ...[
                                      const SizedBox(height: 8),
                                      Text(
                                        mealPlan.description!,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              color: Theme.of(
                                                context,
                                              ).colorScheme.onSurfaceVariant,
                                            ),
                                      ),
                                    ],
                                    // Category labels
                                    if (mealPlan.categories?.edges != null &&
                                        mealPlan
                                            .categories!
                                            .edges!
                                            .isNotEmpty) ...[
                                      const SizedBox(height: 12),
                                      Wrap(
                                        spacing: 8,
                                        runSpacing: 4,
                                        children: mealPlan.categories!.edges!
                                            .where((e) => e?.node != null)
                                            .map((e) {
                                              return Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 8,
                                                      vertical: 4,
                                                    ),
                                                decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .secondaryContainer,
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: Text(
                                                  e!.node!.name,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .labelSmall
                                                      ?.copyWith(
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .onSecondaryContainer,
                                                      ),
                                                ),
                                              );
                                            })
                                            .toList(),
                                      ),
                                    ],
                                    const SizedBox(height: 16),
                                    if (context.watch<AuthService>().hasRole(
                                      "ROLE_CUSTOMER",
                                    ))
                                      SizedBox(
                                        width: double.infinity,
                                        child: FilledButton.icon(
                                          onPressed: () {
                                            // Add the meal plan directly to cart
                                            cartService.addToCart(
                                              mealPlan,
                                              widget.restaurantIri,
                                              quantity: 1,
                                            );
                                            UIErrorHandler.showSnackBar(
                                              context,
                                              '${mealPlan.name} added to cart!',
                                              isError: false,
                                            );
                                          },
                                          icon: const Icon(
                                            Icons.add_shopping_cart,
                                          ),
                                          label: const Text('Add to Cart'),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _buildCategoryFilters(List<String> categories) {
    if (categories.isEmpty) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        spacing: 8.0,
        children: [
          ChoiceChip(
            label: const Text('All'),
            selected: _selectedCategory == null,
            onSelected: (selected) {
              setState(() {
                _selectedCategory = null;
              });
            },
          ),
          ...categories.map((categoryName) {
            return ChoiceChip(
              label: Text(categoryName),
              selected: _selectedCategory == categoryName,
              onSelected: (selected) {
                setState(() {
                  _selectedCategory = selected ? categoryName : null;
                });
              },
            );
          }),
        ],
      ),
    );
  }
}
