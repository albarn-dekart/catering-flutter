import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import 'package:catering_app/Classes/authorization.dart';
import 'package:catering_app/Classes/date_range_picker.dart';
import 'package:catering_app/Classes/user_manager.dart';
import 'package:catering_app/Classes/api_config.dart';
import 'package:catering_app/Classes/notification_bar.dart';
import 'package:catering_app/Classes/meal.dart';
import 'package:catering_app/Classes/info_row.dart';
import 'package:catering_app/Classes/app_theme.dart';
import 'package:catering_app/Classes/user.dart';
import 'package:catering_app/Classes/button.dart';

class Order {
  final int id;
  final OrderStatus status;
  final List<Meal> meals;
  final DateTime startDate;
  final DateTime endDate;
  final List<int> deliveryDays;

  Order({
    required this.id,
    required this.status,
    required this.meals,
    required this.startDate,
    required this.endDate,
    required this.deliveryDays,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is Order && other.id == id);

  @override
  int get hashCode => id.hashCode;

  factory Order.fromJson(Map<String, dynamic> json) {
    final meals = (json['meals'] as List<dynamic>)
        .map((mealJson) => Meal.fromJson(mealJson as Map<String, dynamic>))
        .toList();

    return Order(
      id: json['id'],
      status: parseOrderStatus(json['status']),
      meals: meals,
      startDate: DateTime.parse(json['start-date']),
      endDate: DateTime.parse(json['end-date']),
      deliveryDays: List<int>.from((json['delivery-days'] as List<dynamic>)
          .map((day) => int.parse(day.toString()))),
    );
  }

  static Future<List<Order>> getAll([User? user]) async {
    try {
      final token = await Authorization.getValidToken();
      if (token == null) return [];

      final response = await http.get(
        user != null
            ? ApiConfig.ordersByUserId(user.id.toString())
            : ApiConfig.orders(),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final ordersJson = jsonDecode(response.body) as List<dynamic>;
        return ordersJson
            .map((orderJson) =>
                Order.fromJson(orderJson as Map<String, dynamic>))
            .toList();
      } else {
        final error =
            '${response.statusCode.toString()} - ${jsonDecode(response.body)['error'] ?? 'Unknown error'}';
        NotificationBar().show('Failed to load orders', Colors.red, error);
      }
    } catch (error) {
      NotificationBar()
          .show('Failed to load orders', Colors.red, error.toString());
    }
    return [];
  }

  Future<bool> delete() async {
    try {
      final token = await Authorization.getValidToken();
      if (token == null) return false;

      final response = await http.delete(
        ApiConfig.deleteOrder(id.toString()),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 204) {
        NotificationBar().show('Order deleted!', Colors.green);
        return true;
      } else {
        final error =
            '${response.statusCode.toString()} - ${jsonDecode(response.body)['error'] ?? 'Unknown error'}';
        NotificationBar().show('Failed to delete order', Colors.red, error);
      }
    } catch (error) {
      NotificationBar()
          .show('Failed to delete order', Colors.red, error.toString());
    }
    return false;
  }

  static Future<bool> placeOrder(List<Meal> meals, DateTime startDate,
      DateTime endDate, List<int> deliveryDays) async {
    // Validation
    if (meals.isEmpty) {
      NotificationBar().show(
        'Meals list must not be empty',
        Colors.yellow,
      );
      return false;
    }

    if (startDate.isAfter(endDate)) {
      NotificationBar().show(
        'Start date must be before end date',
        Colors.yellow,
      );
      return false;
    }

    if (deliveryDays.isEmpty) {
      NotificationBar().show(
        'Delivery days must not be empty',
        Colors.yellow,
      );
      return false;
    }

    for (var day in deliveryDays) {
      if (day < 1 || day > 7) {
        NotificationBar().show(
          'Delivery days must be between 1 and 7',
          Colors.yellow,
        );
        return false;
      }
    }

    final dateFormat = DateFormat('yyyy-MM-dd');
    final requestBody = {
      "start_date": dateFormat.format(startDate),
      "end_date": dateFormat.format(endDate),
      "delivery_days": deliveryDays.toList(),
      "meals": meals.map((meal) => meal.id).toList(),
    };

    try {
      final token = await Authorization.getValidToken();
      if (token == null) return false;

      final response = await http.post(
        ApiConfig.newOrder(),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 201) {
        NotificationBar().show('Order placed!', Colors.green);
        return true;
      } else {
        final error =
            '${response.statusCode.toString()} - ${jsonDecode(response.body)['error'] ?? 'Unknown error'}';
        NotificationBar().show('Failed to place order', Colors.red, error);
      }
    } catch (error) {
      NotificationBar()
          .show('Failed to place order', Colors.red, error.toString());
    }
    return false;
  }
}

enum OrderStatus { Unpaid, Paid, Active, Completed }

OrderStatus parseOrderStatus(String status) {
  switch (status) {
    case 'Unpaid':
      return OrderStatus.Unpaid;
    case 'Paid':
      return OrderStatus.Paid;
    case 'Active':
      return OrderStatus.Active;
    case 'Completed':
      return OrderStatus.Completed;
    default:
      throw Exception('Unknown status: $status');
  }
}

class OrderCard extends StatefulWidget {
  final Order order;
  final Function(Order) onOrderDeleted;

  const OrderCard({
    super.key,
    required this.order,
    required this.onOrderDeleted,
  });

  @override
  _OrderCardState createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  late OrderStatus _currentStatus;

  @override
  void initState() {
    super.initState();
    _currentStatus = widget.order.status;
  }

  Future<void> _updateOrderStatus(OrderStatus newStatus) async {
    try {
      final token = await Authorization.getValidToken();
      if (token == null) return;

      final response = await http.patch(
        ApiConfig.updateOrderStatus(widget.order.id.toString()),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({'status': newStatus.name}),
      );

      if (response.statusCode == 204) {
        setState(() => _currentStatus = newStatus);
        NotificationBar().show(
          'Status updated!',
          AppTheme.successColor,
          'Order status changed to ${newStatus.name}',
        );
      } else {
        final error =
            '${response.statusCode.toString()} - ${jsonDecode(response.body)['error'] ?? 'Unknown error'}';
        NotificationBar().show(
          'Update failed',
          AppTheme.errorColor,
          error,
        );
      }
    } catch (error) {
      NotificationBar().show(
        'Update failed',
        AppTheme.errorColor,
        error.toString(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('MMM dd, yyyy');
    final startDate = dateFormat.format(widget.order.startDate);
    final endDate = dateFormat.format(widget.order.endDate);

    return Card(
      margin: const EdgeInsets.symmetric(
        vertical: AppTheme.defaultPadding / 2,
        horizontal: AppTheme.defaultPadding,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppTheme.cardRadius),
      ),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: AppTheme.defaultPadding / 2),
            _buildDateInfo(startDate, endDate),
            const SizedBox(height: AppTheme.defaultPadding / 2),
            _buildDeliveryDays(),
            const SizedBox(height: AppTheme.defaultPadding / 2),
            _buildStatusSection(),
            const SizedBox(height: AppTheme.defaultPadding),
            _buildMealsList(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Order #${widget.order.id}',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        if (UserManager().hasRole('ROLE_ADMIN'))
          cardButton(
              'Delete', _confirmDelete, Icons.delete_outlined, Colors.red),
      ],
    );
  }

  Widget _buildDateInfo(String startDate, String endDate) {
    return Column(
      children: [
        InfoRow(
          icon: Icons.calendar_today_outlined,
          label: 'Start Date',
          value: startDate,
        ),
        const SizedBox(height: AppTheme.defaultPadding / 2),
        InfoRow(
          icon: Icons.calendar_month_outlined,
          label: 'End Date',
          value: endDate,
        ),
      ],
    );
  }

  Widget _buildDeliveryDays() {
    // Check if the screen width is mobile size
    final bool isMobile = MediaQuery.of(context).size.width < 600;

    if (isMobile) {
      // Mobile layout - each day on new line
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: AppTheme.defaultPadding / 2),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.local_shipping_outlined,
              size: 20,
              color: AppTheme.primaryColor,
            ),
            const SizedBox(width: AppTheme.defaultPadding),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Delivery Days:",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                ...widget.order.deliveryDays.map((day) => Text(
                  DateRangePicker.dayOfWeekToString(day),
                  style: const TextStyle(color: Colors.black54),
                )).toList(),
              ],
            ),
          ],
        ),
      );
    } else {
      // Desktop layout - single line with commas
      return InfoRow(
        icon: Icons.local_shipping_outlined,
        label: 'Delivery Days',
        value: widget.order.deliveryDays
            .map((day) => DateRangePicker.dayOfWeekToString(day))
            .join(', '),
      );
    }
  }

  Widget _buildStatusSection() {
    return Row(
      children: [
        const InfoRow(
            icon: Icons.inventory_2_outlined, label: 'Status', value: ''),
        const SizedBox(width: AppTheme.defaultPadding),
        if (UserManager().hasRole('ROLE_ADMIN'))
          _buildStatusDropdown()
        else
          _buildStatusChip(),
      ],
    );
  }

  Widget _buildStatusDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppTheme.defaultPadding),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(AppTheme.cardRadius),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<OrderStatus>(
          value: _currentStatus,
          icon: const Icon(Icons.arrow_drop_down, size: 20),
          style: Theme.of(context).textTheme.bodyMedium,
          items: OrderStatus.values.map((status) {
            return DropdownMenuItem<OrderStatus>(
              value: status,
              child: Text(
                status.name,
                style: TextStyle(
                  color: _statusColor(status),
                ),
              ),
            );
          }).toList(),
          onChanged: (status) =>
              status != null ? _updateOrderStatus(status) : null,
        ),
      ),
    );
  }

  Widget _buildStatusChip() {
    return Chip(
      label: Text(
        _currentStatus.name,
        style: TextStyle(
          color: _statusColor(_currentStatus),
          fontSize: 12,
        ),
      ),
      backgroundColor: _statusColor(_currentStatus).withValues(alpha: 0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppTheme.cardRadius),
      ),
    );
  }

  Color _statusColor(OrderStatus status) {
    switch (status) {
      case OrderStatus.Unpaid:
        return AppTheme.warningColor;
      case OrderStatus.Paid:
        return AppTheme.secondaryColor;
      case OrderStatus.Active:
        return AppTheme.primaryColor;
      case OrderStatus.Completed:
        return AppTheme.successColor;
    }
  }

  Widget _buildMealsList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Included Meals',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
        ),
        const SizedBox(height: AppTheme.defaultPadding / 2),
        ...widget.order.meals.map(
          (meal) => Padding(
            padding: const EdgeInsets.only(bottom: AppTheme.defaultPadding / 2),
            child: MealCard(meal: meal),
          ),
        ),
      ],
    );
  }

  Future<void> _confirmDelete() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Deletion'),
        content: const Text('This will permanently remove the order'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTheme.cardRadius),
        ),
        actions: [
          TextButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.pop(context, false),
          ),
          TextButton(
            child: const Text('Delete',
                style: TextStyle(color: AppTheme.errorColor)),
            onPressed: () => Navigator.pop(context, true),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      if (await widget.order.delete()) {
        widget.onOrderDeleted(widget.order);
      }
    }
  }
}
