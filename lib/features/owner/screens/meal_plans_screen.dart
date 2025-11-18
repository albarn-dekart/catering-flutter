import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/core/app_routes.dart';
import 'package:catering_flutter/features/owner/services/meal_plan_service.dart';
import 'package:catering_flutter/features/authentication/services/auth_service.dart';
import 'package:catering_flutter/features/customer/services/cart_service.dart';
import 'package:catering_flutter/features/customer/models/cart_item_model.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart'; // Import CustomScaffold

class MealPlansScreen extends StatefulWidget {
  final int restaurantId;

  const MealPlansScreen({super.key, required this.restaurantId});

  @override
  State<MealPlansScreen> createState() => _MealPlansScreenState();
}

class _MealPlansScreenState extends State<MealPlansScreen> {
  String? _selectedCategory;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MealPlanService>().getMealPlans(widget.restaurantId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Meal Plans',
      child: Consumer3<MealPlanService, AuthService, CartService>(
        builder: (context, mealPlanService, authService, cartService, child) {
          if (mealPlanService.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (mealPlanService.hasError) {
            return Center(child: Text(mealPlanService.errorMessage!));
          } else if (mealPlanService.mealPlans.isEmpty) {
            return const Center(child: Text('No meal plans found.'));
          } else {
            final allMealPlans = mealPlanService.mealPlans;
            final isAuthenticated = authService.isAuthenticated;

            final categories = allMealPlans
                .expand((plan) => plan.categories)
                .map((c) => c.name)
                .toSet()
                .toList();

            final filteredMealPlans = _selectedCategory == null
                ? allMealPlans
                : allMealPlans.where((plan) {
                    return plan.categories.any(
                      (c) => c.name == _selectedCategory,
                    );
                  }).toList();

            return Column(
              children: [
                _buildCategoryFilters(categories),
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredMealPlans.length,
                    itemBuilder: (context, index) {
                      final mealPlan = filteredMealPlans[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 16.0,
                        ),
                        elevation: 4.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: InkWell(
                          onTap: () {
                            context.push(
                              AppRoutes.mealPlanDetails.replaceAll(
                                ':mealPlanId',
                                mealPlan.id.toString(),
                              ),
                            );
                          },
                          borderRadius: BorderRadius.circular(12.0),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                mealPlan.imageUrl != null &&
                                        mealPlan.imageUrl!.isNotEmpty
                                    ? SizedBox(
                                        width: 80,
                                        height: 80,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            8.0,
                                          ),
                                          child: Image.network(
                                            mealPlan.imageUrl!,
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) =>
                                                    const Icon(
                                                      Icons.broken_image,
                                                    ),
                                          ),
                                        ),
                                      )
                                    : const SizedBox(
                                        width: 80,
                                        height: 80,
                                        child: Icon(Icons.fastfood, size: 40),
                                      ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        mealPlan.name,
                                        style: Theme.of(
                                          context,
                                        ).textTheme.titleMedium,
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        mealPlan.description ?? '',
                                        style: Theme.of(
                                          context,
                                        ).textTheme.bodyMedium,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        'Price: ${(mealPlan.price).toStringAsFixed(2)} PLN/day',
                                        style: Theme.of(
                                          context,
                                        ).textTheme.titleSmall,
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.add_shopping_cart),
                                  onPressed: isAuthenticated
                                      ? () {
                                          cartService.addItemToCart(
                                            CartItem(
                                              mealPlan: mealPlan,
                                              quantity: 1,
                                              restaurantId: widget.restaurantId,
                                            ),
                                          );
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                '${mealPlan.name} added to cart!',
                                              ),
                                            ),
                                          );
                                        }
                                      : () {
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            SnackBar(
                                              content: const Text(
                                                'Please log in to add items to cart.',
                                              ),
                                              action: SnackBarAction(
                                                label: 'Log In',
                                                onPressed: () {
                                                  context.push(AppRoutes.login);
                                                },
                                              ),
                                            ),
                                          );
                                        },
                                ),
                              ],
                            ),
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
          ...categories.map((category) {
            return ChoiceChip(
              label: Text(category),
              selected: _selectedCategory == category,
              onSelected: (selected) {
                setState(() {
                  _selectedCategory = selected ? category : null;
                });
              },
            );
          }),
        ],
      ),
    );
  }
}
