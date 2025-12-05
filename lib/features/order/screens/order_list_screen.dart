import 'package:catering_flutter/core/api_client.dart';
import 'package:flutter/material.dart';
import 'package:catering_flutter/graphql/schema.graphql.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:catering_flutter/core/app_routes.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';
import 'package:catering_flutter/core/utils/iri_helper.dart';
import 'package:catering_flutter/features/order/services/order_service.dart';
import 'package:catering_flutter/features/order/services/payment_service.dart';
import 'package:catering_flutter/core/utils/status_extensions.dart';
import 'package:catering_flutter/core/services/export_service.dart';
import 'package:catering_flutter/core/auth_service.dart';

class OrderListScreen extends StatefulWidget {
  const OrderListScreen({super.key});

  @override
  State<OrderListScreen> createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {
  Enum$OrderStatus? _selectedStatusFilter;
  bool _isExporting = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final authService = context.read<AuthService>();
      final userIri = authService.userIri;
      if (userIri != null) {
        await context.read<OrderService>().getMyOrders(userIri);
      }
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
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      final service = context.read<OrderService>();
      if (!service.isLoading &&
          !service.isFetchingMore &&
          service.hasNextPage) {
        service.loadMoreOrders();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Orders',
      floatingActionButton: FloatingActionButton(
        onPressed: _isExporting ? null : _exportOrders,
        tooltip: 'Export to CSV',
        child: _isExporting
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
            : const Icon(Icons.download),
      ),
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
                      apiKey: ApiClient.stripePubKey,
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

                  return ListView.separated(
                    controller: _scrollController,
                    padding: const EdgeInsets.all(16),
                    itemCount:
                        filteredOrders.length +
                        (orderService.isFetchingMore ? 1 : 0),
                    separatorBuilder: (_, a) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      if (index >= filteredOrders.length) {
                        return const Center(
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                      final order = filteredOrders[index];

                      return Card(
                        elevation: 2,
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
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

  Future<void> _exportOrders() async {
    setState(() {
      _isExporting = true;
    });

    try {
      final exportService = context.read<ExportService>();

      await exportService.exportOrdersToCsv(
        statusFilter: _selectedStatusFilter,
      );

      if (!mounted) return;

      UIErrorHandler.showSnackBar(
        context,
        'Orders exported successfully',
        isError: false,
      );
    } catch (e) {
      if (!mounted) return;
      UIErrorHandler.showSnackBar(
        context,
        'Failed to export orders: ${e.toString()}',
        isError: true,
      );
    } finally {
      if (mounted) {
        setState(() {
          _isExporting = false;
        });
      }
    }
  }
}
