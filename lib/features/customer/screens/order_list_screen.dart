import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import 'package:catering_flutter/core/config.dart';
import 'package:catering_flutter/features/customer/services/order_service.dart';
import 'package:catering_flutter/features/customer/services/payment_service.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart'; // Import CustomScaffold

class OrderListScreen extends StatefulWidget {
  const OrderListScreen({super.key});

  @override
  State<OrderListScreen> createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<OrderService>().getMyOrders();
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Orders',
      child: Consumer2<OrderService, PaymentService>(
        builder: (context, orderService, paymentService, child) {
          if (paymentService.checkoutSessionCreated) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              paymentService.redirectToStripeCheckout(
                apiKey: AppConfig.stripePublishableKey,
                sessionId: paymentService.checkoutSessionId!,
              );
              paymentService.clearCheckoutSessionStatus();
            });
          } else if (paymentService.hasError) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(paymentService.errorMessage!)),
              );
              paymentService.clearCheckoutSessionStatus();
            });
          }

          if (orderService.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (orderService.hasError) {
            return Center(child: Text(orderService.errorMessage!));
          } else if (orderService.orders.isEmpty) {
            return const Center(child: Text('You have no orders.'));
          } else {
            final orders = orderService.orders;
            return ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];

                DateTime? minDate;
                DateTime? maxDate;
                DateTime? nextDelivery;

                if (order.deliveries.isNotEmpty) {
                  final deliveryDates = order.deliveries
                      .map((d) => d.deliveryDate)
                      .toList();
                  if (deliveryDates.isNotEmpty) {
                    minDate = deliveryDates.reduce(
                      (a, b) => a.isBefore(b) ? a : b,
                    );
                    maxDate = deliveryDates.reduce(
                      (a, b) => a.isAfter(b) ? a : b,
                    );

                    deliveryDates.sort();
                    try {
                      nextDelivery = deliveryDates.firstWhere(
                        (d) => d.isAfter(DateTime.now()),
                      );
                    } catch (e) {
                      nextDelivery = null;
                    }
                  }
                }

                return ExpansionTile(
                  title: Text('Order #${order.id} - ${order.restaurant?.name ?? ''}'),
                  subtitle: Text('Status: ${order.status}'),
                  trailing: Text(
                    'Total: ${order.total.toStringAsFixed(2)} PLN',
                  ),
                  children: [
                    ListTile(
                      title: const Text('Meal Plans'),
                      subtitle: Text(
                        order.orderItems
                            .map((item) => item.mealPlan.name)
                            .join(', '),
                      ),
                    ),
                    ListTile(
                      title: const Text('Deliveries'),
                      subtitle: Text(
                        '''from ${minDate != null ? DateFormat('dd.MM.yyyy').format(minDate) : 'N/A'} to ${maxDate != null ? DateFormat('dd.MM.yyyy').format(maxDate) : 'N/A'} at days: ${order.deliveryDays.join(', ')}''',
                      ),
                    ),
                    ListTile(
                      title: const Text('Next Delivery'),
                      subtitle: Text(
                        nextDelivery != null
                            ? DateFormat('dd.MM.yyyy').format(nextDelivery)
                            : 'N/A',
                      ),
                    ),
                    if (order.status == 'Unpaid')
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: paymentService.isLoading
                                    ? null
                                    : () {
                                        paymentService.createCheckoutSession(
                                          orderId: order.id,
                                        );
                                      },
                                child: paymentService.isLoading
                                    ? const CircularProgressIndicator(
                                        color: Colors.white,
                                      )
                                    : const Text('Pay Now'),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: orderService.isLoading
                                    ? null
                                    : () {
                                        _confirmCancelOrder(context, order.id);
                                      },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                ),
                                child: orderService.isLoading
                                    ? const CircularProgressIndicator(
                                        color: Colors.white,
                                      )
                                    : const Text('Cancel Order'),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }

  void _confirmCancelOrder(BuildContext context, int orderId) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Confirm Cancellation'),
          content: const Text('Are you sure you want to cancel this order?'),
          actions: <Widget>[
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: () async {
                Navigator.of(dialogContext).pop(); // Close the dialog
                final orderService = context.read<OrderService>();
                await orderService.cancelOrder(orderId);
                if (!context.mounted) return;
                if (orderService.hasError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Failed to cancel order: ${orderService.errorMessage}',
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Order cancelled successfully.'),
                    ),
                  );
                  orderService.getMyOrders(); // Refresh the list
                }
              },
            ),
          ],
        );
      },
    );
  }
}
