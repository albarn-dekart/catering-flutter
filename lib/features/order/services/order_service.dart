import 'package:intl/intl.dart';
import 'package:catering_flutter/graphql/orders.graphql.dart';
import 'package:catering_flutter/graphql/schema.graphql.dart';
import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:catering_flutter/core/services/api_service.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';

typedef Order = Fragment$OrderSummary;
typedef OrderDetails = Fragment$OrderDetails;

class OrderService extends ChangeNotifier {
  final GraphQLClient _client;

  List<Order> _orders = [];
  List<Order> get orders => _orders;

  OrderDetails? _currentOrder;
  OrderDetails? get currentOrder => _currentOrder;

  OrderDetails? _createdOrder;
  OrderDetails? get createdOrder => _createdOrder;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool get hasError => _errorMessage != null;

  String? _endCursor;
  bool _hasNextPage = false;
  bool get hasNextPage => _hasNextPage;
  bool _isFetchingMore = false;
  bool get isFetchingMore => _isFetchingMore;

  OrderService(this._client);

  String? _currentUserId;
  String? _currentRestaurantIri;
  Enum$OrderStatus? _currentStatusFilter;
  String? _currentSearchQuery;

  Future<void> fetchAllOrders({
    Enum$OrderStatus? status,
    String? searchQuery,
  }) async {
    _currentUserId = null;
    _currentRestaurantIri = null;
    _currentStatusFilter = status;
    _currentSearchQuery = searchQuery;

    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final options = QueryOptions(
        document: documentNodeQueryGetOrders,
        variables: Variables$Query$GetOrders(
          first: 20,
          status: status?.name,
          search: searchQuery,
        ).toJson(),
        fetchPolicy: FetchPolicy.networkOnly,
      );
      final result = await _client.query(options);

      if (result.hasException) {
        throw ApiException(result.exception.toString());
      }

      final data = Query$GetOrders.fromJson(result.data!);
      if (data.orders?.edges != null) {
        _orders = data.orders!.edges!
            .map((e) => e?.node)
            .whereType<Order>()
            .toList();
        _endCursor = data.orders?.pageInfo.endCursor;
        _hasNextPage = data.orders?.pageInfo.hasNextPage ?? false;
      }
    } catch (e) {
      _errorMessage = UIErrorHandler.mapExceptionToMessage(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchRestaurantOrders(
    String restaurantIri, {
    Enum$OrderStatus? status,
    String? searchQuery,
  }) async {
    _currentUserId = null;
    _currentRestaurantIri = restaurantIri;
    _currentStatusFilter = status;
    _currentSearchQuery = searchQuery;

    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final options = QueryOptions(
        document: documentNodeQueryGetOrdersByRestaurant,
        variables: Variables$Query$GetOrdersByRestaurant(
          restaurantId: restaurantIri,
          first: 20,
          status: status?.name,
          search: searchQuery,
        ).toJson(),
        fetchPolicy: FetchPolicy.networkOnly,
      );
      final result = await _client.query(options);

      if (result.hasException) {
        throw ApiException(result.exception.toString());
      }

      final data = Query$GetOrdersByRestaurant.fromJson(result.data!);
      if (data.restaurant?.orders?.edges != null) {
        _orders = data.restaurant!.orders!.edges!
            .map((e) => e?.node)
            .whereType<Order>()
            .toList();
        _endCursor = data.restaurant?.orders?.pageInfo.endCursor;
        _hasNextPage = data.restaurant?.orders?.pageInfo.hasNextPage ?? false;
      }
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadMoreOrders() async {
    if (_isFetchingMore || !_hasNextPage || _endCursor == null) return;

    _isFetchingMore = true;
    notifyListeners();

    try {
      final QueryOptions options;
      if (_currentUserId != null) {
        options = QueryOptions(
          document: documentNodeQueryGetUserOrders,
          variables: Variables$Query$GetUserOrders(
            id: _currentUserId!,
            first: 20,
            after: _endCursor,
            status: _currentStatusFilter?.name,
          ).toJson(),
          fetchPolicy: FetchPolicy.networkOnly,
        );
      } else if (_currentRestaurantIri != null) {
        options = QueryOptions(
          document: documentNodeQueryGetOrdersByRestaurant,
          variables: Variables$Query$GetOrdersByRestaurant(
            restaurantId: _currentRestaurantIri!,
            first: 20,
            after: _endCursor,
            status: _currentStatusFilter?.name,
            search: _currentSearchQuery,
          ).toJson(),
          fetchPolicy: FetchPolicy.networkOnly,
        );
      } else {
        options = QueryOptions(
          document: documentNodeQueryGetOrders,
          variables: Variables$Query$GetOrders(
            first: 20,
            after: _endCursor,
            status: _currentStatusFilter?.name,
            search: _currentSearchQuery,
          ).toJson(),
          fetchPolicy: FetchPolicy.networkOnly,
        );
      }

      final result = await _client.query(options);

      if (result.hasException) {
        throw ApiException(result.exception.toString());
      }

      if (_currentUserId != null) {
        final data = Query$GetUserOrders.fromJson(result.data!);
        if (data.user?.orders?.edges != null) {
          final newOrders = data.user!.orders!.edges!
              .map((e) => e?.node)
              .whereType<Order>()
              .toList();
          _orders = [..._orders, ...newOrders];
          _endCursor = data.user?.orders?.pageInfo.endCursor;
          _hasNextPage = data.user?.orders?.pageInfo.hasNextPage ?? false;
        }
      } else if (_currentRestaurantIri != null) {
        final data = Query$GetOrdersByRestaurant.fromJson(result.data!);
        if (data.restaurant?.orders?.edges != null) {
          final newOrders = data.restaurant!.orders!.edges!
              .map((e) => e?.node)
              .whereType<Order>()
              .toList();
          _orders = [..._orders, ...newOrders];
          _endCursor = data.restaurant?.orders?.pageInfo.endCursor;
          _hasNextPage = data.restaurant?.orders?.pageInfo.hasNextPage ?? false;
        }
      } else {
        final data = Query$GetOrders.fromJson(result.data!);
        if (data.orders?.edges != null) {
          final newOrders = data.orders!.edges!
              .map((e) => e?.node)
              .whereType<Order>()
              .toList();
          _orders = [..._orders, ...newOrders];
          _endCursor = data.orders?.pageInfo.endCursor;
          _hasNextPage = data.orders?.pageInfo.hasNextPage ?? false;
        }
      }
    } catch (e) {
      _errorMessage = UIErrorHandler.mapExceptionToMessage(e);
    } finally {
      _isFetchingMore = false;
      notifyListeners();
    }
  }

  Future<void> getMyOrders(String userIri, {Enum$OrderStatus? status}) async {
    _currentUserId = userIri;
    // Store the status filter so generic methods like loadMoreOrders can use it
    _currentStatusFilter = status;

    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final options = QueryOptions(
        document: documentNodeQueryGetUserOrders,
        variables: Variables$Query$GetUserOrders(
          id: userIri,
          first: 20,
          status: status?.name,
        ).toJson(),
        fetchPolicy: FetchPolicy.networkOnly,
      );
      final result = await _client.query(options);

      if (result.hasException) {
        throw ApiException(result.exception.toString());
      }

      final data = Query$GetUserOrders.fromJson(result.data!);
      if (data.user?.orders?.edges != null) {
        _orders = data.user!.orders!.edges!
            .map((e) => e?.node)
            .whereType<Order>()
            .toList();
        _endCursor = data.user?.orders?.pageInfo.endCursor;
        _hasNextPage = data.user?.orders?.pageInfo.hasNextPage ?? false;
      } else {
        _orders = [];
        _hasNextPage = false;
      }
    } catch (e) {
      _errorMessage = UIErrorHandler.mapExceptionToMessage(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getOrderById(String id) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final options = QueryOptions(
        document: documentNodeQueryGetOrder,
        variables: Variables$Query$GetOrder(id: id).toJson(),
        fetchPolicy: FetchPolicy.networkOnly,
      );
      final result = await _client.query(options);

      if (result.hasException) {
        throw ApiException(result.exception.toString());
      }

      _currentOrder = Query$GetOrder.fromJson(result.data!).order;
    } catch (e) {
      _errorMessage = UIErrorHandler.mapExceptionToMessage(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> createOrder({
    required List<Map<String, dynamic>> orderItems,
    required String restaurantIri,
    required String customerIri,
    required List<DateTime> deliveryDates,
    required String deliveryFirstName,
    required String deliveryLastName,
    required String deliveryPhoneNumber,
    required String deliveryStreet,
    String? deliveryApartment,
    required String deliveryCity,
    required String deliveryZipCode,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final options = MutationOptions(
        document: documentNodeMutationCreateOrder,
        variables: Variables$Mutation$CreateOrder(
          input: Input$createOrderInput(
            status: Enum$OrderStatus.Unpaid,
            customer: customerIri,
            restaurant: restaurantIri,
            total: 0,
            createdAt: DateTime.now().toIso8601String(),
            orderItems: orderItems
                .map(
                  (e) => Input$OrderItemNestedInput(
                    mealPlan: e['id'],
                    quantity: e['quantity'],
                  ),
                )
                .toList(),
            deliveries: deliveryDates
                .map(
                  (date) => Input$createDeliveryNestedInput(
                    deliveryDate: DateFormat('yyyy-MM-dd').format(date),
                    status: Enum$DeliveryStatus.Pending,
                  ),
                )
                .toList(),
            deliveryFirstName: deliveryFirstName,
            deliveryLastName: deliveryLastName,
            deliveryPhoneNumber: deliveryPhoneNumber,
            deliveryStreet: deliveryStreet,
            deliveryApartment: deliveryApartment,
            deliveryCity: deliveryCity,
            deliveryZipCode: deliveryZipCode,
          ),
        ).toJson(),
      );

      final result = await _client.mutate(options);

      if (result.hasException) {
        throw ApiException(result.exception.toString());
      }

      _createdOrder = Mutation$CreateOrder.fromJson(
        result.data!,
      ).createOrder?.order;

      if (_createdOrder != null) {
        // Since Fragment$OrderDetails (CreatedOrder) implements Fragment$OrderSummary (Order),
        // we can add it directly to the list.
        _orders.add(_createdOrder!);
      }
    } catch (e) {
      _errorMessage = UIErrorHandler.mapExceptionToMessage(e);
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateOrderStatus(
    String orderIri,
    Enum$OrderStatus status,
  ) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final options = MutationOptions(
        document: documentNodeMutationUpdateOrder,
        variables: Variables$Mutation$UpdateOrder(
          input: Input$updateOrderInput(id: orderIri, status: status),
        ).toJson(),
      );

      final result = await _client.mutate(options);

      if (result.hasException) {
        throw ApiException(result.exception.toString());
      }

      // Extract the updated order from the mutation response
      final updatedOrder = Mutation$UpdateOrder.fromJson(
        result.data!,
      ).updateOrder?.order;

      if (updatedOrder != null) {
        // Find and update the order in the local list
        final index = _orders.indexWhere((o) => o.id == updatedOrder.id);
        if (index != -1) {
          // Update the status in the existing order
          // Since updatedOrder is OrderDetails which implements OrderSummary, we can just replace it
          _orders[index] = updatedOrder;
        }
      }
    } catch (e) {
      _errorMessage = UIErrorHandler.mapExceptionToMessage(e);
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deleteOrder(String id) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final options = MutationOptions(
        document: documentNodeMutationDeleteOrder,
        variables: Variables$Mutation$DeleteOrder(
          input: Input$deleteOrderInput(id: id),
        ).toJson(),
      );
      final result = await _client.mutate(options);

      if (result.hasException) {
        throw ApiException(result.exception.toString());
      }

      _orders.removeWhere((o) => o.id == id);
    } catch (e) {
      _errorMessage = UIErrorHandler.mapExceptionToMessage(e);
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
