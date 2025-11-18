import 'package:catering_flutter/features/customer/models/create_order_item_request_model.dart';

class CreateOrderRequestModel {
  final List<CreateOrderItemRequestModel> orderItems;
  final int restaurantId;
  final DateTime deliveryStartDate;
  final DateTime deliveryEndDate;
  final List<String> deliveryDays;

  CreateOrderRequestModel({
    required this.orderItems,
    required this.restaurantId,
    required this.deliveryStartDate,
    required this.deliveryEndDate,
    required this.deliveryDays,
  });

  Map<String, dynamic> toJson() {
    return {
      'orderItems': orderItems.map((e) => e.toJson()).toList(),
      'restaurant': '/api/restaurants/$restaurantId',
      'deliveryStartDate': deliveryStartDate.toIso8601String(),
      'deliveryEndDate': deliveryEndDate.toIso8601String(),
      'deliveryDays': deliveryDays,
    };
  }
}
