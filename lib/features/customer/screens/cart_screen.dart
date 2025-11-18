import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:catering_flutter/core/app_routes.dart';
import 'package:catering_flutter/features/customer/services/cart_service.dart';
import 'package:catering_flutter/features/customer/services/order_service.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart'; // Import CustomScaffold

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Cart',
      child: Consumer2<CartService, OrderService>(
        builder: (context, cartService, orderService, child) {
          if (orderService.isOrderCreated) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              context.goNamed(
                AppRoutes.receipt,
                pathParameters: {
                  'orderId': orderService.createdOrder!.id.toString(),
                },
              );
              orderService.clearOrderCreatedStatus();
            });
          } else if (orderService.hasError) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(orderService.errorMessage!)),
              );
              orderService.clearOrderCreatedStatus();
            });
          }

          if (cartService.cartItems.isEmpty) {
            return const Center(child: Text('Your cart is empty.'));
          }
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartService.cartItems.length,
                  itemBuilder: (context, index) {
                    final cartItem = cartService.cartItems[index];
                    return ListTile(
                      leading: const Icon(Icons.fastfood),
                      title: Text(cartItem.mealPlan.name),
                      subtitle: Text(
                        '${(cartItem.mealPlan.price).toStringAsFixed(2)} PLN/day x ${cartItem.quantity} = ${((cartItem.mealPlan.price) * cartItem.quantity).toStringAsFixed(2)} PLN',
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove_circle_outline),
                            onPressed: () {
                              if (cartItem.quantity > 1) {
                                cartService.updateCartItemQuantity(
                                  cartItem,
                                  cartItem.quantity - 1,
                                );
                              } else {
                                cartService.removeItemFromCart(cartItem);
                              }
                            },
                          ),
                          Text('${cartItem.quantity}'),
                          IconButton(
                            icon: const Icon(Icons.add_circle_outline),
                            onPressed: () {
                              cartService.updateCartItemQuantity(
                                cartItem,
                                cartItem.quantity + 1,
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total:',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${cartService.totalPrice.toStringAsFixed(2)} PLN/day',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: cartService.cartItems.isEmpty
                            ? null
                            : () {
                                context.push(AppRoutes.deliveryDetails);
                              },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: const Text(
                          'Proceed to Delivery Details',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
