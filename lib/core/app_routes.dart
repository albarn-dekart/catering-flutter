class AppRoutes {
  static const String home = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String changePassword = '/change-password';

  //Customer
  static const String profile = '/profile';
  static const String restaurants = '/restaurants';
  static const String mealPlansByRestaurant = '/meal-plans';
  static const String mealPlanDetails = '/meal-plan';
  static const String cart = '/cart';
  static const String orders = '/orders';
  static const String orderDetail = '/order';
  static const String receipt = '/user/receipt';
  static const String orderConfirm = '/order-confirm';
  static const String addressList = '/addresses';
  static const String addressForm = '/address-form';

  //Admin
  static const String adminDashboard = '/admin/dashboard';
  static const String adminRestaurants = '/admin/restaurants';
  static const String adminRestaurantCreate = '/admin/restaurant/create';
  static const String adminUsers = '/admin/users';
  static const String adminRestaurantCategories =
      '/admin/categories/restaurant';
  static const String adminDietCategories = '/admin/categories/diet';

  //Restaurant
  static const String restaurantDashboard = '/restaurant/dashboard';

  static const String restaurantOrders = '/restaurant/orders';
  static const String restaurantDeliveries = '/restaurant/deliveries';
  static const String restaurantDrivers = '/restaurant/drivers';
  static const String restaurantForm = '/restaurant/edit';
  static const String restaurantMealPlans = '/restaurant/meal-plans';
  static const String restaurantMeals = '/restaurant/meals';
  static const String restaurantMealForm = '/restaurant/meal';
  static const String restaurantMealPlanForm = '/restaurant/meal-plan';

  //Driver
  static const String driverDashboard = '/driver/dashboard';
}
