import 'package:catering_flutter/graphql/schema.graphql.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';
import 'package:catering_flutter/core/utils/iri_helper.dart';
import 'package:catering_flutter/features/order/services/order_service.dart';
import 'package:catering_flutter/core/utils/status_extensions.dart';
import 'package:catering_flutter/core/widgets/searchable_list_screen.dart';

class RestaurantOrdersScreen extends StatefulWidget {
  final String restaurantIri;

  const RestaurantOrdersScreen({super.key, required this.restaurantIri});

  @override
  State<RestaurantOrdersScreen> createState() => _RestaurantOrdersScreenState();
}

class _RestaurantOrdersScreenState extends State<RestaurantOrdersScreen> {
  Enum$OrderStatus? _selectedStatusFilter;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _fetchOrders();
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

  Future<void> _fetchOrders() async {
    await context.read<OrderService>().fetchAllOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderService>(
      builder: (context, orderService, child) {
        // Apply status filter locally
        final filteredOrders = _selectedStatusFilter == null
            ? orderService.orders
            : orderService.orders
                  .where((order) => order.status == _selectedStatusFilter)
                  .toList();

        return SearchableListScreen<Order>(
          title: 'Manage Orders',
          items: filteredOrders,
          isLoading: orderService.isLoading,
          searchHint: 'Search by order number...',
          filter: (order, query) {
            final orderId = IriHelper.getId(order.id);
            return orderId.toLowerCase().contains(query);
          },
          onRefresh: () async => _fetchOrders(),
          customFilters: _buildFilterChips(),
          itemBuilder: (context, order) {
            return _buildOrderCard(context, order);
          },
        );
      },
    );
  }

  Widget _buildFilterChips() {
    return Container(
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

  Widget _buildOrderCard(BuildContext context, Order order) {
    // Moved the main content into a new Column for the ExpansionTile's children
    final orderItemsContent = [
      // Customer Info
      Row(
        children: [
          Icon(
            Icons.person,
            size: 16,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          const SizedBox(width: 8),
          Text(
            'Customer: ${order.customer?.email ?? 'N/A'}',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
      const SizedBox(height: 8),
      // Total
      Row(
        children: [
          Icon(
            Icons.attach_money,
            size: 16,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          const SizedBox(width: 8),
          Text(
            'Total: ${(order.total / 100.0).toStringAsFixed(2)} PLN',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ),
      const SizedBox(height: 8),
      // Order items
      if (order.orderItems?.edges?.isNotEmpty == true) ...[
        const Divider(height: 24),
        Text(
          'Order Items (${order.orderItems!.edges!.length})',
          style: Theme.of(
            context,
          ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        ...order.orderItems!.edges!.map((edge) {
          final item = edge?.node;
          if (item == null) return const SizedBox();

          return Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Row(
              children: [
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    '${item.mealPlan.name} x ${item.quantity}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                Text(
                  '${((item.mealPlan.price ?? 0) * (item.quantity)).toStringAsFixed(2)} PLN',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          );
        }),
        const Divider(height: 24),
      ],
      // Status update dropdown
      Row(
        children: [
          Expanded(
            child: DropdownButtonFormField<Enum$OrderStatus>(
              decoration: const InputDecoration(
                labelText: 'Change Status',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
              ),
              initialValue: order.status,
              items: Enum$OrderStatus.values
                  .where((status) => status != Enum$OrderStatus.$unknown)
                  .map((status) {
                    return DropdownMenuItem(
                      value: status,
                      child: Text(status.label),
                    );
                  })
                  .toList(),
              onChanged: (newStatus) async {
                if (newStatus != null && newStatus != order.status) {
                  final confirmed = await _showStatusChangeConfirmation(
                    context,
                    order.id,
                    order.status,
                    newStatus,
                  );
                  if (confirmed == true && context.mounted) {
                    await _updateOrderStatus(order.id, newStatus);
                  }
                }
              },
            ),
          ),
        ],
      ),
    ];

    // Use a Card wrapper to maintain the styling, but use ExpansionTile inside
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      // Use ExpansionTile's key properties to construct the card
      child: ExpansionTile(
        tilePadding: const EdgeInsets.all(16.0), // Padding for the header
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ), // Ensure shape applies
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),

        // Title Row - This is now the header of the ExpansionTile
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Order #${IriHelper.getId(order.id)}',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: order.status.containerColor(context),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                order.status.label,
                style: TextStyle(
                  color: order.status.onContainerColor(context),
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
        // The rest of the content goes into children
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: orderItemsContent,
            ),
          ),
        ],
      ),
    );
  }

  Future<bool?> _showStatusChangeConfirmation(
    BuildContext context,
    String orderId,
    Enum$OrderStatus currentStatus,
    Enum$OrderStatus newStatus,
  ) {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Status Change'),
        content: Text(
          'Change order #${IriHelper.getId(orderId)} status from ${currentStatus.label} to ${newStatus.label}?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Confirm'),
          ),
        ],
      ),
    );
  }

  Future<void> _updateOrderStatus(
    String orderId,
    Enum$OrderStatus newStatus,
  ) async {
    final orderService = context.read<OrderService>();
    try {
      await orderService.updateOrderStatus(
        IriHelper.buildIri('orders', orderId),
        newStatus,
      );

      if (!mounted) return;

      UIErrorHandler.showSnackBar(
        context,
        'Order status updated successfully',
        isError: false,
      );
      // Refresh orders
      _fetchOrders();
    } catch (e) {
      if (!mounted) return;
      UIErrorHandler.handleError(context, e);
    }
  }
}
