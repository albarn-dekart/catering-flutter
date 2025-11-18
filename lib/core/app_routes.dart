class AppRoutes {
  static const String home = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String myRestaurant = '/my-restaurant';
  static const String editRestaurant = '/restaurant/:restaurantId';
  static const String manageMealPlans = '/restaurant/meal-plans';
  static const String manageMeals = '/restaurant/meals';
  static const String saveMealPlan = '/restaurant/save-meal-plan';
  static const String saveMeal = '/restaurant/save-meal';
  static const String createRestaurant = '/create-restaurant';
  static const String changePassword = '/change-password';
  static const String receipt = '/customer/receipt';
  static const String orderConfirm = '/order-confirm/:orderId';
  static const String cart = '/cart';
  static const String restaurants = '/restaurants';
  static const String restaurantMealPlans =
      '/restaurants/:restaurantId/meal-plans';
  static const String orders = '/orders';
  static const String profile = '/profile';
  static const String deliveryDetails = '/delivery-details';
  static const String driverDashboard = '/driver-dashboard';
  static const String restaurantDashboard = '/restaurant-dashboard';
  static const String adminDashboard = '/admin-dashboard';
  static const String mealPlanDetails = '/meal-plans/:mealPlanId';
  static const String manageDeliveries = '/restaurant/deliveries';
}
