import 'package:catering_flutter/core/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:catering_flutter/graphql/schema.graphql.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:catering_flutter/core/app_router.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';
import 'package:catering_flutter/core/utils/iri_helper.dart';
import 'package:catering_flutter/features/order/services/order_service.dart';
import 'package:catering_flutter/features/order/services/payment_service.dart';
import 'package:catering_flutter/core/utils/status_extensions.dart';
import 'package:catering_flutter/core/services/export_service.dart';
import 'package:catering_flutter/core/services/auth_service.dart';
import 'package:catering_flutter/l10n/app_localizations.dart';
import 'package:catering_flutter/core/widgets/global_error_widget.dart';
import 'package:catering_flutter/core/widgets/searchable_list_screen.dart';
import 'package:catering_flutter/core/widgets/price_text.dart';

class OrderListScreen extends StatefulWidget {
  final String? restaurantIri;

  const OrderListScreen({super.key, this.restaurantIri});

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
      await _fetchOrders();
    });
  }

  Future<void> _fetchOrders() async {
    final authService = context.read<AuthService>();
    final orderService = context.read<OrderService>();

    if (widget.restaurantIri != null) {
      // Restaurant Owner View
      await orderService.fetchRestaurantOrders(
        widget.restaurantIri!,
        status: _selectedStatusFilter,
      );
    } else {
      // Customer View
      final userIri = authService.userIri;
      if (userIri != null) {
        await orderService.getMyOrders(userIri, status: _selectedStatusFilter);
      }
    }
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
    final isNarrow = MediaQuery.of(context).size.width < 700;
    final isRestaurantView = widget.restaurantIri != null;

    return CustomScaffold(
      title: isRestaurantView
          ? AppLocalizations.of(context)!.manageOrders
          : AppLocalizations.of(context)!.orders,
      floatingActionButton: isNarrow
          ? FloatingActionButton(
              onPressed: _isExporting ? null : _exportOrders,
              tooltip: AppLocalizations.of(context)!.exportToCsv,
              child: _isExporting
                  ? const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.download),
            )
          : FloatingActionButton.extended(
              onPressed: _isExporting ? null : _exportOrders,
              icon: _isExporting
                  ? const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.download),
              label: Text(AppLocalizations.of(context)!.exportToCsv),
            ),
      child: Column(
        children: [
          // Status filter chips
          FilterChipsBar<Enum$OrderStatus>(
            values: Enum$OrderStatus.values
                .where((status) => status != Enum$OrderStatus.$unknown)
                .toList(),
            selectedValue: _selectedStatusFilter,
            allLabel: AppLocalizations.of(context)!.all,
            labelBuilder: (status) => status.getLabel(context),
            onSelected: (status) {
              if (_selectedStatusFilter != status) {
                setState(() {
                  _selectedStatusFilter = status;
                });
                _fetchOrders();
              }
            },
          ),
          Expanded(
            child: Consumer2<OrderService, PaymentService>(
              builder: (context, orderService, paymentService, child) {
                if (paymentService.checkoutSessionCreated) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    paymentService.redirectToStripeCheckout(
                      apiKey: ApiService.stripePubKey,
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
                } else if (orderService.hasError) {
                  return GlobalErrorWidget(
                    message: orderService.errorMessage,
                    onRetry: _fetchOrders,
                    withScaffold: false,
                  );
                } else if (orderService.orders.isEmpty) {
                  return Center(
                    child: Text(AppLocalizations.of(context)!.noOrders),
                  );
                } else {
                  // Backend filtering is now used, so allOrders contains the filtered result
                  final filteredOrders = orderService.orders;

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
                                ? AppLocalizations.of(
                                    context,
                                  )!.noOrdersWithStatus(
                                    _selectedStatusFilter!.getLabel(context),
                                  )
                                : AppLocalizations.of(context)!.noOrders,
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
                                _fetchOrders();
                              },
                              child: Text(
                                AppLocalizations.of(context)!.clearFilter,
                              ),
                            ),
                          ],
                        ],
                      ),
                    );
                  }

                  return RefreshIndicator(
                    onRefresh: _fetchOrders,
                    child: ListView.separated(
                      physics: const AlwaysScrollableScrollPhysics(),
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
                                              AppLocalizations.of(
                                                context,
                                              )!.orderNumber(
                                                IriHelper.getId(order.id),
                                              ),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge
                                                  ?.copyWith(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              isRestaurantView
                                                  ? (order.customer?.email ??
                                                        'Unknown')
                                                  : (order.restaurant?.name ??
                                                        AppLocalizations.of(
                                                          context,
                                                        )!.unknownRestaurant),
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
                                          color: order.status.containerColor,
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        child: Text(
                                          order.status.getLabel(context),
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium
                                              ?.copyWith(
                                                color: order
                                                    .status
                                                    .onContainerColor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                      PriceText(
                                        priceGroszy: order.total,
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
                    ),
                  );
                }
              },
            ),
          ),
        ],
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
        restaurantIri: widget.restaurantIri,
      );

      if (!mounted) return;

      UIErrorHandler.showSnackBar(
        context,
        AppLocalizations.of(context)!.exportSuccess,
        isError: false,
      );
    } catch (e) {
      if (!mounted) return;
      UIErrorHandler.showSnackBar(
        context,
        AppLocalizations.of(context)!.exportFailed(e.toString()),
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
