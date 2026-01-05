import 'dart:convert';
import 'package:catering_flutter/core/services/api_service.dart';
import 'package:flutter/foundation.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';

class Statistics {
  final double totalRevenue; // in groszy
  final int totalOrders;
  final int totalUsers;
  final int activeOrders;
  final double averageOrderValue; // in groszy
  final int customerCount;
  final int restaurantCount;
  final int courierCount;
  final int adminCount;
  final List<Map<String, dynamic>> revenueTimeSeries;
  final List<Map<String, dynamic>> dailyOrdersTimeSeries;
  final Map<String, int> ordersByStatus;
  final List<Map<String, dynamic>> topRestaurants;

  Statistics({
    required this.totalRevenue,
    required this.totalOrders,
    required this.totalUsers,
    required this.activeOrders,
    required this.averageOrderValue,
    required this.customerCount,
    required this.restaurantCount,
    required this.courierCount,
    required this.adminCount,
    required this.revenueTimeSeries,
    required this.dailyOrdersTimeSeries,
    required this.ordersByStatus,
    required this.topRestaurants,
  });

  factory Statistics.fromJson(Map<String, dynamic> json) {
    return Statistics(
      totalRevenue: (json['totalRevenue'] ?? 0).toDouble(),
      totalOrders: json['totalOrders'] ?? 0,
      totalUsers: json['totalUsers'] ?? 0,
      activeOrders: json['activeOrders'] ?? 0,
      averageOrderValue: (json['averageOrderValue'] ?? 0).toDouble(),
      customerCount: json['customerCount'] ?? 0,
      restaurantCount: json['restaurantCount'] ?? 0,
      courierCount: json['courierCount'] ?? 0,
      adminCount: json['adminCount'] ?? 0,
      revenueTimeSeries:
          (json['revenueTimeSeries'] as List<dynamic>?)
              ?.map((e) => Map<String, dynamic>.from(e as Map))
              .toList() ??
          [],
      dailyOrdersTimeSeries:
          (json['dailyOrdersTimeSeries'] as List<dynamic>?)
              ?.map((e) => Map<String, dynamic>.from(e as Map))
              .toList() ??
          [],
      ordersByStatus: json['ordersByStatus'] is Map
          ? (json['ordersByStatus'] as Map<dynamic, dynamic>).map(
              (key, value) => MapEntry(key.toString(), value as int),
            )
          : {},
      topRestaurants:
          (json['topRestaurants'] as List<dynamic>?)
              ?.map((e) => Map<String, dynamic>.from(e as Map))
              .toList() ??
          [],
    );
  }
}

class RestaurantStatistics {
  final double totalRevenue; // in groszy
  final int totalOrders;
  final int activeOrders;
  final int completedOrders;
  final int totalDeliveries;
  final double deliverySuccessRate;
  final double averageOrderValue;
  final List<Map<String, dynamic>> popularMealPlans;
  final List<Map<String, dynamic>> revenueTimeSeries;
  final List<Map<String, dynamic>> dailyOrdersTimeSeries;
  final int totalClients;
  final int totalMealPlans;
  final Map<String, int> ordersByStatus;

  RestaurantStatistics({
    required this.totalRevenue,
    required this.totalOrders,
    required this.activeOrders,
    required this.completedOrders,
    required this.totalDeliveries,
    required this.deliverySuccessRate,
    required this.averageOrderValue,
    required this.popularMealPlans,
    required this.revenueTimeSeries,
    required this.dailyOrdersTimeSeries,
    required this.totalClients,
    required this.totalMealPlans,
    required this.ordersByStatus,
  });

  factory RestaurantStatistics.fromJson(Map<String, dynamic> json) {
    return RestaurantStatistics(
      totalRevenue: (json['totalRevenue'] ?? 0).toDouble(),
      totalOrders: json['totalOrders'] ?? 0,
      activeOrders: json['activeOrders'] ?? 0,
      completedOrders: json['completedOrders'] ?? 0,
      totalDeliveries: json['totalDeliveries'] ?? 0,
      deliverySuccessRate: (json['deliverySuccessRate'] ?? 0).toDouble(),
      averageOrderValue: (json['averageOrderValue'] ?? 0).toDouble(),
      popularMealPlans:
          (json['popularMealPlans'] as List<dynamic>?)
              ?.map((e) => Map<String, dynamic>.from(e as Map))
              .toList() ??
          [],
      revenueTimeSeries:
          (json['revenueTimeSeries'] as List<dynamic>?)
              ?.map((e) => Map<String, dynamic>.from(e as Map))
              .toList() ??
          [],
      dailyOrdersTimeSeries:
          (json['dailyOrdersTimeSeries'] as List<dynamic>?)
              ?.map((e) => Map<String, dynamic>.from(e as Map))
              .toList() ??
          [],
      totalClients: json['totalClients'] ?? 0,
      totalMealPlans: json['totalMealPlans'] ?? 0,
      ordersByStatus: json['ordersByStatus'] is Map
          ? (json['ordersByStatus'] as Map<dynamic, dynamic>).map(
              (key, value) => MapEntry(key.toString(), value as int),
            )
          : {},
    );
  }
}

class StatisticsService extends ChangeNotifier {
  final ApiService _apiClient;

  Statistics? _adminStatistics;
  Statistics? get adminStatistics => _adminStatistics;

  RestaurantStatistics? _restaurantStatistics;
  RestaurantStatistics? get restaurantStatistics => _restaurantStatistics;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool get hasError => _errorMessage != null;

  StatisticsService(this._apiClient);

  Future<void> fetchAdminStatistics({
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    _adminStatistics = null;
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      String url = '/api/statistics';
      final params = <String, String>{};
      if (startDate != null) {
        params['startDate'] = startDate.toIso8601String().split('T')[0];
      }
      if (endDate != null) {
        params['endDate'] = endDate.toIso8601String().split('T')[0];
      }

      if (params.isNotEmpty) {
        url += '?${Uri(queryParameters: params).query}';
      }

      final response = await _apiClient.get(url);

      final data = jsonDecode(response.body);
      _adminStatistics = Statistics.fromJson(data);
    } catch (e) {
      _errorMessage = UIErrorHandler.mapExceptionToMessage(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchRestaurantStatistics(
    String restaurantId, {
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    _restaurantStatistics = null;
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      String url = '$restaurantId/statistics';
      final params = <String, String>{};
      if (startDate != null) {
        params['startDate'] = startDate.toIso8601String().split('T')[0];
      }
      if (endDate != null) {
        params['endDate'] = endDate.toIso8601String().split('T')[0];
      }

      if (params.isNotEmpty) {
        url += '?${Uri(queryParameters: params).query}';
      }

      final response = await _apiClient.get(url);

      final data = jsonDecode(response.body);
      _restaurantStatistics = RestaurantStatistics.fromJson(data);
    } catch (e) {
      _errorMessage = UIErrorHandler.mapExceptionToMessage(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearCache() {
    _adminStatistics = null;
    _restaurantStatistics = null;
    clearError();
  }

  void clearAdminStatistics() {
    _adminStatistics = null;
    clearError();
  }

  void clearRestaurantStatistics() {
    _restaurantStatistics = null;
    clearError();
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}
