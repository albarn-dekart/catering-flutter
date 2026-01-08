import 'package:catering_flutter/core/widgets/global_error_widget.dart';
import 'package:catering_flutter/core/services/api_service.dart';
import 'package:catering_flutter/core/utils/status_extensions.dart';
import 'package:catering_flutter/core/widgets/icon_badge.dart';
import 'package:flutter/material.dart';
import 'package:catering_flutter/core/utils/date_formatter.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/graphql/schema.graphql.dart';
import 'package:catering_flutter/graphql/orders.graphql.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart';
import 'package:catering_flutter/core/utils/iri_helper.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';
import 'package:catering_flutter/features/order/services/order_service.dart';
import 'package:catering_flutter/features/order/services/payment_service.dart';
import 'package:catering_flutter/core/widgets/app_premium_button.dart';
import 'package:catering_flutter/l10n/app_localizations.dart';
import 'package:catering_flutter/core/widgets/price_text.dart';
import 'package:catering_flutter/core/widgets/nutrient_row.dart';
import 'package:catering_flutter/core/services/auth_service.dart';
import 'package:catering_flutter/core/widgets/app_card.dart';
import 'package:catering_flutter/features/customer/widgets/address_card.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:go_router/go_router.dart';

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
  final Map<String, bool> _itemExpansionState = {};
  final ScrollController _scrollController = ScrollController();

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

  @override
  void dispose() {
    _scrollController.dispose();
    // Clear any errors when leaving the screen
    context.read<OrderService>().clearError();
    super.dispose();
  }

  Future<void> _fetchOrderDetails() async {
    setState(() {
      _isLoading = true;
    });

    final orderService = context.read<OrderService>();
    await orderService.getOrderById(widget.orderIri);

    if (!mounted) return;

    setState(() {
      _order = orderService.currentOrder;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final orderService = context.watch<OrderService>();

    return CustomScaffold(
      title: AppLocalizations.of(context)!.orderDetails,
      child: _isLoading && _order == null
          ? const Center(child: CircularProgressIndicator())
          : LayoutBuilder(
              builder: (context, constraints) {
                return RefreshIndicator(
                  onRefresh: _fetchOrderDetails,
                  notificationPredicate: (notification) =>
                      notification.depth == 0,
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: orderService.hasError && _order == null
                          ? Center(
                              child: GlobalErrorWidget(
                                message: orderService.errorMessage,
                                onRetry: _fetchOrderDetails,
                                onCancel: () {
                                  orderService.clearError();
                                  context.pop();
                                },
                                withScaffold: false,
                              ),
                            )
                          : _order == null
                          ? Center(
                              child: Text(
                                AppLocalizations.of(context)!.orderNotFound,
                              ),
                            )
                          : _buildOrderDetailsContent(),
                    ),
                  ),
                );
              },
            ),
    );
  }

  Widget _buildOrderDetailsContent() {
    final authService = context.read<AuthService>();
    final isRestaurant =
        authService.hasRole('ROLE_RESTAURANT') ||
        authService.hasRole('ROLE_ADMIN');

    // Explicitly cast _order here for safer access
    final order = _order as Fragment$OrderDetails;
    // Helper variable for safe access to the status enum
    final Enum$OrderStatus orderStatus = order.status;

    final deliveryDays = order.deliveries?.edges?.length ?? 0;
    final effectiveDeliveryDays = deliveryDays > 0 ? deliveryDays : 1;

    // Calculate subtotal from items
    int itemsSubtotal = 0;
    if (order.orderItems?.edges != null) {
      for (var edge in order.orderItems!.edges!) {
        final item = edge?.node;
        if (item != null) {
          // Use snapshotted price
          final num price = item.mealPlanPrice ?? 0;
          itemsSubtotal += (price * item.quantity * effectiveDeliveryDays)
              .toInt();
        }
      }
    }

    // Use snapshotted delivery fee (per day)
    final int perDayDeliveryFee = (order as dynamic).deliveryFee ?? 0;
    final int totalDeliveryFee = (perDayDeliveryFee * effectiveDeliveryDays)
        .toInt();

    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Order Header Card
        AppCard(
          padding: const EdgeInsets.all(16),
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
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: orderStatus.onContainerColor,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  );

                  final headerContent = Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.receipt_long,
                          color: theme.colorScheme.primary,
                          size: 28,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.order,
                                  style: theme.textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                IconBadge(
                                  text: IriHelper.getId(order.id),
                                  icon: Icons.tag,
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              order.restaurant?.name ?? '',
                              style: theme.textTheme.bodyLarge?.copyWith(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurfaceVariant,
                              ),
                            ),
                            if (!isRestaurant &&
                                (order.restaurant?.phoneNumber != null ||
                                    order.restaurant?.email != null)) ...[
                              const SizedBox(height: 8),
                              Wrap(
                                spacing: 12,
                                runSpacing: 8,
                                children: [
                                  if (order.restaurant?.phoneNumber != null)
                                    InkWell(
                                      onTap: () async {
                                        final Uri launchUri = Uri(
                                          scheme: 'tel',
                                          path: order.restaurant!.phoneNumber!,
                                        );
                                        if (await canLaunchUrl(launchUri)) {
                                          await launchUrl(launchUri);
                                        }
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.phone,
                                            size: 14,
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.primary,
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            order.restaurant!.phoneNumber!,
                                            style: theme.textTheme.bodySmall
                                                ?.copyWith(
                                                  color: Theme.of(
                                                    context,
                                                  ).colorScheme.primary,
                                                  decoration:
                                                      TextDecoration.underline,
                                                  decorationColor: Theme.of(
                                                    context,
                                                  ).colorScheme.primary,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  if (order.restaurant?.email != null)
                                    InkWell(
                                      onTap: () async {
                                        final Uri launchUri = Uri(
                                          scheme: 'mailto',
                                          path: order.restaurant!.email!,
                                        );
                                        if (await canLaunchUrl(launchUri)) {
                                          await launchUrl(launchUri);
                                        }
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.email,
                                            size: 14,
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.primary,
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            order.restaurant!.email!,
                                            style: theme.textTheme.bodySmall
                                                ?.copyWith(
                                                  color: Theme.of(
                                                    context,
                                                  ).colorScheme.primary,
                                                  decoration:
                                                      TextDecoration.underline,
                                                  decorationColor: Theme.of(
                                                    context,
                                                  ).colorScheme.primary,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                            ],
                            // Show Created At
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(
                                  Icons.calendar_today,
                                  size: 14,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurfaceVariant,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  AppDateFormatter.fullDate(
                                    context,
                                    DateTime.parse(order.createdAt),
                                  ),
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      if (!isNarrow) ...[const SizedBox(width: 8), statusChip],
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
              // Pay/Cancel buttons for unpaid orders (customer only)
              if (!isRestaurant &&
                  (_order!.status as Enum$OrderStatus) ==
                      Enum$OrderStatus.Unpaid)
                Consumer2<OrderService, PaymentService>(
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

                    return Column(
                      children: [
                        const SizedBox(height: 16),
                        LayoutBuilder(
                          builder: (context, constraints) {
                            final isNarrow = constraints.maxWidth < 700;

                            final cancelButton = OutlinedButton.icon(
                              onPressed: orderService.isLoading
                                  ? null
                                  : () {
                                      _confirmCancelOrder(context, _order!.id);
                                    },
                              icon: orderService.isLoading
                                  ? SizedBox(
                                      height: 16,
                                      width: 16,
                                      child: CircularProgressIndicator(
                                        color: theme.colorScheme.error,
                                        strokeWidth: 2,
                                      ),
                                    )
                                  : const Icon(Icons.cancel, size: 18),
                              label: Text(
                                AppLocalizations.of(context)!.cancelOrder,
                                overflow: TextOverflow.ellipsis,
                              ),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Theme.of(
                                  context,
                                ).colorScheme.error,
                                side: BorderSide(
                                  color: theme.colorScheme.error,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                              ),
                            );

                            final payButton = AppPremiumButton(
                              onPressed: paymentService.isLoading
                                  ? null
                                  : () {
                                      paymentService.createCheckoutSession(
                                        orderIri: _order!.id,
                                      );
                                    },
                              isLoading: paymentService.isLoading,
                              icon: Icons.payment,
                              label: AppLocalizations.of(context)!.payNow,
                            );

                            if (isNarrow) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  payButton,
                                  const SizedBox(height: 12),
                                  cancelButton,
                                ],
                              );
                            }

                            return Row(
                              children: [
                                Expanded(flex: 1, child: cancelButton),
                                const SizedBox(width: 12),
                                Expanded(flex: 2, child: payButton),
                              ],
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        if (isRestaurant) ...[
          AppCard(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.edit_notifications,
                      color: theme.colorScheme.primary,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      AppLocalizations.of(context)!.changeStatus,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<Enum$OrderStatus>(
                  decoration: InputDecoration(
                    isDense: true,
                    filled: true,
                    fillColor: Theme.of(
                      context,
                    ).colorScheme.surfaceContainerLow,
                  ),
                  initialValue: _order!.status as Enum$OrderStatus,
                  items: Enum$OrderStatus.values
                      .where((status) => status != Enum$OrderStatus.$unknown)
                      .map<DropdownMenuItem<Enum$OrderStatus>>((status) {
                        return DropdownMenuItem(
                          value: status,
                          child: Text(status.getLabel(context)),
                        );
                      })
                      .toList(),
                  onChanged: (newStatus) async {
                    if (newStatus != null &&
                        newStatus != (_order!.status as Enum$OrderStatus)) {
                      final confirmed = await showDialog<bool>(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(
                            AppLocalizations.of(context)!.confirmStatusChange,
                          ),
                          content: Text(
                            AppLocalizations.of(
                              context,
                            )!.statusChangeConfirmation(
                              IriHelper.getId(_order!.id),
                              (_order!.status as Enum$OrderStatus).getLabel(
                                context,
                              ),
                              newStatus.getLabel(context),
                            ),
                          ),
                          actions: [
                            TextButton.icon(
                              onPressed: () => Navigator.of(context).pop(false),
                              icon: const Icon(Icons.close),
                              label: Text(AppLocalizations.of(context)!.cancel),
                            ),
                            AppPremiumButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              icon: Icons.check,
                              label: AppLocalizations.of(context)!.confirm,
                            ),
                          ],
                        ),
                      );

                      if (confirmed != true || !mounted) return;

                      final orderService = context.read<OrderService>();
                      try {
                        await orderService.updateOrderStatus(
                          _order!.id,
                          newStatus,
                        );
                        if (!mounted) return;
                        UIErrorHandler.showSnackBar(
                          context,
                          AppLocalizations.of(context)!.orderStatusUpdated,
                          isError: false,
                        );
                        _fetchOrderDetails();
                      } catch (e) {
                        if (!mounted) return;
                        UIErrorHandler.handleError(context, e);
                      }
                    }
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],

        // Order Items & Summary Card
        AppCard(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.shopping_basket, color: theme.colorScheme.primary),
                  const SizedBox(width: 8),
                  Text(
                    AppLocalizations.of(context)!.orderItems,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ...?order.orderItems?.edges?.map<Widget>((edge) {
                final item = edge?.node;
                if (item == null) return const SizedBox.shrink();
                final isExpanded = _itemExpansionState[item.id] ?? false;
                final mealPlan = item.mealPlan;
                final includedMeals = mealPlan?.meals?.edges ?? [];

                // Use snapshotted data
                final itemName =
                    item.mealPlanName ??
                    AppLocalizations.of(context)!.deletedMealPlan;
                final itemPrice = item.mealPlanPrice ?? 0;
                final itemCalories = item.mealPlanCalories;
                final itemProtein = item.mealPlanProtein;
                final itemFat = item.mealPlanFat;
                final itemCarbs = item.mealPlanCarbs;

                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
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
                              ).colorScheme.surfaceContainerHighest,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.fastfood,
                              size: 20,
                              color: theme.colorScheme.primary,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  itemName,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    PriceText(
                                      priceGroszy: itemPrice.toInt(),
                                      style: theme.textTheme.bodySmall
                                          ?.copyWith(
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.onSurfaceVariant,
                                          ),
                                    ),
                                    Text(
                                      AppLocalizations.of(context)!.perDay,
                                      style: theme.textTheme.bodySmall
                                          ?.copyWith(
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.onSurfaceVariant,
                                          ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                NutrientRow(
                                  calories: itemCalories,
                                  protein: itemProtein,
                                  fat: itemFat,
                                  carbs: itemCarbs,
                                  compact: true,
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    AppLocalizations.of(
                                      context,
                                    )!.piecesCount(item.quantity),
                                    style: theme.textTheme.bodySmall?.copyWith(
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
                                        style: theme.textTheme.bodySmall
                                            ?.copyWith(
                                              color: theme
                                                  .colorScheme
                                                  .onSurfaceVariant,
                                            ),
                                      ),
                                    ),
                                    Text(
                                      AppLocalizations.of(
                                        context,
                                      )!.daysCount(effectiveDeliveryDays),
                                      style: theme.textTheme.bodySmall
                                          ?.copyWith(
                                            color: theme
                                                .colorScheme
                                                .onSurfaceVariant,
                                          ),
                                    ),
                                  ],
                                ],
                              ),
                              PriceText(
                                priceGroszy:
                                    (itemPrice *
                                            item.quantity *
                                            effectiveDeliveryDays)
                                        .toInt(),
                                style: theme.textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      if (includedMeals.isNotEmpty) ...[
                        Padding(
                          padding: const EdgeInsets.only(top: 8, left: 4),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _itemExpansionState[item.id] = !isExpanded;
                              });
                            },
                            borderRadius: BorderRadius.circular(8),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 6,
                                horizontal: 8,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    isExpanded
                                        ? Icons.expand_less
                                        : Icons.expand_more,
                                    size: 18,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    isExpanded
                                        ? AppLocalizations.of(
                                            context,
                                          )!.hideIncludedMeals
                                        : AppLocalizations.of(
                                            context,
                                          )!.showIncludedMeals(
                                            includedMeals.length,
                                          ),
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.primary,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        AnimatedSize(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          child: isExpanded
                              ? Padding(
                                  padding: const EdgeInsets.only(
                                    left: 20.0,
                                    top: 8,
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                          color: theme
                                              .colorScheme
                                              .outlineVariant
                                              .withValues(alpha: 0.5),
                                          width: 1.5,
                                        ),
                                      ),
                                    ),
                                    padding: const EdgeInsets.only(left: 16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: includedMeals.map<Widget>((
                                        mealEdge,
                                      ) {
                                        final meal = mealEdge?.node;
                                        if (meal == null) {
                                          return const SizedBox.shrink();
                                        }
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 4,
                                          ),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  top: 6,
                                                ),
                                                child: Icon(
                                                  Icons.circle,
                                                  size: 6,
                                                  color: theme
                                                      .colorScheme
                                                      .primary
                                                      .withValues(alpha: 0.7),
                                                ),
                                              ),
                                              const SizedBox(width: 12),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            meal.name,
                                                            style: theme
                                                                .textTheme
                                                                .bodyMedium
                                                                ?.copyWith(
                                                                  height: 1.3,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                        ),
                                                        if (meal.price > 0)
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets.only(
                                                                  left: 8.0,
                                                                ),
                                                            child: PriceText(
                                                              priceGroszy:
                                                                  meal.price,
                                                              style: theme
                                                                  .textTheme
                                                                  .bodyMedium
                                                                  ?.copyWith(
                                                                    color: Theme.of(
                                                                      context,
                                                                    ).colorScheme.primary,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                    const SizedBox(height: 4),
                                                    NutrientRow(
                                                      calories: meal.calories,
                                                      protein: meal.protein,
                                                      fat: meal.fat,
                                                      carbs: meal.carbs,
                                                      compact: true,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                )
                              : const SizedBox.shrink(),
                        ),
                      ],
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
                    style: theme.textTheme.bodyMedium,
                  ),
                  PriceText(
                    priceGroszy: itemsSubtotal,
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.deliveryFee,
                    style: theme.textTheme.bodyMedium,
                  ),
                  PriceText(
                    priceGroszy: totalDeliveryFee,
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
              ),
              const SizedBox(height: 8),

              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.total,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  PriceText(
                    priceGroszy: order.total,
                    style: PriceText.standardStyle(context),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // Delivery Address Section
        AddressCard(
          title: AppLocalizations.of(context)!.deliveryAddress,
          firstName: order.deliveryFirstName ?? '',
          lastName: order.deliveryLastName ?? '',
          street: order.deliveryStreet ?? '',
          apartment: order.deliveryApartment,
          city: order.deliveryCity ?? '',
          zipCode: order.deliveryZipCode ?? '',
          phoneNumber: order.deliveryPhoneNumber ?? '',
          email: isRestaurant ? order.customer?.email : null,
          showActions: false,
          showDefaultBadge: false,
          enablePhoneAction: isRestaurant,
        ),
        const SizedBox(height: 16),

        // Delivery Schedule Card
        AppCard(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.local_shipping, color: theme.colorScheme.primary),
                  const SizedBox(width: 8),
                  Text(
                    AppLocalizations.of(context)!.deliverySchedule,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              if (order.deliveries?.edges?.isEmpty ?? true)
                Text(
                  AppLocalizations.of(context)!.noDeliveriesScheduled,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                )
              else ...[
                Text(
                  AppLocalizations.of(
                    context,
                  )!.allDeliveries(order.deliveries?.edges?.length ?? 0),
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 12),
                ...?order.deliveries?.edges?.map<Widget>((edge) {
                  final delivery = edge?.node;
                  if (delivery == null) return const SizedBox.shrink();
                  final deliveryDate = DateTime.parse(delivery.deliveryDate);

                  final Enum$DeliveryStatus deliveryStatus = delivery.status;

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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppDateFormatter.weekdayShortDate(
                                    context,
                                    deliveryDate,
                                  ),
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                if (delivery.courier != null)
                                  Text(
                                    AppLocalizations.of(
                                      context,
                                    )!.courierWithName(delivery.courier!.email),
                                    style: theme.textTheme.bodySmall?.copyWith(
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
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: deliveryStatus.onContainerColor,
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
        // Action Buttons for Unpaid Orders
      ],
    );
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
            TextButton.icon(
              icon: const Icon(Icons.close),
              label: Text(AppLocalizations.of(context)!.no),
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
            TextButton.icon(
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.error,
              ),
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
                    AppLocalizations.of(
                      this.context,
                    )!.orderCancelledSuccessfully,
                    isError: false,
                  );
                  // Navigate back after successful cancellation
                  Navigator.of(this.context).pop();
                } catch (e) {
                  if (!mounted) return;
                  UIErrorHandler.handleError(this.context, e);
                }
              },
              icon: const Icon(Icons.check),
              label: Text(AppLocalizations.of(context)!.yes),
            ),
          ],
        );
      },
    );
  }
}
