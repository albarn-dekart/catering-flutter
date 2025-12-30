import 'dart:convert';
import 'package:catering_flutter/core/services/api_service.dart';
import 'package:flutter/foundation.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';

class ProductionPlanItem {
  final String mealName;
  final int count;

  ProductionPlanItem({required this.mealName, required this.count});

  factory ProductionPlanItem.fromJson(Map<String, dynamic> json) {
    return ProductionPlanItem(
      mealName: json['mealName'] as String,
      // Handle both int and string (Doctrine SUM returns string)
      count: json['count'] is int
          ? json['count']
          : int.parse(json['count'].toString()),
    );
  }
}

class ProductionService extends ChangeNotifier {
  final ApiService _apiClient;

  List<ProductionPlanItem> _productionItems = [];
  List<ProductionPlanItem> get productionItems => _productionItems;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool get hasError => _errorMessage != null;

  ProductionService(this._apiClient);

  Future<void> fetchProductionPlan(
    String restaurantId, {
    DateTime? date,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      String url = '/api/restaurants/$restaurantId/production-plan';
      if (date != null) {
        final dateStr = date.toIso8601String().split('T')[0];
        url += '?date=$dateStr';
      }

      final response = await _apiClient.get(url);
      final Map<String, dynamic> data = jsonDecode(response.body);

      if (data['items'] != null) {
        _productionItems = (data['items'] as List)
            .map((item) => ProductionPlanItem.fromJson(item))
            .toList();
      } else {
        _productionItems = [];
      }
    } catch (e) {
      _errorMessage = UIErrorHandler.mapExceptionToMessage(e);
      _productionItems = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clear() {
    _productionItems = [];
    clearError();
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}
