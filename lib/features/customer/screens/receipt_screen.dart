import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import 'package:catering_flutter/core/app_routes.dart';
import 'package:catering_flutter/features/customer/services/order_service.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart'; // Import CustomScaffold

class ReceiptScreen extends StatefulWidget {
  final int orderId;

  const ReceiptScreen({super.key, required this.orderId});

  @override
  State<ReceiptScreen> createState() => _ReceiptScreenState();
}

class _ReceiptScreenState extends State<ReceiptScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<OrderService>().getOrderDetails(widget.orderId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Receipt',
      child: Consumer<OrderService>(
        builder: (context, orderService, child) {
          if (orderService.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (orderService.hasError) {
            return Center(
              child: Text('Error loading order: ${orderService.errorMessage}'),
            );
          } else if (orderService.orderDetails != null) {
            final order = orderService.orderDetails!;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Icon(
                      Icons.check_circle_outline,
                      color: Colors.green,
                      size: 100,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Center(
                    child: Text(
                      'Payment Successful!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Center(
                    child: Text(
                      'Your order #${order.id} has been confirmed.',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 32),
                  _buildDetailRow(
                    'Restaurant:',
                    order.restaurant?.name ?? 'N/A',
                  ),
                  _buildDetailRow('Order Status:', order.status),
                  _buildDetailRow(
                    'Total Amount:',
                    order.total.toStringAsFixed(2),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Meal Plans:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  ...order.orderItems.map(
                    (orderItem) => Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 4.0),
                      child: Text(
                        '- ${orderItem.mealPlan.name} x ${orderItem.quantity} (${((orderItem.mealPlan.price) * orderItem.quantity).toStringAsFixed(2)}) ',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Delivery Details:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  _buildDetailRow(
                    'Start Date:',
                    order.deliveryStartDate != null
                        ? DateFormat(
                            'dd/MM/yyyy',
                          ).format(order.deliveryStartDate!)
                        : 'N/A',
                  ),
                  _buildDetailRow(
                    'End Date:',
                    order.deliveryEndDate != null
                        ? DateFormat(
                            'dd/MM/yyyy',
                          ).format(order.deliveryEndDate!)
                        : 'N/A',
                  ),
                  _buildDetailRow(
                    'Delivery Days:',
                    order.deliveryDays.join(', '),
                  ),
                  const SizedBox(height: 48),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        context.go(AppRoutes.home);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: const Text(
                        'Back to Dashboard',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: Text('No order details found.'));
          }
        },
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(value, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
