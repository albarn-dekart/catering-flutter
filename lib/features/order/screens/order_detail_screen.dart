import 'package:catering_flutter/core/api_client.dart';
import 'package:catering_flutter/core/utils/status_extensions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/graphql/schema.graphql.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart';
import 'package:catering_flutter/core/utils/iri_helper.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';
import 'package:catering_flutter/features/order/services/order_service.dart';
import 'package:catering_flutter/features/order/services/payment_service.dart';

class OrderDetailScreen extends StatefulWidget {
  final String orderIri;
  final dynamic initialOrderData; // Can be either CreatedOrder or OrderDetails

  const OrderDetailScreen({
    super.key,
    required this.orderIri,
    this.initialOrderData,
  });

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  dynamic _order; // Can be either type
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // If we have initial order data, use it directly
    if (widget.initialOrderData != null) {
      _order = widget.initialOrderData;
      _isLoading = false;
    } else {
      // Otherwise, fetch from API after first frame
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _fetchOrderDetails();
      });
    }
  }

  Future<void> _fetchOrderDetails() async {
    setState(() {
      _isLoading = true;
    });

    final orderService = context.read<OrderService>();
    await orderService.getOrderById(widget.orderIri);

    if (!mounted) return;

    if (orderService.hasError) {
      UIErrorHandler.showSnackBar(
        context,
        orderService.errorMessage!,
        isError: true,
      );
      setState(() {
        _isLoading = false;
      });
    } else {
      setState(() {
        _order = orderService.currentOrder;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Order Details',
      child: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _order == null
          ? const Center(child: Text('Order not found'))
          : _buildOrderDetails(),
    );
  }

  Widget _buildOrderDetails() {
    // Explicitly cast _order here for safer access, though not required for the fix.
    final order = _order!;
    // Helper variable for safe access to the status enum
    final Enum$OrderStatus orderStatus = order.status as Enum$OrderStatus;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Order Header Card
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(
                color: Theme.of(context).colorScheme.outlineVariant,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.receipt_long,
                          color: Theme.of(context).colorScheme.primary,
                          size: 28,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Order #${IriHelper.getId(order.id)}',
                              style: Theme.of(context).textTheme.headlineSmall
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              order.restaurant?.name ?? 'Unknown Restaurant',
                              style: Theme.of(context).textTheme.bodyLarge
                                  ?.copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSurfaceVariant,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Divider(),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Status',
                            style: Theme.of(context).textTheme.labelSmall
                                ?.copyWith(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurfaceVariant,
                                ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              // FIX: Explicitly cast to use the extension method
                              color: orderStatus.containerColor(context),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              // FIX: Use the cast variable
                              orderStatus.label,
                              style: Theme.of(context).textTheme.labelLarge
                                  ?.copyWith(
                                    // FIX: Use the cast variable
                                    color: orderStatus.onContainerColor(
                                      context,
                                    ),
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Total',
                            style: Theme.of(context).textTheme.labelSmall
                                ?.copyWith(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurfaceVariant,
                                ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${(order.total / 100.0).toStringAsFixed(2)} PLN',
                            style: Theme.of(context).textTheme.headlineSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // FIX: Use the cast variable for conditional rendering
                  if (orderStatus == Enum$OrderStatus.Unpaid) ...[
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Divider(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Consumer2<OrderService, PaymentService>(
                        builder:
                            (context, orderService, paymentService, child) {
                              if (paymentService.checkoutSessionCreated) {
                                WidgetsBinding.instance.addPostFrameCallback((
                                  _,
                                ) {
                                  paymentService.redirectToStripeCheckout(
                                    apiKey: ApiClient.stripePubKey,
                                    sessionId:
                                        paymentService.checkoutSessionId!,
                                  );
                                  paymentService.clearCheckoutSessionStatus();
                                });
                              } else if (paymentService.hasError) {
                                WidgetsBinding.instance.addPostFrameCallback((
                                  _,
                                ) {
                                  UIErrorHandler.showSnackBar(
                                    context,
                                    paymentService.errorMessage!,
                                  );
                                  paymentService.clearCheckoutSessionStatus();
                                });
                              }

                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  SizedBox(
                                    height: 48,
                                    child: FilledButton.icon(
                                      onPressed: paymentService.isLoading
                                          ? null
                                          : () {
                                              paymentService
                                                  .createCheckoutSession(
                                                    orderIri: order.id,
                                                  );
                                            },
                                      icon: paymentService.isLoading
                                          ? const SizedBox(
                                              height: 20,
                                              width: 20,
                                              child: CircularProgressIndicator(
                                                color: Colors.white,
                                                strokeWidth: 2,
                                              ),
                                            )
                                          : const Icon(Icons.payment),
                                      label: const Text('Pay Now'),
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  SizedBox(
                                    height: 48,
                                    child: OutlinedButton.icon(
                                      onPressed: orderService.isLoading
                                          ? null
                                          : () {
                                              _confirmCancelOrder(
                                                context,
                                                order.id,
                                              );
                                            },
                                      icon: orderService.isLoading
                                          ? SizedBox(
                                              height: 20,
                                              width: 20,
                                              child: CircularProgressIndicator(
                                                color: Theme.of(
                                                  context,
                                                ).colorScheme.error,
                                                strokeWidth: 2,
                                              ),
                                            )
                                          : const Icon(Icons.cancel),
                                      label: const Text('Cancel Order'),
                                      style: OutlinedButton.styleFrom(
                                        foregroundColor: Theme.of(
                                          context,
                                        ).colorScheme.error,
                                        side: BorderSide(
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.error,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Order Items Card
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(
                color: Theme.of(context).colorScheme.outlineVariant,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.shopping_basket,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Order Items',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ...?order.orderItems?.edges?.map((edge) {
                    final item = edge?.node;
                    if (item == null) return const SizedBox.shrink();
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Theme.of(
                                context,
                              ).colorScheme.surfaceContainerHighest,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.fastfood,
                              size: 20,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.mealPlan.name,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                Text(
                                  'Quantity: ${item.quantity}',
                                  style: Theme.of(context).textTheme.bodySmall
                                      ?.copyWith(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.onSurfaceVariant,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            '${((item.mealPlan.price ?? 0) / 100.0 * item.quantity).toStringAsFixed(2)} PLN',
                            style: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Delivery Address Card
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(
                color: Theme.of(context).colorScheme.outlineVariant,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Delivery Address',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '${order.deliveryFirstName} ${order.deliveryLastName}',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(order.deliveryStreet ?? ''),
                  if (order.deliveryApartment != null &&
                      order.deliveryApartment!.isNotEmpty)
                    Text('Apt: ${order.deliveryApartment}'),
                  Text('${order.deliveryCity}, ${order.deliveryZipCode}'),
                  Text(order.deliveryPhoneNumber ?? ''),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Delivery Schedule Card
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(
                color: Theme.of(context).colorScheme.outlineVariant,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.local_shipping,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Delivery Schedule',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  if (order.deliveries?.edges?.isEmpty ?? true)
                    Text(
                      'No deliveries scheduled',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    )
                  else ...[
                    Text(
                      'All Deliveries (${order.deliveries?.edges?.length ?? 0})',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ...?order.deliveries?.edges?.map((edge) {
                      final delivery = edge?.node;
                      if (delivery == null) return const SizedBox.shrink();
                      final deliveryDate = DateTime.parse(
                        delivery.deliveryDate,
                      );

                      final Enum$DeliveryStatus deliveryStatus =
                          delivery.status as Enum$DeliveryStatus;

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            // OPTIMIZED: Use Enum for status check
                            color: deliveryStatus.containerColor(context),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: deliveryStatus.containerColor(context),
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                deliveryStatus.icon,
                                color: deliveryStatus.onContainerColor(context),
                                size: 20,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      DateFormat(
                                        'EEE, dd MMM yyyy',
                                      ).format(deliveryDate),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    if (delivery.driver != null)
                                      Text(
                                        'Driver: ${delivery.driver!.email}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                              color: Theme.of(
                                                context,
                                              ).colorScheme.onSurfaceVariant,
                                            ),
                                      ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: deliveryStatus.containerColor(context),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  deliveryStatus.label,
                                  style: Theme.of(context).textTheme.labelSmall
                                      ?.copyWith(
                                        color: deliveryStatus.onContainerColor(
                                          context,
                                        ),
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ],
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Action Buttons for Unpaid Orders
        ],
      ),
    );
  }

  void _confirmCancelOrder(BuildContext context, String orderId) {
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
                try {
                  await orderService.updateOrderStatus(
                    orderId,
                    Enum$OrderStatus.Cancelled,
                  );
                  if (!context.mounted) return;

                  UIErrorHandler.showSnackBar(
                    context,
                    'Order cancelled successfully.',
                    isError: false,
                  );
                  // Navigate back after successful cancellation
                  Navigator.of(context).pop();
                } catch (e) {
                  if (!context.mounted) return;
                  UIErrorHandler.handleError(context, e);
                }
              },
            ),
          ],
        );
      },
    );
  }
}
