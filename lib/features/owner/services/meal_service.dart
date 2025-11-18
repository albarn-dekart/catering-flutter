import 'package:flutter/foundation.dart';
import 'package:catering_flutter/core/api_service.dart';
import 'package:catering_flutter/features/owner/models/meal_model.dart';
import 'package:http/http.dart' as http;

class MealService extends ChangeNotifier {
  final ApiService _apiService;

  bool _isLoading = false;
  String? _errorMessage;
  bool _isSuccess = false;
  List<Meal> _meals = [];

  MealService({required ApiService apiService}) : _apiService = apiService;

  bool get isLoading => _isLoading;
  bool get hasError => _errorMessage != null;
  String? get errorMessage => _errorMessage;
  bool get isSuccess => _isSuccess;
  List<Meal> get meals => _meals;

  Future<List<Meal>> getMealPlanMeals(int mealPlanId) async {
    return await _apiService.getCollection<Meal>(
      'meal_plans/$mealPlanId/meals',
      fromJson: Meal.fromJson,
    );
  }

  Future<void> getMeals(int restaurantId) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _meals = await _apiService.getCollection<Meal>(
        'restaurants/$restaurantId/meals',
        fromJson: Meal.fromJson,
      );
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> createMeal({
    required int restaurantId,
    required Meal meal,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    _isSuccess = false;
    notifyListeners();

    try {
      await _apiService.post<Meal>(
        'restaurants/$restaurantId/meals',
        meal.toJson(),
      );
      _isSuccess = true;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateMeal({required Meal meal}) async {
    _isLoading = true;
    _errorMessage = null;
    _isSuccess = false;
    notifyListeners();

    try {
      await _apiService.put<Meal>('meals/${meal.id}', meal.toJson());
      _isSuccess = true;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deleteMeal(int mealId) async {
    _isLoading = true;
    _errorMessage = null;
    _isSuccess = false;
    notifyListeners();

    try {
      await _apiService.delete('meals/$mealId');
      _isSuccess = true;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateMealImage(
    int mealId,
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
      await _apiService.postMultipart<Meal>('meals/$mealId/image', {
        'file': file,
      });
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
