import 'package:catering_flutter/graphql/schema.graphql.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:catering_flutter/core/utils/iri_helper.dart';
import 'package:catering_flutter/features/driver/services/delivery_service.dart';
import 'package:catering_flutter/features/user/services/user_service.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';
import 'package:catering_flutter/core/utils/status_extensions.dart';
import 'package:catering_flutter/core/widgets/searchable_list_screen.dart';

class DriverDashboardScreen extends StatefulWidget {
  const DriverDashboardScreen({super.key});

  @override
  State<DriverDashboardScreen> createState() => _DriverDashboardScreenState();
}

class _DriverDashboardScreenState extends State<DriverDashboardScreen> {
  int _selectedTabIndex = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await context.read<UserService>().fetchCurrentUserWithDeliveries();
      if (!mounted) return;
      final service = context.read<UserService>();
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
    return Consumer<UserService>(
      builder: (context, userService, child) {
        final deliveries =
            userService.currentUser?.deliveries?.edges
                ?.map((e) => e?.node)
                .whereType<dynamic>()
                .toList() ??
            [];

        final activeDeliveries = deliveries.where((d) {
          final status = d?.status as Enum$DeliveryStatus?;
          return status == Enum$DeliveryStatus.Pending ||
              status == Enum$DeliveryStatus.Picked_up;
        }).toList();

        final historyDeliveries = deliveries.where((d) {
          final status = d?.status as Enum$DeliveryStatus?;
          return status == Enum$DeliveryStatus.Delivered;
        }).toList();

        final currentItems = _selectedTabIndex == 0
            ? activeDeliveries
            : historyDeliveries;

        return SearchableListScreen<dynamic>(
          title: 'Driver Dashboard',
          items: currentItems,
          isLoading: userService.isLoading,
          searchHint: 'Search by order ID, customer, or address...',
          filter: (delivery, query) {
            final orderId = IriHelper.getId(delivery.order.id);
            final customerName =
                '${delivery.order.deliveryFirstName ?? ''} ${delivery.order.deliveryLastName ?? ''}'
                    .toLowerCase();
            final address =
                '${delivery.order.deliveryStreet ?? ''} ${delivery.order.deliveryCity ?? ''}'
                    .toLowerCase();
            return orderId.contains(query) ||
                customerName.contains(query) ||
                address.contains(query);
          },
          onRefresh: () async {
            await userService.fetchCurrentUserWithDeliveries();
          },
          customFilters: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: SizedBox(
              width: double.infinity,
              child: SegmentedButton<int>(
                segments: const [
                  ButtonSegment<int>(
                    value: 0,
                    label: Text('Active'),
                    icon: Icon(Icons.local_shipping),
                  ),
                  ButtonSegment<int>(
                    value: 1,
                    label: Text('History'),
                    icon: Icon(Icons.history),
                  ),
                ],
                selected: {_selectedTabIndex},
                onSelectionChanged: (Set<int> newSelection) {
                  setState(() {
                    _selectedTabIndex = newSelection.first;
                  });
                },
              ),
            ),
          ),
          itemBuilder: (context, delivery) {
            final deliveryStatus = delivery.status as Enum$DeliveryStatus;

            return Card(
              margin: const EdgeInsets.only(bottom: 16),
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Order #${IriHelper.getId(delivery.order.id)}',
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: deliveryStatus.containerColor(context),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            deliveryStatus.label,
                            style: TextStyle(
                              color: deliveryStatus.onContainerColor(context),
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Theme.of(
                              context,
                            ).colorScheme.surfaceContainerHighest,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.calendar_today,
                            size: 20,
                            color: Theme.of(
                              context,
                            ).colorScheme.onSurfaceVariant,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'Delivery Date: ${DateFormat('dd MMM yyyy').format(DateTime.parse(delivery.deliveryDate))}',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Theme.of(
                              context,
                            ).colorScheme.surfaceContainerHighest,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.person,
                            size: 20,
                            color: Theme.of(
                              context,
                            ).colorScheme.onSurfaceVariant,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Customer: ${delivery.order.deliveryFirstName ?? ''} ${delivery.order.deliveryLastName ?? ''}',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Theme.of(
                              context,
                            ).colorScheme.surfaceContainerHighest,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.phone,
                            size: 20,
                            color: Theme.of(
                              context,
                            ).colorScheme.onSurfaceVariant,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Phone: ${delivery.order.deliveryPhoneNumber ?? 'N/A'}',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Theme.of(
                              context,
                            ).colorScheme.surfaceContainerHighest,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.location_on,
                            size: 20,
                            color: Theme.of(
                              context,
                            ).colorScheme.onSurfaceVariant,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            '${delivery.order.deliveryStreet ?? ''}${delivery.order.deliveryApartment != null ? ', ${delivery.order.deliveryApartment}' : ''}\n${delivery.order.deliveryCity ?? ''} ${delivery.order.deliveryZipCode ?? ''}',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    if (deliveryStatus == Enum$DeliveryStatus.Pending)
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: FilledButton.icon(
                          onPressed: !userService.isLoading
                              ? () async {
                                  try {
                                    await context
                                        .read<DeliveryService>()
                                        .updateDeliveryStatus(
                                          delivery.id,
                                          Enum$DeliveryStatus.Picked_up,
                                        );
                                    if (!context.mounted) return;

                                    userService
                                        .fetchCurrentUserWithDeliveries();
                                  } catch (e) {
                                    if (!context.mounted) return;
                                    UIErrorHandler.handleError(
                                      context,
                                      e,
                                      customMessage: 'Failed to update status',
                                    );
                                  }
                                }
                              : null,
                          icon: const Icon(Icons.local_shipping),
                          label: const Text(
                            'PICK UP ORDER',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: FilledButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                      ),
                    if (deliveryStatus == Enum$DeliveryStatus.Picked_up)
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: FilledButton.icon(
                          onPressed: !userService.isLoading
                              ? () async {
                                  try {
                                    await context
                                        .read<DeliveryService>()
                                        .updateDeliveryStatus(
                                          delivery.id,
                                          Enum$DeliveryStatus.Delivered,
                                        );
                                    if (!context.mounted) return;

                                    userService
                                        .fetchCurrentUserWithDeliveries();
                                  } catch (e) {
                                    if (!context.mounted) return;
                                    UIErrorHandler.handleError(
                                      context,
                                      e,
                                      customMessage: 'Failed to update status',
                                    );
                                  }
                                }
                              : null,
                          icon: const Icon(Icons.check_circle),
                          label: const Text(
                            'MARK AS DELIVERED',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: FilledButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
