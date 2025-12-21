import 'package:catering_flutter/graphql/schema.graphql.dart';
import 'package:catering_flutter/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/core/utils/date_formatter.dart';
import 'package:catering_flutter/core/utils/iri_helper.dart';
import 'package:catering_flutter/features/driver/services/delivery_service.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';
import 'package:catering_flutter/features/user/services/user_service.dart';
import 'package:catering_flutter/core/utils/status_extensions.dart';
import 'package:catering_flutter/core/widgets/searchable_list_screen.dart';
import 'package:catering_flutter/core/services/export_service.dart';

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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchDeliveriesAndDrivers();
    });
  }

  Future<void> _fetchDeliveriesAndDrivers() async {
    await Future.wait([
      _fetchDeliveries(),
      context.read<UserService>().fetchDriversByRestaurant(
        widget.restaurantIri,
      ),
    ]);
  }

  Future<void> _fetchDeliveries() async {
    await context.read<DeliveryService>().fetchRestaurantDeliveries(
      widget.restaurantIri,
      status: _selectedStatusFilter,
      searchQuery: _currentSearchQuery,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isNarrow = MediaQuery.of(context).size.width < 700;
    return Consumer2<DeliveryService, UserService>(
      builder: (context, deliveryService, userService, child) {
        return SearchableListScreen<Delivery>(
          title: AppLocalizations.of(context)!.manageDeliveries,
          floatingActionButton: isNarrow
              ? FloatingActionButton(
                  onPressed: _isExporting ? null : _exportDeliveries,
                  tooltip: AppLocalizations.of(context)!.exportToCsv,
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
                )
              : FloatingActionButton.extended(
                  onPressed: _isExporting ? null : _exportDeliveries,
                  icon: _isExporting
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Icon(Icons.download),
                  label: Text(AppLocalizations.of(context)!.exportToCsv),
                ),
          items: deliveryService.deliveries,
          isLoading: deliveryService.isLoading || userService.isLoading,
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
          onRefresh: _fetchDeliveriesAndDrivers,
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
            final drivers = userService.restaurantDrivers;
            return _buildDeliveryCard(context, delivery, drivers);
          },
        );
      },
    );
  }

  Widget _buildDeliveryCard(
    BuildContext context,
    Delivery delivery,
    List<RestaurantDriverNode> drivers,
  ) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(
                    context,
                  )!.orderNumber(IriHelper.getId(delivery.order!.id)),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: delivery.status.containerColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    delivery.status.getLabel(context),
                    style: TextStyle(
                      color: delivery.status.onContainerColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(
                  Icons.calendar_today,
                  size: 16,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 8),
                Text(
                  AppLocalizations.of(context)!.deliveryDateWithDate(
                    AppDateFormatter.shortDate(
                      context,
                      DateTime.parse(delivery.deliveryDate),
                    ),
                  ),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  Icons.person,
                  size: 16,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 8),
                Text(
                  AppLocalizations.of(context)!.driverWithName(
                    delivery.driver?.email ??
                        AppLocalizations.of(context)!.unassigned,
                  ),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (drivers.isNotEmpty)
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: (delivery.order?.status == Enum$OrderStatus.Unpaid)
                      ? '${AppLocalizations.of(context)!.assignDriver} (${AppLocalizations.of(context)!.statusUnpaid})'
                      : AppLocalizations.of(context)!.assignDriver,
                  border: const OutlineInputBorder(),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                ),
                initialValue: delivery.driver?.id,
                onChanged: (delivery.order?.status == Enum$OrderStatus.Unpaid)
                    ? null
                    : (String? newDriverId) async {
                        if (newDriverId != null) {
                          await _assignDriver(delivery, newDriverId);
                        }
                      },
                items: drivers.map((driver) {
                  return DropdownMenuItem<String>(
                    value: driver.id,
                    child: Text(driver.email),
                  );
                }).toList(),
              ),
            const SizedBox(height: 16),
            // Status progression buttons
            if (delivery.status == Enum$DeliveryStatus.Assigned)
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: () =>
                      _updateStatus(delivery.id, Enum$DeliveryStatus.Picked_up),
                  icon: const Icon(Icons.shopping_bag),
                  label: Text(AppLocalizations.of(context)!.markAsPickedUp),
                ),
              ),
            if (delivery.status == Enum$DeliveryStatus.Picked_up)
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: () =>
                      _updateStatus(delivery.id, Enum$DeliveryStatus.Delivered),
                  style: FilledButton.styleFrom(backgroundColor: Colors.green),
                  icon: const Icon(Icons.check_circle),
                  label: Text(
                    AppLocalizations.of(context)!.markAsDeliveredAction,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _assignDriver(Delivery delivery, String driverId) async {
    final deliveryService = context.read<DeliveryService>();
    try {
      await deliveryService.updateDeliveryStatus(
        delivery.id, // Use string ID for mutations
        // Let backend handle status update
        driverIri: driverId,
      );
      if (!mounted) return;

      UIErrorHandler.showSnackBar(
        context,
        AppLocalizations.of(context)!.driverAssignedSuccess,
        isError: false,
      );
      _fetchDeliveries();
    } catch (e) {
      if (!mounted) return;
      UIErrorHandler.showSnackBar(
        context,
        AppLocalizations.of(context)!.driverAssignFailed,
        isError: true,
        action: SnackBarAction(
          label: AppLocalizations.of(context)!.retry,
          onPressed: () => _assignDriver(delivery, driverId),
        ),
      );
    }
  }

  Future<void> _updateStatus(
    String deliveryId,
    Enum$DeliveryStatus newStatus,
  ) async {
    final deliveryService = context.read<DeliveryService>();
    try {
      await deliveryService.updateDeliveryStatus(deliveryId, status: newStatus);

      if (!mounted) return;

      UIErrorHandler.showSnackBar(
        context,
        AppLocalizations.of(context)!.deliveryStatusUpdated,
        isError: false,
      );
      _fetchDeliveries();
    } catch (e) {
      if (!mounted) return;
      UIErrorHandler.handleError(
        context,
        e,
        customMessage: AppLocalizations.of(context)!.failedToUpdateStatus,
      );
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
      );

      if (!mounted) return;

      UIErrorHandler.showSnackBar(
        context,
        AppLocalizations.of(context)!.deliveriesExportedSuccess,
        isError: false,
      );
    } catch (e) {
      if (!mounted) return;
      UIErrorHandler.showSnackBar(
        context,
        AppLocalizations.of(context)!.deliveriesExportFailed(e.toString()),
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
