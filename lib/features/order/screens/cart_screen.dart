import 'package:catering_flutter/core/widgets/app_card.dart';
import 'package:catering_flutter/core/widgets/app_premium_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:catering_flutter/core/app_router.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart';
import 'package:catering_flutter/features/order/services/cart_service.dart';
import 'package:catering_flutter/core/widgets/custom_cached_image.dart';
import 'package:catering_flutter/l10n/app_localizations.dart';
import 'package:catering_flutter/core/widgets/price_text.dart';
import 'package:catering_flutter/core/widgets/nutrient_row.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: AppLocalizations.of(context)!.cart,
      child: Consumer<CartService>(
        builder: (context, cartService, child) {
          if (cartService.cartItems.isEmpty) {
            return Center(child: Text(AppLocalizations.of(context)!.cartEmpty));
          }
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: cartService.cartItems.length,
                  itemBuilder: (context, index) {
                    final cartItem = cartService.cartItems[index];
                    return AppCard(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          // Image
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Theme.of(
                                context,
                              ).colorScheme.surfaceContainerHighest,
                            ),
                            clipBehavior: Clip.antiAlias,
                            child:
                                cartItem.mealPlan.imageUrl != null &&
                                    cartItem.mealPlan.imageUrl!.isNotEmpty
                                ? CustomCachedImage(
                                    imageUrl: cartItem.mealPlan.imageUrl,
                                    fit: BoxFit.cover,
                                  )
                                : Icon(
                                    Icons.fastfood,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSurfaceVariant,
                                  ),
                          ),
                          const SizedBox(width: 16),
                          // Details
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cartItem.mealPlan.name,
                                  style: Theme.of(context).textTheme.titleLarge
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  cartItem.mealPlan.description ??
                                      AppLocalizations.of(
                                        context,
                                      )!.noDescription,
                                  style: Theme.of(context).textTheme.bodyMedium
                                      ?.copyWith(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.onSurfaceVariant,
                                      ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 8),
                                NutrientRow(
                                  calories: cartItem.mealPlan.calories,
                                  protein: cartItem.mealPlan.protein,
                                  fat: cartItem.mealPlan.fat,
                                  carbs: cartItem.mealPlan.carbs,
                                  compact: true,
                                ),
                                const SizedBox(height: 8),
                                SizedBox(
                                  width: double.infinity,
                                  child: Wrap(
                                    alignment: WrapAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    spacing: 8,
                                    runSpacing: 8,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.outlineVariant,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            IconButton(
                                              icon: const Icon(
                                                Icons.remove,
                                                size: 16,
                                              ),
                                              onPressed: () {
                                                if (cartItem.quantity > 1) {
                                                  cartService.updateQuantity(
                                                    cartItem.mealPlan.id,
                                                    cartItem.quantity - 1,
                                                  );
                                                } else {
                                                  cartService.removeFromCart(
                                                    cartItem.mealPlan.id,
                                                  );
                                                }
                                              },
                                              constraints: const BoxConstraints(
                                                minWidth: 32,
                                                minHeight: 32,
                                              ),
                                              padding: EdgeInsets.zero,
                                            ),
                                            Text(
                                              '${cartItem.quantity}',
                                              style: Theme.of(
                                                context,
                                              ).textTheme.titleSmall,
                                            ),
                                            IconButton(
                                              icon: const Icon(
                                                Icons.add,
                                                size: 16,
                                              ),
                                              onPressed: () {
                                                cartService.updateQuantity(
                                                  cartItem.mealPlan.id,
                                                  cartItem.quantity + 1,
                                                );
                                              },
                                              constraints: const BoxConstraints(
                                                minWidth: 32,
                                                minHeight: 32,
                                              ),
                                              padding: EdgeInsets.zero,
                                            ),
                                          ],
                                        ),
                                      ),
                                      PriceText.fromDouble(
                                        priceGroszy:
                                            (cartItem.mealPlan.price! *
                                                    cartItem.quantity)
                                                .toDouble(),
                                        suffix: AppLocalizations.of(
                                          context,
                                        )!.perDay,
                                        style: PriceText.standardStyle(context),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              AppCard(
                padding: const EdgeInsets.all(16),
                child: SafeArea(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Delivery Fee Row
                      if (cartService.deliveryPrice > 0) ...[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.deliveryFee,
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSurfaceVariant,
                                  ),
                            ),
                            PriceText.fromDouble(
                              priceGroszy: cartService.deliveryPrice.toDouble(),
                              suffix: AppLocalizations.of(context)!.perDay,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                      ],
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.total,
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          PriceText.fromDouble(
                            priceGroszy: cartService.totalPricePLN,
                            suffix: AppLocalizations.of(context)!.perDay,
                            style: PriceText.standardStyle(context),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: AppPremiumButton(
                          onPressed: cartService.cartItems.isEmpty
                              ? null
                              : () {
                                  context.push(AppRoutes.orderConfirm);
                                },
                          icon: Icons.shopping_cart_checkout,
                          label: AppLocalizations.of(
                            context,
                          )!.proceedToCheckout,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
