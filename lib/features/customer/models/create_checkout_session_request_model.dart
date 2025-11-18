class CreateCheckoutSessionRequestModel {
  final int orderId;

  CreateCheckoutSessionRequestModel({required this.orderId});

  Map<String, dynamic> toJson() {
    return {
      'order': '/api/orders/$orderId',
    };
  }
}
