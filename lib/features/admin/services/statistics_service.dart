import 'dart:convert';
import 'package:catering_flutter/core/api_client.dart';
import 'package:flutter/foundation.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';

class Statistics {
  final double totalRevenue;
  final int totalOrders;
  final int totalUsers;
  final int activeOrders;
  final double averageOrderValue;
  final int customerCount;
  final int restaurantCount;
  final int driverCount;
  final int adminCount;
  final List<Map<String, dynamic>> revenueTimeSeries;
  final Map<String, int> ordersByStatus;

  Statistics({
    required this.totalRevenue,
    required this.totalOrders,
    required this.totalUsers,
    required this.activeOrders,
    required this.averageOrderValue,
    required this.customerCount,
    required this.restaurantCount,
    required this.driverCount,
    required this.adminCount,
    required this.revenueTimeSeries,
    required this.ordersByStatus,
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
      driverCount: json['driverCount'] ?? 0,
      adminCount: json['adminCount'] ?? 0,
      revenueTimeSeries:
          (json['revenueTimeSeries'] as List<dynamic>?)
              ?.map((e) => Map<String, dynamic>.from(e as Map))
              .toList() ??
          [],
      ordersByStatus:
          (json['ordersByStatus'] as Map<String, dynamic>?)?.map(
            (key, value) => MapEntry(key, value as int),
          ) ??
          {},
    );
  }
}

class RestaurantStatistics {
  final double totalRevenue;
  final int totalOrders;
  final int activeOrders;
  final int completedOrders;
  final int totalDeliveries;
  final double deliverySuccessRate;
  final List<Map<String, dynamic>> popularMealPlans;
  final List<Map<String, dynamic>> revenueTimeSeries;

  RestaurantStatistics({
    required this.totalRevenue,
    required this.totalOrders,
    required this.activeOrders,
    required this.completedOrders,
    required this.totalDeliveries,
    required this.deliverySuccessRate,
    required this.popularMealPlans,
    required this.revenueTimeSeries,
  });

  factory RestaurantStatistics.fromJson(Map<String, dynamic> json) {
    return RestaurantStatistics(
      totalRevenue: (json['totalRevenue'] ?? 0).toDouble(),
      totalOrders: json['totalOrders'] ?? 0,
      activeOrders: json['activeOrders'] ?? 0,
      completedOrders: json['completedOrders'] ?? 0,
      totalDeliveries: json['totalDeliveries'] ?? 0,
      deliverySuccessRate: (json['deliverySuccessRate'] ?? 0).toDouble(),
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
    );
  }
}

class StatisticsService extends ChangeNotifier {
  final ApiClient _apiClient;

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

  Future<void> fetchAdminStatistics() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _apiClient.get('/api/statistics');

      final data = jsonDecode(response.body);
      _adminStatistics = Statistics.fromJson(data);
    } catch (e) {
      _errorMessage = UIErrorHandler.mapExceptionToMessage(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchRestaurantStatistics(String restaurantId) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _apiClient.get('$restaurantId/statistics');

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
    notifyListeners();
  }
}
