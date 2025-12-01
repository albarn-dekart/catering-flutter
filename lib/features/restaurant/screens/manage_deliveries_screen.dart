import 'package:catering_flutter/graphql/schema.graphql.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart';
import 'package:catering_flutter/core/utils/iri_helper.dart';
import 'package:catering_flutter/features/driver/services/delivery_service.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';
import 'package:catering_flutter/features/user/services/user_service.dart';
import 'package:catering_flutter/core/utils/status_extensions.dart';
import 'package:catering_flutter/core/widgets/responsive_grid.dart';

class ManageDeliveriesScreen extends StatefulWidget {
  final String restaurantIri;

  const ManageDeliveriesScreen({super.key, required this.restaurantIri});

  @override
  State<ManageDeliveriesScreen> createState() => _ManageDeliveriesScreenState();
}

class _ManageDeliveriesScreenState extends State<ManageDeliveriesScreen> {
  Enum$DeliveryStatus? _selectedStatusFilter;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchDeliveriesAndDrivers();
    });
  }

  Future<void> _fetchDeliveriesAndDrivers() async {
    await Future.wait([
      context.read<DeliveryService>().fetchRestaurantDeliveries(
        widget.restaurantIri,
      ),
      context.read<UserService>().fetchDriversByRestaurant(
        widget.restaurantIri,
      ),
    ]);
  }

  void _fetchDeliveries() {
    context.read<DeliveryService>().fetchRestaurantDeliveries(
      widget.restaurantIri,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Manage Deliveries',
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
                  ...Enum$DeliveryStatus.values
                      .where((status) => status != Enum$DeliveryStatus.$unknown)
                      .map((status) {
                        return _buildFilterChip(status, status.label);
                      }),
                ],
              ),
            ),
          ),
          // Deliveries list
          Expanded(
            child: Consumer2<DeliveryService, UserService>(
              builder: (context, deliveryService, userService, child) {
                if (deliveryService.isLoading || userService.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (deliveryService.hasError) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Error: ${deliveryService.errorMessage}',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.error,
                          ),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton.icon(
                          onPressed: _fetchDeliveries,
                          icon: const Icon(Icons.refresh),
                          label: const Text('Retry'),
                        ),
                      ],
                    ),
                  );
                } else if (deliveryService.deliveries.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.local_shipping_outlined,
                          size: 64,
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface.withValues(alpha: 77),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No deliveries found',
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurface.withValues(alpha: 153),
                              ),
                        ),
                      ],
                    ),
                  );
                } else {
                  final drivers = userService.restaurantDrivers;

                  // Apply status filter
                  final filteredDeliveries = _selectedStatusFilter == null
                      ? deliveryService.deliveries
                      : deliveryService.deliveries
                            .where((d) => d.status == _selectedStatusFilter)
                            .toList();

                  if (filteredDeliveries.isEmpty) {
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
                            'No deliveries with status "${_selectedStatusFilter!.label}"',
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(
                                  color: Theme.of(context).colorScheme.onSurface
                                      .withValues(alpha: 153),
                                ),
                          ),
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
                      ),
                    );
                  }

                  return RefreshIndicator(
                    onRefresh: () async => _fetchDeliveries(),
                    child: ResponsiveGridBuilder(
                      itemCount: filteredDeliveries.length,
                      childAspectRatio: 1.3,
                      itemBuilder: (context, index) {
                        final delivery = filteredDeliveries[index];
                        return _buildDeliveryCard(context, delivery, drivers);
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

  Widget _buildFilterChip(Enum$DeliveryStatus? status, String label) {
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

  Widget _buildDeliveryCard(
    BuildContext context,
    Delivery delivery,
    List<RestaurantUserNode> drivers,
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
                  'Order #${IriHelper.getId(delivery.order?.id ?? '')}',
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
                    color: delivery.status.containerColor(context),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    delivery.status.label,
                    style: TextStyle(
                      color: delivery.status.onContainerColor(context),
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
                  'Delivery Date: ${DateFormat('dd MMM yyyy').format(DateTime.parse(delivery.deliveryDate))}',
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
                  'Driver: ${delivery.driver?.email ?? 'Unassigned'}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (drivers.isNotEmpty)
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Assign Driver',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                ),
                initialValue: delivery.driver?.id,
                onChanged: (String? newDriverId) async {
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
                  label: const Text('Mark as Picked Up'),
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
                  label: const Text('Mark as Delivered'),
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
        delivery.status, // Keep current status
        driverIri: driverId,
      );
      if (!mounted) return;

      UIErrorHandler.showSnackBar(
        context,
        'Driver assigned successfully.',
        isError: false,
      );
      _fetchDeliveries();
    } catch (e) {
      if (!mounted) return;
      UIErrorHandler.showSnackBar(
        context,
        'Failed to assign driver. Please retry.',
        isError: true,
        action: SnackBarAction(
          label: 'Retry',
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
      await deliveryService.updateDeliveryStatus(deliveryId, newStatus);

      if (!mounted) return;

      UIErrorHandler.showSnackBar(
        context,
        'Delivery status updated successfully',
        isError: false,
      );
      _fetchDeliveries();
    } catch (e) {
      if (!mounted) return;
      UIErrorHandler.handleError(
        context,
        e,
        customMessage: 'Failed to update status',
      );
    }
  }
}
