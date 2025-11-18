import 'package:catering_flutter/features/owner/models/restaurant_model.dart';
import 'package:catering_flutter/features/customer/models/recipient_details.dart';

class User {
  final int id;
  final String email;
  final List<String> roles;
  final RecipientDetails? recipientDetails;
  final Restaurant? restaurant;

  User({
    required this.id,
    required this.email,
    required this.roles,
    this.recipientDetails,
    this.restaurant,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      roles: List<String>.from(json['roles']),
      recipientDetails: json['recipientDetails'] != null
          ? RecipientDetails.fromJson(json['recipientDetails'])
          : null,
      restaurant: json['restaurant'] != null
          ? Restaurant.fromJson(json['restaurant'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'roles': roles,
      'recipientDetails': recipientDetails?.toJson(),
      'restaurant': restaurant?.toJson(),
    };
  }
}
