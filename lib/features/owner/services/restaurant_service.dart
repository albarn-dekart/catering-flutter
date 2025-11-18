import 'package:catering_flutter/features/authentication/models/user.dart';
import 'package:flutter/foundation.dart';
import 'package:catering_flutter/core/api_service.dart';
import 'package:catering_flutter/features/owner/models/restaurant_model.dart';
import 'package:http/http.dart' as http;

class RestaurantService extends ChangeNotifier {
  final ApiService _apiService;

  Restaurant? _currentRestaurant;
  List<Restaurant> _restaurants = [];
  bool _isLoading = false;
  String? _errorMessage;

  RestaurantService(this._apiService);

  Restaurant? get currentRestaurant => _currentRestaurant;
  set currentRestaurant(Restaurant? restaurant) {
    _currentRestaurant = restaurant;
    notifyListeners();
  }

  List<Restaurant> get restaurants => _restaurants;
  bool get isLoading => _isLoading;
  bool get hasError => _errorMessage != null;
  String? get errorMessage => _errorMessage;

  Future<void> fetchAllRestaurants() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _restaurants = await _apiService.getCollection<Restaurant>(
        'restaurants',
        fromJson: Restaurant.fromJson,
      );
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deleteRestaurant(int id) async {
    try {
      await _apiService.delete('restaurants/$id');
    } catch (e) {
      rethrow;
    }
  }

  Future<void> getCurrentUserRestaurant() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final user = await _apiService.get<User>('me', fromJson: User.fromJson);
      if (user.restaurant != null) {
        _currentRestaurant = user.restaurant;
      } else {
        _errorMessage = 'No restaurant found for the current user.';
      }
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getRestaurantById(int id) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _currentRestaurant = await _apiService.get<Restaurant>(
        'restaurants/$id',
        fromJson: Restaurant.fromJson,
      );
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<Restaurant> updateRestaurant(Restaurant restaurant) async {
    try {
      return await _apiService.put<Restaurant>(
        'restaurants/${restaurant.id}',
        restaurant.toJson(),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Restaurant> updateRestaurantImage(
    int restaurantId,
    Uint8List imageBytes,
    String imageName,
  ) async {
    try {
      final file = http.MultipartFile.fromBytes(
        'file',
        imageBytes,
        filename: imageName,
      );
      return await _apiService.postMultipart<Restaurant>(
        'restaurants/$restaurantId/image',
        {'file': file},
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Restaurant> createRestaurant(Restaurant restaurant) async {
    try {
      return await _apiService.post<Restaurant>(
        'restaurants',
        restaurant.toJson(),
      );
    } catch (e) {
      rethrow;
    }
  }

  void clearStatus() {
    _errorMessage = null;
    notifyListeners();
  }
}
