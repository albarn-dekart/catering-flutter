import 'package:catering_flutter/features/authentication/models/user.dart';
import 'package:catering_flutter/features/owner/models/restaurant_model.dart';
import 'package:catering_flutter/features/driver/models/delivery_model.dart';
import 'package:catering_flutter/features/customer/models/order_item_model.dart';

class Order {
  final int id;
  final User? customer;
  final String status;
  final List<OrderItem> orderItems;
  final Restaurant? restaurant;
  final List<Delivery> deliveries;
  final int total;
  final DateTime? deliveryStartDate;
  final DateTime? deliveryEndDate;
  final List<String> deliveryDays;
  final String? paymentIntentId;

  Order({
    required this.id,
    this.customer,
    required this.status,
    this.orderItems = const [],
    this.restaurant,
    this.deliveries = const [],
    required this.total,
    this.deliveryStartDate,
    this.deliveryEndDate,
    this.deliveryDays = const [],
    this.paymentIntentId,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      customer: json['customer'] != null ? User.fromJson(json['customer']) : null,
      status: json['status'],
      orderItems: (json['orderItems'] as List<dynamic>?)
              ?.map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      restaurant: json['restaurant'] != null
          ? Restaurant.fromJson(json['restaurant'])
          : null,
      deliveries: (json['deliveries'] as List<dynamic>?)
              ?.map((e) => Delivery.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      total: json['total'] / 100,
      deliveryStartDate: json['deliveryStartDate'] != null
          ? DateTime.parse(json['deliveryStartDate'])
          : null,
      deliveryEndDate: json['deliveryEndDate'] != null
          ? DateTime.parse(json['deliveryEndDate'])
          : null,
      deliveryDays: List<String>.from(json['deliveryDays'] ?? []),
      paymentIntentId: json['paymentIntentId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'customer': customer?.toJson(),
      'status': status,
      'orderItems': orderItems.map((e) => e.toJson()).toList(),
      'restaurant': restaurant?.toJson(),
      'deliveries': deliveries.map((e) => e.toJson()).toList(),
      'total': total * 100,
      'deliveryStartDate': deliveryStartDate?.toIso8601String(),
      'deliveryEndDate': deliveryEndDate?.toIso8601String(),
      'deliveryDays': deliveryDays,
      'paymentIntentId': paymentIntentId,
    };
  }
}