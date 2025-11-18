import 'package:flutter/foundation.dart';
import 'package:catering_flutter/core/api_service.dart';
import 'package:catering_flutter/features/authentication/services/auth_service.dart';
import 'package:catering_flutter/features/customer/models/order_model.dart';
import 'package:catering_flutter/features/customer/models/order_item_model.dart';
import 'package:catering_flutter/features/customer/models/create_order_item_request_model.dart';
import 'package:catering_flutter/features/customer/models/create_order_request_model.dart';

class OrderService extends ChangeNotifier {
  final ApiService _apiService;

  Order? _createdOrder;
  List<Order> _orders = [];
  Order? _orderDetails;
  bool _isLoading = false;
  String? _errorMessage;

  OrderService({
    required ApiService apiService,
    required AuthService authService,
  }) : _apiService = apiService;

  Order? get createdOrder => _createdOrder;
  bool get isOrderCreated => _createdOrder != null;
  List<Order> get orders => _orders;
  Order? get orderDetails => _orderDetails;
  bool get isLoading => _isLoading;
  bool get hasError => _errorMessage != null;
  String? get errorMessage => _errorMessage;

  Future<void> getMyOrders() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _orders = await _apiService.getCollection<Order>(
        'orders',
        fromJson: Order.fromJson,
      );
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> createOrder({
    required List<OrderItem> orderItems,
    required int restaurantId,
    required DateTime deliveryStartDate,
    required DateTime deliveryEndDate,
    required List<String> deliveryDays,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    _createdOrder = null;
    notifyListeners();

    try {
      final createOrderItemRequests = orderItems
          .map(
            (item) => CreateOrderItemRequestModel(
              mealPlanId: item.mealPlan.id,
              quantity: item.quantity,
            ),
          )
          .toList();

      final createOrderRequest = CreateOrderRequestModel(
        orderItems: createOrderItemRequests,
        restaurantId: restaurantId,
        deliveryStartDate: deliveryStartDate,
        deliveryEndDate: deliveryEndDate,
        deliveryDays: deliveryDays,
      );
      _createdOrder = await _apiService.post<Order>(
        'orders',
        createOrderRequest.toJson(),
      );
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getOrderDetails(int orderId) async {
    _isLoading = true;
    _errorMessage = null;
    _orderDetails = null;
    notifyListeners();

    try {
      final endpoint = 'orders/$orderId';
      _orderDetails = await _apiService.get<Order>(
        endpoint,
        fromJson: Order.fromJson,
      );
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> cancelOrder(int orderId) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      await _apiService.delete('orders/$orderId');
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearOrderCreatedStatus() {
    _createdOrder = null;
    _errorMessage = null;
    notifyListeners();
  }
}
