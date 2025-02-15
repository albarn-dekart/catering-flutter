class ApiConfig {
  static const String devBaseUrl = 'http://127.0.0.1:8000/api';
  static const String prodBaseUrl = 'http://63.177.98.17/api';

  static const bool isProduction = true;

  static String get baseUrl => isProduction ? prodBaseUrl : devBaseUrl;

  //Authorization
  static Uri register() => Uri.parse('$baseUrl/register');
  static Uri login() => Uri.parse('$baseUrl/login');
  static Uri logout() => Uri.parse('$baseUrl/logout');
  static Uri refreshToken() => Uri.parse('$baseUrl/token/refresh');

  //User
  static Uri userDetails() => Uri.parse('$baseUrl/user/details');
  static Uri changePassword() =>
      Uri.parse('$baseUrl/user/change_password');
  static Uri userById(String id) =>
      Uri.parse('$baseUrl/admin/user/$id');
  static Uri users() => Uri.parse('$baseUrl/admin/users');
  static Uri userDetailsById(String id) =>
      Uri.parse('${userById(id)}/details');
  static Uri deleteUserById(String id) =>
      Uri.parse('${userById(id)}/delete');
  static Uri updateRolesById(String id) =>
      Uri.parse('${userById(id)}/update_roles');

  //Meals Plans
  static Uri mealPlans() => Uri.parse('$baseUrl/meal_plan');
  static Uri newMealPlan() => Uri.parse('$baseUrl/admin/meal_plan');
  static Uri updateMealPlan(String id) =>
      Uri.parse('$baseUrl/admin/meal_plan/$id');
  static Uri deleteMealPlan(String id) =>
      Uri.parse('$baseUrl/admin/meal_plan/$id/delete');

  //Meal
  static Uri meals(String? category) => category == null
      ? Uri.parse('$baseUrl/meals')
      : Uri.parse('$baseUrl/meals/$category');
  static Uri newMeal() => Uri.parse('$baseUrl/admin/meal');
  static Uri updateMeal(String id) => Uri.parse('$baseUrl/admin/meal/$id');
  static Uri deleteMeal(String id) =>
      Uri.parse('$baseUrl/admin/meal/$id/delete');

  //Categories
  static Uri categories() => Uri.parse('$baseUrl/categories');
  static Uri newCategory() => Uri.parse('$baseUrl/admin/category');
  static Uri updateCategory(String id) =>
      Uri.parse('$baseUrl/admin/category/$id');
  static Uri deleteCategory(String id) =>
      Uri.parse('$baseUrl/admin/category/$id/delete');

  //Orders
  static Uri orders() => Uri.parse('$baseUrl/user/orders');
  static Uri newOrder() => Uri.parse('$baseUrl/order');
  static Uri ordersByUserId(String id) =>
      Uri.parse('${userById(id)}/orders');
  static Uri deleteOrder(String id) =>
      Uri.parse('$baseUrl/admin/order/$id/delete');
  static Uri updateOrderStatus(String id) =>
      Uri.parse('$baseUrl/admin/order/$id/update_status');
}
