import 'package:catering_flutter/features/courier/widgets/undo_timer_button.dart';
import 'package:catering_flutter/graphql/schema.graphql.dart';
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
  Map<String, int>? _deliveryStats;

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

  Future<void> _fetchDeliveryStats() async {
    setState(() {
      _deliveryStats = null;
    });

    try {
      final stats = await context.read<DeliveryService>().getDeliveryStats(
        restaurantIri: widget.restaurantIri,
        dateRange: _selectedDateRange,
        statusFilter: _selectedStatusFilter,
      );
      setState(() => _deliveryStats = stats);
    } catch (e) {
      print('Failed to fetch delivery stats: $e');
      setState(() => _deliveryStats = null);
    }
  }

  Future<void> _fetchDeliveries() async {
    await context.read<DeliveryService>().fetchRestaurantDeliveries(
      widget.restaurantIri,
      status: _selectedStatusFilter,
      searchQuery: _currentSearchQuery,
      dateRange: _selectedDateRange,
    );

    await _fetchDeliveryStats();
  }

  bool _isUndoable(Delivery delivery) {
    final updatedAtStr = (delivery as dynamic).statusUpdatedAt as String?;
    if (updatedAtStr == null) return false;
    final updatedAt = DateTime.parse(updatedAtStr).toLocal();
    final now = DateTime.now().toLocal();
    final diff = now.difference(updatedAt).inSeconds;
    return diff >= 0 && diff < 60;
  }

  List<Enum$DeliveryStatus> _getValidNextStatuses(
    Enum$DeliveryStatus currentStatus,
  ) {
    switch (currentStatus) {
      case Enum$DeliveryStatus.Assigned:
        // Owner can mark as picked up if the courier forgot
        return [Enum$DeliveryStatus.Assigned, Enum$DeliveryStatus.Picked_up];
      case Enum$DeliveryStatus.Picked_up:
        // Owner can help complete or fail the delivery
        return [
          Enum$DeliveryStatus.Picked_up,
          Enum$DeliveryStatus.Delivered,
          Enum$DeliveryStatus.Failed,
        ];
      case Enum$DeliveryStatus.Failed:
        // Owner can mark as returned once the food is back at the kitchen
        return [Enum$DeliveryStatus.Failed, Enum$DeliveryStatus.Returned];
      case Enum$DeliveryStatus.Delivered:
      case Enum$DeliveryStatus.Returned:
        // Final states usually don't move forward
        return [currentStatus];
      default:
        return [currentStatus];
    }
  }

  bool get _isSingleDay {
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
          totalItems: deliveryService.totalItems,
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
              // Always show progress summary
              if (deliveryService.deliveries.isNotEmpty)
                _buildProgressSummary(deliveryService.deliveries),
              EasyDatePicker(
                selectedDateRange: _selectedDateRange,
                onDateRangeChanged: (range) {
                  setState(() {
                    _selectedDateRange = range;
                    _deliveryStats = null;
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
        delivery.status == Enum$DeliveryStatus.Picked_up ||
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
    if (delivery.status == Enum$DeliveryStatus.Picked_up) {
      return '${AppLocalizations.of(context)!.assignCourier} (${AppLocalizations.of(context)!.statusPickedUp})';
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
    final deliveryStatus = delivery.status;
    final isDone =
        deliveryStatus == Enum$DeliveryStatus.Delivered ||
        deliveryStatus == Enum$DeliveryStatus.Returned;
    final canUndo = isDone || deliveryStatus == Enum$DeliveryStatus.Failed;
    final undoable = _isUndoable(delivery);

    return Opacity(
      key: ValueKey(delivery.id),
      opacity: isDone && !undoable ? 0.6 : 1.0,
      child: AppCard(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Row with Status Badge
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
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
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
                    color: deliveryStatus.containerColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    deliveryStatus.getLabel(context),
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: deliveryStatus.onContainerColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Delivery Address Details
            AddressCard(
              firstName: delivery.order?.deliveryFirstName ?? '',
              lastName: delivery.order?.deliveryLastName ?? '',
              street: delivery.order?.deliveryStreet ?? '',
              apartment: delivery.order?.deliveryApartment,
              city: delivery.order?.deliveryCity ?? '',
              zipCode: delivery.order?.deliveryZipCode ?? '',
              phoneNumber: delivery.order?.deliveryPhoneNumber ?? '',
              deliveryDate: DateTime.parse(delivery.deliveryDate),
              withCardDecoration: false,
              showActions: false,
              showDefaultBadge: false,
              enablePhoneAction: true,
            ),

            const SizedBox(height: 20),

            // Unified Management Row: Courier Assignment and Status Control
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. Courier Assignment
                Expanded(
                  flex: 3,
                  child: DropdownButtonFormField<String>(
                    isExpanded: true,
                    decoration: InputDecoration(
                      labelText: _getCourierLabel(context, delivery),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      suffixIcon: _updatingIds.contains(delivery.id)
                          ? const Padding(
                              padding: EdgeInsets.all(12),
                              child: SizedBox(
                                width: 14,
                                height: 14,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              ),
                            )
                          : null,
                    ),
                    initialValue: delivery.courier?.id,
                    onChanged: _isCourierAssignmentDisabled(delivery)
                        ? null
                        : (val) => _assignCourier(delivery, val!),
                    items: couriers
                        .map(
                          (c) => DropdownMenuItem(
                            value: c.id,
                            child: Text(
                              c.email,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                const SizedBox(width: 8),
                // 2. Status Correction
                Expanded(
                  flex: 2,
                  child: DropdownButtonFormField<Enum$DeliveryStatus>(
                    isExpanded: true,
                    initialValue: deliveryStatus,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.status,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                    ),
                    onChanged:
                        (delivery.courier == null ||
                            _updatingIds.contains(delivery.id))
                        ? null
                        : (newStatus) {
                            if (newStatus != null &&
                                newStatus != deliveryStatus) {
                              _updateStatus(delivery.id, newStatus);
                            }
                          },
                    items: _getValidNextStatuses(deliveryStatus)
                        .map(
                          (s) => DropdownMenuItem(
                            value: s,
                            child: Text(
                              s.getLabel(context),
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.bodyMedium,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),

            // Undo Action (adopted from Courier Dashboard logic)
            if (canUndo && (delivery as dynamic).statusUpdatedAt != null)
              UndoTimerButton(
                statusUpdatedAt:
                    (delivery as dynamic).statusUpdatedAt as String,
                isUpdating: _updatingIds.contains(delivery.id),
                onExpired: () => setState(() {}),
                onUndo: () =>
                    _updateStatus(delivery.id, Enum$DeliveryStatus.Picked_up),
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

      await _fetchDeliveryStats();
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
      await _fetchDeliveryStats();

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
      // 1. Primary sort: Delivery date/time (chronological)
      final dateA = DateTime.parse(a.deliveryDate);
      final dateB = DateTime.parse(b.deliveryDate);
      final dateComparison = dateA.compareTo(dateB);
      if (dateComparison != 0) return dateComparison;

      // 2. Secondary sort: Status priority (active/in-progress first)
      Enum$DeliveryStatus getEffectiveStatus(Delivery d) {
        final status = d.status;
        if (_isUndoable(d)) {
          if (status == Enum$DeliveryStatus.Delivered ||
              status == Enum$DeliveryStatus.Failed) {
            return Enum$DeliveryStatus.Picked_up;
          }
          if (status == Enum$DeliveryStatus.Returned) {
            return Enum$DeliveryStatus.Failed;
          }
        }
        return status;
      }

      final statusPriority = {
        Enum$DeliveryStatus.Assigned: 1,
        Enum$DeliveryStatus.Picked_up: 2,
        Enum$DeliveryStatus.Failed: 3,
        Enum$DeliveryStatus.Delivered: 4,
        Enum$DeliveryStatus.Returned: 5,
      };

      final priorityA = statusPriority[getEffectiveStatus(a)] ?? 6;
      final priorityB = statusPriority[getEffectiveStatus(b)] ?? 6;
      final statusComparison = priorityA.compareTo(priorityB);
      if (statusComparison != 0) return statusComparison;

      // 3. Tertiary sort: By ID (newest first as fallback)
      return b.id.compareTo(a.id);
    });

    return sortedList;
  }

  Widget _buildProgressSummary(List items) {
    final total = _deliveryStats?['total'] ?? items.length;
    final completed =
        _deliveryStats?['completed'] ??
        items.where((i) {
          final status = i.status as Enum$DeliveryStatus;
          return status == Enum$DeliveryStatus.Delivered ||
              status == Enum$DeliveryStatus.Returned ||
              status == Enum$DeliveryStatus.Failed;
        }).length;

    final progress = total > 0 ? completed / total : 0.0;
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    // Create appropriate label based on date range
    String label;
    if (_selectedDateRange == null) {
      label = l10n.allTimeProgress(completed, total);
    } else if (_isSingleDay) {
      label = l10n.dailyProgress(completed, total);
    } else {
      label = l10n.rangeProgress(completed, total);
    }

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
        // Show note if using loaded items instead of stats
        if (_deliveryStats == null)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              l10n.showingXofY(items.length, total),
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        const SizedBox(height: 4),
      ],
    );
  }
}
