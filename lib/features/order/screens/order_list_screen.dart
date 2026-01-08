import 'package:catering_flutter/core/services/api_service.dart';
import 'package:catering_flutter/core/widgets/app_card.dart';
import 'package:flutter/material.dart';
import 'package:catering_flutter/graphql/schema.graphql.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:catering_flutter/core/app_router.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';
import 'package:catering_flutter/core/utils/iri_helper.dart';
import 'package:catering_flutter/features/order/services/order_service.dart';
import 'package:catering_flutter/features/order/services/payment_service.dart';
import 'package:catering_flutter/core/utils/status_extensions.dart';
import 'package:catering_flutter/core/services/export_service.dart';
import 'package:catering_flutter/core/services/auth_service.dart';
import 'package:catering_flutter/l10n/app_localizations.dart';
import 'package:catering_flutter/core/widgets/searchable_list_screen.dart';
import 'package:catering_flutter/core/widgets/filter_chips_bar.dart';
import 'package:catering_flutter/core/widgets/price_text.dart';
import 'package:catering_flutter/core/widgets/app_export_button.dart';
import 'package:catering_flutter/core/widgets/icon_badge.dart';
import 'package:catering_flutter/core/widgets/easy_date_picker.dart';
import 'package:catering_flutter/core/utils/date_formatter.dart';

class OrderListScreen extends StatefulWidget {
  final String? restaurantIri;

  const OrderListScreen({super.key, this.restaurantIri});

  @override
  State<OrderListScreen> createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {
  Enum$OrderStatus? _selectedStatusFilter;
  bool _isExporting = false;
  DateTimeRange? _selectedDateRange;

  @override
  void initState() {
    super.initState();
    if (widget.restaurantIri != null) {
      final now = DateTime.now();
      _selectedDateRange = DateTimeRange(
        start: DateTime(now.year, now.month, now.day),
        end: DateTime(now.year, now.month, now.day),
      );
    }
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _fetchOrders();
    });
  }

  @override
  void dispose() {
    context.read<OrderService>().clearError();
    super.dispose();
  }

  Future<void> _fetchOrders({String? searchQuery}) async {
    final authService = context.read<AuthService>();
    final orderService = context.read<OrderService>();

    if (widget.restaurantIri != null) {
      await orderService.fetchRestaurantOrders(
        widget.restaurantIri!,
        status: _selectedStatusFilter,
        searchQuery: searchQuery,
        dateRange: _selectedDateRange,
      );
    } else {
      final userIri = authService.userIri;
      if (userIri != null) {
        await orderService.getMyOrders(userIri, status: _selectedStatusFilter);
      }
    }
  }

  bool get _showProgressSummary {
    if (_selectedDateRange == null) return false;
    return _selectedDateRange!.start.year == _selectedDateRange!.end.year &&
        _selectedDateRange!.start.month == _selectedDateRange!.end.month &&
        _selectedDateRange!.start.day == _selectedDateRange!.end.day;
  }

  Widget _buildProgressSummary(List<Order> filteredItems) {
    // Basic count summary
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        "${AppLocalizations.of(context)!.summary} ${filteredItems.length}",
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isRestaurantView = widget.restaurantIri != null;

    return Consumer2<OrderService, PaymentService>(
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
            UIErrorHandler.showSnackBar(context, paymentService.errorMessage!);
            paymentService.clearCheckoutSessionStatus();
          });
        }

        // Server-side filtering: use orders directly
        final displayedOrders = orderService.orders;

        return SearchableListScreen<Order>(
          title: isRestaurantView
              ? AppLocalizations.of(context)!.manageOrders
              : AppLocalizations.of(context)!.orders,
          items: displayedOrders,
          isLoading: orderService.isLoading,
          isLoadingMore: orderService.isFetchingMore,
          hasError: orderService.hasError,
          errorMessage: orderService.errorMessage,
          onRetry: _fetchOrders,
          onRefresh: _fetchOrders,
          onLoadMore: () => orderService.loadMoreOrders(),
          onSearch: (query) {
            _fetchOrders(searchQuery: query);
          },
          searchHint: AppLocalizations.of(context)!.searchByOrderNumber,
          headerAction: isRestaurantView
              ? AppExportButton(
                  onPressed: _exportOrders,
                  isLoading: _isExporting,
                )
              : null,
          header: isRestaurantView
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (_showProgressSummary)
                      _buildProgressSummary(displayedOrders),
                    EasyDatePicker(
                      selectedDateRange: _selectedDateRange,
                      onDateRangeChanged: (range) {
                        setState(() {
                          _selectedDateRange = range;
                        });
                        _fetchOrders(); // Server-side filtering
                      },
                      isLoading: orderService.isLoading,
                    ),
                  ],
                )
              : null,
          customFilters: FilterChipsBar<Enum$OrderStatus>(
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
          itemBuilder: (context, order) {
            final theme = Theme.of(context);
            return AppCard(
              child: InkWell(
                onTap: () {
                  context.push(
                    Uri(
                      path: AppRoutes.orderDetail,
                      queryParameters: {'id': IriHelper.getId(order.id)},
                    ).toString(),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primaryContainer,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.receipt_long,
                          color: theme.colorScheme.primary,
                          size: 24,
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
                              isRestaurantView
                                  ? (order.customer?.email ?? 'Unknown')
                                  : (order.restaurant?.name ??
                                        AppLocalizations.of(
                                          context,
                                        )!.unknownRestaurant),
                              style: theme.textTheme.bodyLarge?.copyWith(
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.calendar_today,
                                  size: 14,
                                  color: theme.colorScheme.onSurfaceVariant,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  AppDateFormatter.fullDate(
                                    context,
                                    DateTime.parse(order.createdAt),
                                  ),
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: theme.colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: order.status.containerColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              order.status.getLabel(context),
                              style: theme.textTheme.labelMedium?.copyWith(
                                color: order.status.onContainerColor,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          PriceText(
                            priceGroszy: order.total,
                            style: PriceText.standardStyle(context),
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
      },
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
