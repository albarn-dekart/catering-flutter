import 'package:catering_flutter/core/api_config.dart';
import 'package:flutter/material.dart';
import 'package:catering_flutter/graphql/schema.graphql.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:catering_flutter/core/app_routes.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';
import 'package:catering_flutter/core/utils/iri_helper.dart';
import 'package:catering_flutter/core/widgets/responsive_grid.dart';
import 'package:catering_flutter/features/order/services/order_service.dart';
import 'package:catering_flutter/features/order/services/payment_service.dart';
import 'package:catering_flutter/core/utils/status_extensions.dart';

class OrderListScreen extends StatefulWidget {
  const OrderListScreen({super.key});

  @override
  State<OrderListScreen> createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {
  Enum$OrderStatus? _selectedStatusFilter;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await context.read<OrderService>().getMyOrders();
      if (!mounted) return;
      final service = context.read<OrderService>();
      if (service.hasError) {
        UIErrorHandler.showSnackBar(
          context,
          service.errorMessage!,
          isError: true,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Orders',
      child: Column(
        children: [
          // Status filter chips
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildFilterChip(null, 'All'),
                  ...Enum$OrderStatus.values
                      .where((status) => status != Enum$OrderStatus.$unknown)
                      .map((status) {
                        return _buildFilterChip(status, status.label);
                      }),
                ],
              ),
            ),
          ),
          Expanded(
            child: Consumer2<OrderService, PaymentService>(
              builder: (context, orderService, paymentService, child) {
                if (paymentService.checkoutSessionCreated) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    paymentService.redirectToStripeCheckout(
                      apiKey: ApiConfig.stripePubKey,
                      sessionId: paymentService.checkoutSessionId!,
                    );
                    paymentService.clearCheckoutSessionStatus();
                  });
                } else if (paymentService.hasError) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    UIErrorHandler.showSnackBar(
                      context,
                      paymentService.errorMessage!,
                    );
                    paymentService.clearCheckoutSessionStatus();
                  });
                }

                if (orderService.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (orderService.orders.isEmpty) {
                  return const Center(child: Text('You have no orders.'));
                } else {
                  final allOrders = orderService.orders;
                  // Apply status filter locally
                  final filteredOrders = _selectedStatusFilter == null
                      ? allOrders
                      : allOrders
                            .where(
                              (order) => order.status == _selectedStatusFilter,
                            )
                            .toList();

                  if (filteredOrders.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.filter_alt_off,
                            size: 64,
                            color: Theme.of(
                              context,
                            ).colorScheme.onSurface.withValues(alpha: 77),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            _selectedStatusFilter != null
                                ? 'No orders with status "${_selectedStatusFilter!.label}"'
                                : 'You have no orders.',
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(
                                  color: Theme.of(context).colorScheme.onSurface
                                      .withValues(alpha: 153),
                                ),
                          ),
                          if (_selectedStatusFilter != null) ...[
                            const SizedBox(height: 8),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  _selectedStatusFilter = null;
                                });
                              },
                              child: const Text('Clear filter'),
                            ),
                          ],
                        ],
                      ),
                    );
                  }

                  return ResponsiveGridBuilder(
                    itemCount: filteredOrders.length,
                    childAspectRatio: 1.6,
                    itemBuilder: (context, index) {
                      final order = filteredOrders[index];

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
                                path: AppRoutes.orderDetail,
                                queryParameters: {
                                  'id': IriHelper.getId(order.id),
                                },
                              ).toString(),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.primaryContainer,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.receipt_long,
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.primary,
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Order #${IriHelper.getId(order.id)}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium
                                                ?.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            order.restaurant?.name ??
                                                'Unknown Restaurant',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onSurfaceVariant,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Icon(
                                      Icons.chevron_right,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onSurfaceVariant,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 6,
                                      ),
                                      decoration: BoxDecoration(
                                        color: order.status.containerColor(
                                          context,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        order.status.label,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium
                                            ?.copyWith(
                                              color: order.status
                                                  .onContainerColor(context),
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                    Text(
                                      '${(order.total / 100.0).toStringAsFixed(2)} PLN',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.primary,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(Enum$OrderStatus? status, String label) {
    final isSelected = _selectedStatusFilter == status;
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (selected) {
          setState(() {
            _selectedStatusFilter = status;
          });
        },
        backgroundColor: Theme.of(context).colorScheme.surface,
        selectedColor: Theme.of(context).colorScheme.primaryContainer,
        checkmarkColor: Theme.of(context).colorScheme.onPrimaryContainer,
        labelStyle: TextStyle(
          color: isSelected
              ? Theme.of(context).colorScheme.onPrimaryContainer
              : Theme.of(context).colorScheme.onSurface,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
