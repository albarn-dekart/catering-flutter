import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:catering_flutter/core/api_exception.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';
import 'package:catering_flutter/core/api_client.dart';

class PopularMealPlan {
  final String id;
  final String name;
  final String? description;
  final double price;
  final String? imageUrl;
  final String restaurantId;
  final String restaurantName;
  final int orderCount;

  PopularMealPlan({
    required this.id,
    required this.name,
    this.description,
    required this.price,
    this.imageUrl,
    required this.restaurantId,
    required this.restaurantName,
    required this.orderCount,
  });

  factory PopularMealPlan.fromJson(Map<String, dynamic> json) {
    return PopularMealPlan(
      id: json['id'].toString(),
      name: json['name'] as String,
      description: json['description'] as String?,
      price: (json['price'] ?? 0).toDouble() / 100,
      imageUrl: json['imageUrl'] as String?,
      restaurantId: json['restaurantId'].toString(),
      restaurantName: json['restaurantName'] as String,
      orderCount: json['orderCount'] as int,
    );
  }
}

class FeaturedRestaurant {
  final String id;
  final String name;
  final String? description;
  final String? imageUrl;
  final int orderCount;

  FeaturedRestaurant({
    required this.id,
    required this.name,
    this.description,
    this.imageUrl,
    required this.orderCount,
  });

  factory FeaturedRestaurant.fromJson(Map<String, dynamic> json) {
    return FeaturedRestaurant(
      id: json['id'].toString(),
      name: json['name'] as String,
      description: json['description'] as String?,
      imageUrl: json['imageUrl'] as String?,
      orderCount: json['orderCount'] as int,
    );
  }
}

class HomeData {
  final List<PopularMealPlan> popularMealPlans;
  final List<FeaturedRestaurant> featuredRestaurants;

  HomeData({required this.popularMealPlans, required this.featuredRestaurants});

  factory HomeData.fromJson(Map<String, dynamic> json) {
    return HomeData(
      popularMealPlans:
          (json['popularMealPlans'] as List<dynamic>?)
              ?.map((e) => PopularMealPlan.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      featuredRestaurants:
          (json['featuredRestaurants'] as List<dynamic>?)
              ?.map(
                (e) => FeaturedRestaurant.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          [],
    );
  }
}

class HomeService extends ChangeNotifier {
  final ApiClient _apiClient;
  HomeData? _homeData;
  HomeData? get homeData => _homeData;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool get hasError => _errorMessage != null;

  HomeService(this._apiClient);

  Future<void> fetchHomeData() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _apiClient.get('/api/home');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _homeData = HomeData.fromJson(data);
      } else {
        throw ApiException('Failed to load home data: ${response.statusCode}');
      }
    } catch (e) {
      _errorMessage = UIErrorHandler.mapExceptionToMessage(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearCache() {
    _homeData = null;
    notifyListeners();
  }
}
