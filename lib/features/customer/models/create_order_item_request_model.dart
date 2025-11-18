class CreateOrderItemRequestModel {
  final int mealPlanId;
  final int quantity;

  CreateOrderItemRequestModel({required this.mealPlanId, required this.quantity});

  Map<String, dynamic> toJson() {
    return {
      'mealPlan': '/api/meal_plans/$mealPlanId',
      'quantity': quantity,
    };
  }
}
