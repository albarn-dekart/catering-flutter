class ApiConfig {
  static const String devBaseUrl = 'http://127.0.0.1:8000/api';
  static const String prodBaseUrl = 'https://your-production-url.com/api';

  static const bool isProduction = false;

  static String get baseUrl => isProduction ? prodBaseUrl : devBaseUrl;

  static String getImageUrl(String imageUrl) => '$baseUrl/images/$imageUrl';

  //Authorization
  static Uri getRegisterUrl() => Uri.parse('$baseUrl/register');
  static Uri getLoginUrl() => Uri.parse('$baseUrl/login');
  static Uri getLogoutUrl() => Uri.parse('$baseUrl/logout');
  static Uri getRefreshTokenUrl() => Uri.parse('$baseUrl/token/refresh');

  //User
  static Uri getUserUrl() => Uri.parse('$baseUrl/user');
  static Uri getUserByIdAdminUrl(String id) =>
      Uri.parse('$baseUrl/admin/user/$id');
  static Uri getUsersAdminUrl() => Uri.parse('$baseUrl/admin/users');
  static Uri getUserChangePasswordUrl() =>
      Uri.parse('$baseUrl/user/change_password');
  static Uri getDeleteUserByIdAdminUrl(String id) =>
      Uri.parse('${getUserByIdAdminUrl(id)}/delete');
  static Uri getUpdateUserRolesByIdAdminUrl(String id) =>
      Uri.parse('${getUserByIdAdminUrl(id)}/update_roles');

  //Meals
  static Uri getMealPlansUrl() => Uri.parse('$baseUrl/meal_plans');
  static Uri deleteMealPlanUrl(String id) => Uri.parse('$baseUrl/admin/meal_plans/$id/delete');
  static Uri updateMealPlanUrl(String id) => Uri.parse('$baseUrl/admin/meal_plans/$id/update');
  static Uri createMealPlanUrl() => Uri.parse('$baseUrl/admin/meal_plans/new');
  static Uri getMealCategoriesUrl() => Uri.parse('$baseUrl/categories');
  static Uri getMealsUrl(String? category) => category == null
      ? Uri.parse('$baseUrl/meals')
      : Uri.parse('$baseUrl/meals/$category');

  //Orders
  static Uri getUserOrdersUrl() => Uri.parse('$baseUrl/user/orders');
  static Uri getNewOrderUrl() => Uri.parse('$baseUrl/order/new');
  static Uri getUserOrdersByIdAdminUrl(String id) =>
      Uri.parse('${getUserByIdAdminUrl(id)}/orders');
  static Uri getDeleteOrderByIdAdminUrl(String id) =>
      Uri.parse('$baseUrl/admin/order/$id/delete');
  static Uri getUpdateOrderStatusUrl(String id) =>
      Uri.parse('$baseUrl/admin/order/$id/update_status');
}
