import 'package:catering_flutter/features/authentication/models/user.dart';
import 'package:catering_flutter/features/customer/models/order_model.dart';

class Delivery {
  final int id;
  final User? driver;
  final String status;
  final DateTime deliveryDate;
  final Order? order;

  Delivery({
    required this.id,
    this.driver,
    required this.status,
    required this.deliveryDate,
    this.order,
  });

  factory Delivery.fromJson(Map<String, dynamic> json) {
    return Delivery(
      id: json['id'],
      driver: json['driver'] != null ? User.fromJson(json['driver']) : null,
      status: json['status'],
      deliveryDate: DateTime.parse(json['deliveryDate']),
      order: json['order'] != null ? Order.fromJson(json['order']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'driver': driver?.toJson(),
      'status': status,
      'deliveryDate': deliveryDate.toIso8601String(),
      'order': order?.toJson(),
    };
  }
}