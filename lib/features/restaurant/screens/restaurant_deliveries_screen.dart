import 'package:catering_flutter/graphql/schema.graphql.dart';
import 'package:catering_flutter/core/widgets/app_premium_button.dart';
import 'package:catering_flutter/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/core/utils/iri_helper.dart';
import 'package:catering_flutter/features/courier/services/delivery_service.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';
import 'package:catering_flutter/features/user/services/user_service.dart';
import 'package:catering_flutter/core/utils/status_extensions.dart';
import 'package:catering_flutter/core/widgets/searchable_list_screen.dart';
import 'package:catering_flutter/core/widgets/filter_chips_bar.dart';
import 'package:catering_flutter/core/services/export_service.dart';
import 'package:catering_flutter/core/widgets/icon_badge.dart';
import 'package:catering_flutter/core/widgets/app_card.dart';
import 'package:catering_flutter/features/customer/widgets/address_card.dart';
import 'package:catering_flutter/core/widgets/easy_date_picker.dart';
import 'package:catering_flutter/core/widgets/app_export_button.dart';

class RestaurantDeliveriesScreen extends StatefulWidget {
  final String restaurantIri;

  const RestaurantDeliveriesScreen({super.key, required this.restaurantIri});

  @override
  State<RestaurantDeliveriesScreen> createState() =>
      _RestaurantDeliveriesScreenState();
}

class _RestaurantDeliveriesScreenState
    extends State<RestaurantDeliveriesScreen> {
  Enum$DeliveryStatus? _selectedStatusFilter;
  String _currentSearchQuery = '';
  bool _isExporting = false;
  final Set<String> _updatingIds = {};
  DateTimeRange? _selectedDateRange;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _selectedDateRange = DateTimeRange(
      start: DateTime(now.year, now.month, now.day),
      end: DateTime(now.year, now.month, now.day),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchDeliveriesAndCouriers();
    });
  }

  @override
  void dispose() {
    context.read<DeliveryService>().clearError();
    context.read<UserService>().clearError();
    super.dispose();
  }

  Future<void> _fetchDeliveriesAndCouriers() async {
    await Future.wait([
      _fetchDeliveries(),
      context.read<UserService>().fetchCouriersByRestaurant(
        widget.restaurantIri,
      ),
    ]);
  }

  Future<void> _fetchDeliveries() async {
    await context.read<DeliveryService>().fetchRestaurantDeliveries(
      widget.restaurantIri,
      status: _selectedStatusFilter,
      searchQuery: _currentSearchQuery,
      dateRange: _selectedDateRange,
    );
  }

  bool get _showProgressSummary {
    if (_selectedDateRange == null) return false;
    return _selectedDateRange!.start.year == _selectedDateRange!.end.year &&
        _selectedDateRange!.start.month == _selectedDateRange!.end.month &&
        _selectedDateRange!.start.day == _selectedDateRange!.end.day;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<DeliveryService, UserService>(
      builder: (context, deliveryService, userService, child) {
        return SearchableListScreen<Delivery>(
          title: AppLocalizations.of(context)!.manageDeliveries,
          headerAction: AppExportButton(
            onPressed: _exportDeliveries,
            isLoading: _isExporting,
          ),
          items: _getSortedItems(deliveryService.deliveries),
          isLoading: deliveryService.isLoading || userService.isLoading,
          isLoadingMore: deliveryService.isFetchingMore,
          onLoadMore: () async {
            if (!deliveryService.isFetchingMore &&
                deliveryService.hasNextPage) {
              await deliveryService.loadMoreDeliveries(
                restaurantIri: widget.restaurantIri,
              );
            }
          },
          searchHint: AppLocalizations.of(context)!.searchByOrderNumber,

          onSearch: (query) {
            _currentSearchQuery = query;
            _fetchDeliveries();
          },
          hasError: deliveryService.hasError || userService.hasError,
          errorMessage:
              deliveryService.errorMessage ?? userService.errorMessage,
          onRetry: _fetchDeliveriesAndCouriers,
          onCancel: () {
            context.read<DeliveryService>().clearError();
            context.read<UserService>().clearError();
          },
          onRefresh: _fetchDeliveriesAndCouriers,
          header: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (deliveryService.deliveries.isNotEmpty)
                _buildProgressSummary(deliveryService.deliveries),
              EasyDatePicker(
                selectedDateRange: _selectedDateRange,
                onDateRangeChanged: (range) {
                  setState(() {
                    _selectedDateRange = range;
                  });
                  _fetchDeliveries();
                },
                isLoading: deliveryService.isLoading,
              ),
            ],
          ),
          customFilters: FilterChipsBar<Enum$DeliveryStatus>(
            values: Enum$DeliveryStatus.values
                .where((status) => status != Enum$DeliveryStatus.$unknown)
                .toList(),
            selectedValue: _selectedStatusFilter,
            allLabel: AppLocalizations.of(context)!.all,
            labelBuilder: (status) => status.getLabel(context),
            onSelected: (status) {
              setState(() {
                _selectedStatusFilter = status;
              });
              _fetchDeliveries();
            },
          ),
          itemBuilder: (context, delivery) {
            final couriers = userService.restaurantCouriers;
            return _buildDeliveryCard(context, delivery, couriers);
          },
        );
      },
    );
  }

  bool _isCourierAssignmentDisabled(Delivery delivery) {
    return delivery.order?.status == Enum$OrderStatus.Unpaid ||
        delivery.status == Enum$DeliveryStatus.Delivered ||
        delivery.status == Enum$DeliveryStatus.Failed ||
        delivery.status == Enum$DeliveryStatus.Returned ||
        _updatingIds.contains(delivery.id);
  }

  String _getCourierLabel(BuildContext context, Delivery delivery) {
    if (delivery.order?.status == Enum$OrderStatus.Unpaid) {
      return '${AppLocalizations.of(context)!.assignCourier} (${AppLocalizations.of(context)!.statusUnpaid})';
    }
    if (delivery.status == Enum$DeliveryStatus.Delivered) {
      return '${AppLocalizations.of(context)!.assignCourier} (${AppLocalizations.of(context)!.statusDelivered})';
    }
    if (delivery.status == Enum$DeliveryStatus.Failed) {
      return '${AppLocalizations.of(context)!.assignCourier} (${AppLocalizations.of(context)!.statusFailed})';
    }
    if (delivery.status == Enum$DeliveryStatus.Returned) {
      return '${AppLocalizations.of(context)!.assignCourier} (${AppLocalizations.of(context)!.statusReturned})';
    }
    return AppLocalizations.of(context)!.assignCourier;
  }

  Widget _buildDeliveryCard(
    BuildContext context,
    Delivery delivery,
    List<RestaurantCourierNode> couriers,
  ) {
    final theme = Theme.of(context);
    final isDone =
        delivery.status == Enum$DeliveryStatus.Delivered ||
        delivery.status == Enum$DeliveryStatus.Returned;

    return Opacity(
      opacity: isDone ? 0.6 : 1.0,
      child: AppCard(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    if (isDone)
                      const Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 20,
                      ),
                    if (isDone) const SizedBox(width: 8),
                    Text(
                      AppLocalizations.of(context)!.delivery,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                        decoration: isDone ? TextDecoration.lineThrough : null,
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconBadge(
                      text: IriHelper.getId(delivery.id),
                      icon: Icons.tag,
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: delivery.status.containerColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    delivery.status.getLabel(context),
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: delivery.status.onContainerColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Icon(
                  Icons.receipt_long,
                  size: 16,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(width: 12),
                Text(
                  '${AppLocalizations.of(context)!.order}:',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(width: 4),
                IconBadge(
                  text: IriHelper.getId(delivery.order!.id),
                  icon: Icons.tag,
                ),
              ],
            ),
            if (delivery.order != null) ...[
              const SizedBox(height: 16),
              AddressCard(
                firstName: delivery.order!.deliveryFirstName ?? '',
                lastName: delivery.order!.deliveryLastName ?? '',
                street: delivery.order!.deliveryStreet ?? '',
                apartment: delivery.order!.deliveryApartment,
                city: delivery.order!.deliveryCity ?? '',
                zipCode: delivery.order!.deliveryZipCode ?? '',
                phoneNumber: delivery.order!.deliveryPhoneNumber ?? '',
                deliveryDate: DateTime.parse(delivery.deliveryDate),
                withCardDecoration: false,
                showActions: false,
                showDefaultBadge: false,
                enablePhoneAction: true,
              ),
            ],
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.person, size: 16, color: theme.colorScheme.primary),
                const SizedBox(width: 12),
                Text(
                  '${AppLocalizations.of(context)!.courier}:',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  delivery.courier?.email ??
                      AppLocalizations.of(context)!.unassigned,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: delivery.courier == null
                        ? theme.colorScheme.error
                        : null,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            if (couriers.isNotEmpty)
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: _getCourierLabel(context, delivery),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  suffixIcon: _updatingIds.contains(delivery.id)
                      ? const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        )
                      : null,
                ),
                initialValue: delivery.courier?.id,
                onChanged: _isCourierAssignmentDisabled(delivery)
                    ? null
                    : (String? newCourierId) async {
                        if (newCourierId != null) {
                          await _assignCourier(delivery, newCourierId);
                        }
                      },
                items: couriers.map((courier) {
                  return DropdownMenuItem<String>(
                    value: courier.id,
                    child: Text(courier.email),
                  );
                }).toList(),
              ),
            if (delivery.status == Enum$DeliveryStatus.Assigned ||
                delivery.status == Enum$DeliveryStatus.Picked_up)
              const SizedBox(height: 16),
            // Status progression buttons
            if (delivery.status == Enum$DeliveryStatus.Assigned)
              SizedBox(
                width: double.infinity,
                height: 52,
                child: AppPremiumButton(
                  onPressed: _updatingIds.contains(delivery.id)
                      ? null
                      : () => _updateStatus(
                          delivery.id,
                          Enum$DeliveryStatus.Picked_up,
                        ),
                  isLoading: _updatingIds.contains(delivery.id),
                  icon: Icons.shopping_bag_outlined,
                  label: AppLocalizations.of(context)!.markAsPickedUp,
                ),
              ),
            if (delivery.status == Enum$DeliveryStatus.Picked_up)
              SizedBox(
                width: double.infinity,
                height: 52,
                child: AppPremiumButton(
                  onPressed: _updatingIds.contains(delivery.id)
                      ? null
                      : () => _updateStatus(
                          delivery.id,
                          Enum$DeliveryStatus.Delivered,
                        ),
                  isLoading: _updatingIds.contains(delivery.id),
                  icon: Icons.check_circle_outline,
                  label: AppLocalizations.of(context)!.markAsDeliveredAction,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _assignCourier(Delivery delivery, String courierId) async {
    setState(() {
      _updatingIds.add(delivery.id);
    });
    final deliveryService = context.read<DeliveryService>();
    try {
      await deliveryService.updateDeliveryStatus(
        delivery.id,
        courierIri: courierId,
      );
      if (!mounted) return;

      UIErrorHandler.showSnackBar(
        context,
        AppLocalizations.of(context)!.courierAssignedSuccess,
        isError: false,
      );
    } catch (e) {
      if (!mounted) return;
      UIErrorHandler.showSnackBar(
        context,
        AppLocalizations.of(context)!.courierAssignFailed,
        isError: true,
        action: SnackBarAction(
          label: AppLocalizations.of(context)!.retry,
          onPressed: () => _assignCourier(delivery, courierId),
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _updatingIds.remove(delivery.id);
        });
      }
    }
  }

  Future<void> _updateStatus(
    String deliveryId,
    Enum$DeliveryStatus newStatus,
  ) async {
    setState(() {
      _updatingIds.add(deliveryId);
    });
    final deliveryService = context.read<DeliveryService>();
    try {
      await deliveryService.updateDeliveryStatus(deliveryId, status: newStatus);

      if (!mounted) return;

      UIErrorHandler.showSnackBar(
        context,
        AppLocalizations.of(context)!.deliveryStatusUpdated,
        isError: false,
      );
    } catch (e) {
      if (!mounted) return;
      UIErrorHandler.handleError(
        context,
        e,
        customMessage: AppLocalizations.of(context)!.failedToUpdateStatus,
      );
    } finally {
      if (mounted) {
        setState(() {
          _updatingIds.remove(deliveryId);
        });
      }
    }
  }

  Future<void> _exportDeliveries() async {
    setState(() {
      _isExporting = true;
    });

    try {
      final exportService = context.read<ExportService>();

      await exportService.exportDeliveriesToCsv(
        statusFilter: _selectedStatusFilter,
        startDate: _selectedDateRange?.start,
        endDate: _selectedDateRange?.end,
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

  List<Delivery> _getSortedItems(List<Delivery> items) {
    final sortedList = List<Delivery>.from(items);
    sortedList.sort((a, b) {
      final isDoneA =
          a.status == Enum$DeliveryStatus.Delivered ||
          a.status == Enum$DeliveryStatus.Returned;
      final isDoneB =
          b.status == Enum$DeliveryStatus.Delivered ||
          b.status == Enum$DeliveryStatus.Returned;

      // 1. Group by "Done" status (Active first)
      if (isDoneA != isDoneB) {
        return isDoneA ? 1 : -1;
      }

      // 2. Secondary sort based on Date Mode
      // If we are looking at a single day, we want chronological order (Morning -> Evening)
      // Since we don't have a specific "time" field easily accessible besides ID/date,
      // and ID is roughly chronological for creation:
      if (_showProgressSummary) {
        // Single Day -> Chronological (Oldest/Morning first)
        return a.id.compareTo(b.id);
      } else {
        // Range/History -> Append Newest First
        return b.id.compareTo(a.id);
      }
    });

    return sortedList;
  }

  Widget _buildProgressSummary(List<Delivery> items) {
    final total = items.length;
    final completed = items.where((i) {
      return i.status == Enum$DeliveryStatus.Delivered ||
          i.status == Enum$DeliveryStatus.Returned;
    }).length;

    final progress = total > 0 ? completed / total : 0.0;
    final theme = Theme.of(context);

    // Use specific "Daily Progress" if looking at one day, or generic "Progress" for ranges
    final label = _showProgressSummary
        ? AppLocalizations.of(context)!.dailyProgress(completed, total)
        : '${AppLocalizations.of(context)!.summary}: $completed/$total';

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: theme.textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
              ),
            ),
            Text(
              '${(progress * 100).toInt()}%',
              style: theme.textTheme.labelMedium,
            ),
          ],
        ),
        const SizedBox(height: 4),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 6,
            backgroundColor: theme.colorScheme.primary.withValues(alpha: 0.1),
            valueColor: AlwaysStoppedAnimation<Color>(
              theme.colorScheme.primary,
            ),
          ),
        ),
        const SizedBox(height: 4),
      ],
    );
  }
}
