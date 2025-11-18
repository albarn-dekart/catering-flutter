import 'package:flutter/foundation.dart';
import 'package:catering_flutter/core/api_service.dart';
import 'package:catering_flutter/features/driver/models/delivery_model.dart';

class DeliveryService extends ChangeNotifier {
  final ApiService _apiService;

  List<Delivery> _deliveries = [];
  bool _isLoading = false;
  String? _errorMessage;

  DeliveryService({required ApiService apiService}) : _apiService = apiService;

  List<Delivery> get deliveries => _deliveries;
  bool get isLoading => _isLoading;
  bool get hasError => _errorMessage != null;
  String? get errorMessage => _errorMessage;

  Future<void> fetchDriverDeliveries() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _deliveries = await _apiService.getCollection<Delivery>(
        'me/deliveries',
        fromJson: Delivery.fromJson,
      );
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchRestaurantDeliveries(int restaurantId) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _deliveries = await _apiService.getCollection<Delivery>(
        'deliveries?restaurant=$restaurantId',
        fromJson: Delivery.fromJson,
      );
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateDeliveryStatus(
    int deliveryId,
    String status, {
    int? driverId,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final Map<String, dynamic> data = {'status': status};
      if (driverId != null) {
        data['driver'] = '/api/users/$driverId';
      } else {
        // If driverId is explicitly null, it means unassigning the driver
        data['driver'] = null;
      }
      await _apiService.patch<dynamic>('deliveries/$deliveryId', data);
      // Refresh deliveries after updating status
      await fetchDriverDeliveries();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
