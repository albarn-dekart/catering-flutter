import 'package:catering_flutter/core/services/api_service.dart';
import 'package:catering_flutter/core/utils/status_extensions.dart';
import 'package:flutter/material.dart';
import 'package:catering_flutter/core/utils/date_formatter.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/graphql/schema.graphql.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart';
import 'package:catering_flutter/core/utils/iri_helper.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';
import 'package:catering_flutter/features/order/services/order_service.dart';
import 'package:catering_flutter/features/order/services/payment_service.dart';
import 'package:catering_flutter/l10n/app_localizations.dart';
import 'package:catering_flutter/core/widgets/price_text.dart';
import 'package:catering_flutter/core/widgets/macro_badge.dart';
import 'package:catering_flutter/core/services/auth_service.dart';

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
      title: AppLocalizations.of(context)!.orderDetails,
      child: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _order == null
          ? Center(child: Text(AppLocalizations.of(context)!.orderNotFound))
          : _buildOrderDetails(),
    );
  }

  Widget _buildOrderDetails() {
    // Explicitly cast _order here for safer access, though not required for the fix.
    final order = _order!;
    // Helper variable for safe access to the status enum
    final Enum$OrderStatus orderStatus = order.status as Enum$OrderStatus;

    final deliveryDays = order.deliveries?.edges?.length ?? 0;
    final effectiveDeliveryDays = deliveryDays > 0 ? deliveryDays : 1;

    // Calculate subtotal from items
    int itemsSubtotal = 0;
    if (order.orderItems?.edges != null) {
      for (var edge in order.orderItems!.edges!) {
        final item = edge?.node;
        if (item != null) {
          final num price = item.mealPlan.price ?? 0;
          itemsSubtotal += (price * item.quantity * effectiveDeliveryDays)
              .toInt();
        }
      }
    }

    final deliveryFee = order.total - itemsSubtotal;

    return RefreshIndicator(
      onRefresh: _fetchOrderDetails,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
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
                  children: [
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final isNarrow = constraints.maxWidth < 700;

                        final statusChip = Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: orderStatus.containerColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            orderStatus.getLabel(context),
                            style: Theme.of(context).textTheme.labelLarge
                                ?.copyWith(
                                  color: orderStatus.onContainerColor,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        );

                        final headerContent = Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Theme.of(
                                  context,
                                ).colorScheme.primaryContainer,
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
                                    AppLocalizations.of(
                                      context,
                                    )!.orderNumber(IriHelper.getId(order.id)),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    order.restaurant?.name,
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
                            if (!isNarrow) ...[
                              const SizedBox(width: 8),
                              statusChip,
                            ],
                          ],
                        );

                        if (isNarrow) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              headerContent,
                              const SizedBox(height: 12),
                              statusChip,
                            ],
                          );
                        }

                        return headerContent;
                      },
                    ),
                    Consumer<AuthService>(
                      builder: (context, authService, _) {
                        final isRestaurant =
                            authService.hasRole('ROLE_RESTAURANT') ||
                            authService.hasRole('ROLE_ADMIN');

                        if (isRestaurant) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 16.0),
                                child: Divider(),
                              ),
                              Text(
                                AppLocalizations.of(context)!.changeStatus,
                                style: Theme.of(context).textTheme.titleSmall
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 8),
                              DropdownButtonFormField<Enum$OrderStatus>(
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 8,
                                  ),
                                  isDense: true,
                                ),
                                initialValue: orderStatus,
                                items: Enum$OrderStatus.values
                                    .where(
                                      (status) =>
                                          status != Enum$OrderStatus.$unknown,
                                    )
                                    .map((status) {
                                      return DropdownMenuItem(
                                        value: status,
                                        child: Text(status.getLabel(context)),
                                      );
                                    })
                                    .toList(),
                                onChanged: (newStatus) async {
                                  if (newStatus != null &&
                                      newStatus != orderStatus) {
                                    final confirmed = await showDialog<bool>(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: Text(
                                          AppLocalizations.of(
                                            context,
                                          )!.confirmStatusChange,
                                        ),
                                        content: Text(
                                          AppLocalizations.of(
                                            context,
                                          )!.statusChangeConfirmation(
                                            IriHelper.getId(order.id),
                                            orderStatus.getLabel(context),
                                            newStatus.getLabel(context),
                                          ),
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.of(
                                              context,
                                            ).pop(false),
                                            child: Text(
                                              AppLocalizations.of(
                                                context,
                                              )!.cancel,
                                            ),
                                          ),
                                          FilledButton(
                                            onPressed: () =>
                                                Navigator.of(context).pop(true),
                                            child: Text(
                                              AppLocalizations.of(
                                                context,
                                              )!.confirm,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );

                                    if (confirmed == true && context.mounted) {
                                      final orderService = context
                                          .read<OrderService>();
                                      try {
                                        await orderService.updateOrderStatus(
                                          order.id,
                                          newStatus,
                                        );
                                        if (!context.mounted) return;
                                        UIErrorHandler.showSnackBar(
                                          context,
                                          AppLocalizations.of(
                                            context,
                                          )!.orderStatusUpdated,
                                          isError: false,
                                        );
                                        _fetchOrderDetails();
                                      } catch (e) {
                                        if (!context.mounted) return;
                                        UIErrorHandler.handleError(context, e);
                                      }
                                    }
                                  }
                                },
                              ),
                            ],
                          );
                        } else if (orderStatus == Enum$OrderStatus.Unpaid) {
                          return Consumer2<OrderService, PaymentService>(
                            builder: (context, orderService, paymentService, child) {
                              if (paymentService.checkoutSessionCreated) {
                                WidgetsBinding.instance.addPostFrameCallback((
                                  _,
                                ) {
                                  paymentService.redirectToStripeCheckout(
                                    apiKey: ApiService.stripePubKey,
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
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 8.0,
                                    ),
                                    child: Divider(),
                                  ),
                                  LayoutBuilder(
                                    builder: (context, constraints) {
                                      final isNarrow =
                                          constraints.maxWidth < 700;

                                      final cancelButton = OutlinedButton.icon(
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
                                                height: 16,
                                                width: 16,
                                                child:
                                                    CircularProgressIndicator(
                                                      color: Theme.of(
                                                        context,
                                                      ).colorScheme.error,
                                                      strokeWidth: 2,
                                                    ),
                                              )
                                            : const Icon(
                                                Icons.cancel,
                                                size: 18,
                                              ),
                                        label: Text(
                                          AppLocalizations.of(
                                            context,
                                          )!.cancelOrder,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        style: OutlinedButton.styleFrom(
                                          foregroundColor: Theme.of(
                                            context,
                                          ).colorScheme.error,
                                          side: BorderSide(
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.error,
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 12,
                                          ),
                                        ),
                                      );

                                      final payButton = FilledButton.icon(
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
                                                height: 16,
                                                width: 16,
                                                child:
                                                    CircularProgressIndicator(
                                                      color: Colors.white,
                                                      strokeWidth: 2,
                                                    ),
                                              )
                                            : const Icon(
                                                Icons.payment,
                                                size: 18,
                                              ),
                                        label: Text(
                                          AppLocalizations.of(context)!.payNow,
                                        ),
                                        style: FilledButton.styleFrom(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 12,
                                          ),
                                        ),
                                      );

                                      if (isNarrow) {
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            payButton,
                                            const SizedBox(height: 12),
                                            cancelButton,
                                          ],
                                        );
                                      }

                                      return Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: cancelButton,
                                          ),
                                          const SizedBox(width: 12),
                                          Expanded(flex: 2, child: payButton),
                                        ],
                                      );
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        }

                        return const SizedBox.shrink();
                      },
                    ),
                  ],
                ),
              ),
            ),

            // Order Items & Summary Card
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
                          AppLocalizations.of(context)!.orderItems,
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
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyLarge,
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Text(
                                        AppLocalizations.of(
                                          context,
                                        )!.piecesCount(item.quantity),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                              color: Theme.of(
                                                context,
                                              ).colorScheme.onSurfaceVariant,
                                            ),
                                      ),
                                      if (effectiveDeliveryDays > 1) ...[
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 4,
                                          ),
                                          child: Text(
                                            '×',
                                            style: TextStyle(
                                              color: Theme.of(
                                                context,
                                              ).colorScheme.outline,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          AppLocalizations.of(
                                            context,
                                          )!.daysCount(effectiveDeliveryDays),
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
                                    ],
                                  ),
                                  const SizedBox(height: 2),
                                  Row(
                                    children: [
                                      PriceText(
                                        priceGroszy: (item.mealPlan.price ?? 0)
                                            .toInt(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                              color: Theme.of(
                                                context,
                                              ).colorScheme.onSurfaceVariant,
                                            ),
                                      ),
                                      Text(
                                        AppLocalizations.of(context)!.perDay,
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
                                  const SizedBox(height: 8),
                                  Wrap(
                                    spacing: 4,
                                    runSpacing: 4,
                                    children: [
                                      if (item.mealPlan.calories != null)
                                        MacroBadge(
                                          text:
                                              '${AppLocalizations.of(context)!.calories}: ${item.mealPlan.calories!.toStringAsFixed(0)}',
                                          icon: Icons
                                              .local_fire_department_outlined,
                                        ),
                                      if (item.mealPlan.protein != null)
                                        MacroBadge(
                                          text:
                                              '${AppLocalizations.of(context)!.protein}: ${item.mealPlan.protein!.toStringAsFixed(1)}g',
                                          icon: Icons.fitness_center_outlined,
                                        ),
                                      if (item.mealPlan.fat != null)
                                        MacroBadge(
                                          text:
                                              '${AppLocalizations.of(context)!.fat}: ${item.mealPlan.fat!.toStringAsFixed(1)}g',
                                          icon: Icons.water_drop_outlined,
                                        ),
                                      if (item.mealPlan.carbs != null)
                                        MacroBadge(
                                          text:
                                              '${AppLocalizations.of(context)!.carbs}: ${item.mealPlan.carbs!.toStringAsFixed(1)}g',
                                          icon: Icons.grain_outlined,
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            PriceText(
                              priceGroszy:
                                  ((item.mealPlan.price ?? 0) *
                                          item.quantity *
                                          effectiveDeliveryDays)
                                      .toInt(),
                              style: Theme.of(context).textTheme.bodyLarge
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      );
                    }),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Divider(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.price,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        PriceText(
                          priceGroszy: itemsSubtotal,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.deliveryFee,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        PriceText(
                          priceGroszy: deliveryFee,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    if (deliveryFee == 0 && order.total > itemsSubtotal)
                      // Fallback check if simple math was off or backend quirk, usually unnecessary but safe
                      const SizedBox.shrink(),

                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.total,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        PriceText(
                          priceGroszy: order.total,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                      ],
                    ),
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
                          AppLocalizations.of(context)!.deliveryAddress,
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
                      Text(
                        '${AppLocalizations.of(context)!.apt}: ${order.deliveryApartment}',
                      ),
                    Text('${order.deliveryCity}, ${order.deliveryZipCode}'),
                    Text(order.deliveryPhoneNumber),
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
                          AppLocalizations.of(context)!.deliverySchedule,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    if (order.deliveries?.edges?.isEmpty ?? true)
                      Text(
                        AppLocalizations.of(context)!.noDeliveriesScheduled,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      )
                    else ...[
                      Text(
                        AppLocalizations.of(
                          context,
                        )!.allDeliveries(order.deliveries?.edges?.length),
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
                              color: deliveryStatus.containerColor,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: deliveryStatus.containerColor,
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  deliveryStatus.icon,
                                  color: deliveryStatus.onContainerColor,
                                  size: 20,
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        AppDateFormatter.weekdayShortDate(
                                          context,
                                          deliveryDate,
                                        ),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      if (delivery.driver != null)
                                        Text(
                                          AppLocalizations.of(
                                            context,
                                          )!.driverWithName(
                                            delivery.driver!.email,
                                          ),
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
                                    color: deliveryStatus.containerColor,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    deliveryStatus.getLabel(context),
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall
                                        ?.copyWith(
                                          color:
                                              deliveryStatus.onContainerColor,
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
          ], // Column children
        ), // Column
      ), // SingleChildScrollView
    ); // RefreshIndicator
  }

  void _confirmCancelOrder(BuildContext context, String orderIri) {
    // Capture the OrderService reference before showing the dialog
    // to avoid issues with context becoming stale after rebuilds
    final orderService = context.read<OrderService>();

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context)!.confirm),
          content: Text(
            AppLocalizations.of(context)!.areYouSureYouWantToCancelThisOrder,
          ),
          actions: <Widget>[
            TextButton(
              child: Text(AppLocalizations.of(context)!.no),
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              onPressed: () async {
                Navigator.of(dialogContext).pop(); // Close the dialog
                try {
                  await orderService.updateOrderStatus(
                    orderIri,
                    Enum$OrderStatus.Cancelled,
                  );
                  // Use the State's mounted check and context instead of the
                  // captured context which may be stale after notifyListeners()
                  if (!mounted) return;

                  UIErrorHandler.showSnackBar(
                    this.context,
                    AppLocalizations.of(this.context)!.orderCreatedSuccessfully,
                    isError: false,
                  );
                  // Navigate back after successful cancellation
                  Navigator.of(this.context).pop();
                } catch (e) {
                  if (!mounted) return;
                  UIErrorHandler.handleError(this.context, e);
                }
              },
              child: Text(AppLocalizations.of(context)!.yes),
            ),
          ],
        );
      },
    );
  }
}
