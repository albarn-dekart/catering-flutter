import 'package:flutter/foundation.dart';
import 'package:catering_flutter/core/api_service.dart';
import 'package:catering_flutter/features/owner/models/meal_plan_model.dart';
import 'package:http/http.dart' as http;

class MealPlanService extends ChangeNotifier {
  final ApiService _apiService;

  bool _isLoading = false;
  String? _errorMessage;
  bool _isSuccess = false;
  List<MealPlan> _mealPlans = [];
  MealPlan? _mealPlanDetails;

  MealPlanService({required ApiService apiService}) : _apiService = apiService;

  bool get isLoading => _isLoading;
  bool get hasError => _errorMessage != null;
  String? get errorMessage => _errorMessage;
  bool get isSuccess => _isSuccess;
  List<MealPlan> get mealPlans => _mealPlans;
  MealPlan? get mealPlanDetails => _mealPlanDetails;

  Future<void> getMealPlans(int restaurantId) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _mealPlans = await _apiService.getCollection<MealPlan>(
        'restaurants/$restaurantId/meal_plans',
        fromJson: MealPlan.fromJson,
      );
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> createMealPlan({
    required int restaurantId,
    required MealPlan mealPlan,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    _isSuccess = false;
    notifyListeners();

    try {
      await _apiService.post<MealPlan>(
        'restaurants/$restaurantId/meal_plans',
        mealPlan.toJson(),
      );
      _isSuccess = true;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateMealPlan({required MealPlan mealPlan}) async {
    _isLoading = true;
    _errorMessage = null;
    _isSuccess = false;
    notifyListeners();

    try {
      await _apiService.put<MealPlan>(
        'meal_plans/${mealPlan.id}',
        mealPlan.toJson(),
      );
      _isSuccess = true;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deleteMealPlan(int mealPlanId) async {
    _isLoading = true;
    _errorMessage = null;
    _isSuccess = false;
    notifyListeners();

    try {
      await _apiService.delete('meal_plans/$mealPlanId');
      _isSuccess = true;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getMealPlanById(int mealPlanId) async {
    _isLoading = true;
    _errorMessage = null;
    _mealPlanDetails = null;
    notifyListeners();

    try {
      _mealPlanDetails = await _apiService.get<MealPlan>(
        'meal_plans/$mealPlanId',
        fromJson: MealPlan.fromJson,
      );
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateMealPlanImage(
    int mealPlanId,
    Uint8List imageBytes,
    String imageName,
  ) async {
    _isLoading = true;
    _errorMessage = null;
    _isSuccess = false;
    notifyListeners();

    try {
      final file = http.MultipartFile.fromBytes(
        'file',
        imageBytes,
        filename: imageName,
      );
      await _apiService.postMultipart<MealPlan>(
        'meal_plans/$mealPlanId/image',
        {'file': file},
      );
      _isSuccess = true;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearStatus() {
    _errorMessage = null;
    _isSuccess = false;
    notifyListeners();
  }
}
