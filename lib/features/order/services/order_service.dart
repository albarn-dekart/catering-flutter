import 'package:intl/intl.dart';
import 'package:catering_flutter/graphql/orders.graphql.dart';
import 'package:catering_flutter/graphql/schema.graphql.dart';
import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:catering_flutter/core/api_exception.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';

typedef Order = Query$GetOrders$orders$edges$node;
typedef OrderDetails = Query$GetOrder$order;
typedef CreatedOrder = Mutation$CreateOrder$createOrder$order;

class OrderService extends ChangeNotifier {
  final GraphQLClient _client;

  List<Order> _orders = [];
  List<Order> get orders => _orders;

  OrderDetails? _currentOrder;
  OrderDetails? get currentOrder => _currentOrder;

  CreatedOrder? _createdOrder;
  CreatedOrder? get createdOrder => _createdOrder;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool get hasError => _errorMessage != null;

  OrderService(this._client);

  Future<void> fetchAllOrders() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final options = QueryOptions(
        document: documentNodeQueryGetOrders,
        variables: Variables$Query$GetOrders(first: 100).toJson(),
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
      }
    } catch (e) {
      _errorMessage = UIErrorHandler.mapExceptionToMessage(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getMyOrders() async {
    await fetchAllOrders();
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
                  (date) => Input$DeliveryNestedInput(
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
        final newOrder = Query$GetOrders$orders$edges$node(
          id: _createdOrder!.id,
          status: _createdOrder!.status,
          total: _createdOrder!.total,
          customer: _createdOrder!.customer != null
              ? Query$GetOrders$orders$edges$node$customer(
                  id: _createdOrder!.customer!.id,
                  email: _createdOrder!.customer!.email,
                  $__typename: 'User',
                )
              : null,
          restaurant: _createdOrder!.restaurant != null
              ? Query$GetOrders$orders$edges$node$restaurant(
                  id: _createdOrder!.restaurant!.id,
                  name: _createdOrder!.restaurant!.name,
                  $__typename: 'Restaurant',
                )
              : null,
          orderItems: _createdOrder!.orderItems != null
              ? Query$GetOrders$orders$edges$node$orderItems(
                  edges: _createdOrder!.orderItems!.edges?.map((e) {
                    if (e?.node == null) return null;
                    return Query$GetOrders$orders$edges$node$orderItems$edges(
                      node: Query$GetOrders$orders$edges$node$orderItems$edges$node(
                        id: e!.node!.id,
                        quantity: e.node!.quantity,
                        mealPlan:
                            Query$GetOrders$orders$edges$node$orderItems$edges$node$mealPlan(
                              id: e.node!.mealPlan.id,
                              name: e.node!.mealPlan.name,
                              price: e.node!.mealPlan.price,
                              $__typename: 'MealPlan',
                            ),
                        $__typename: 'OrderItem',
                      ),
                      $__typename: 'OrderItemEdge',
                    );
                  }).toList(),
                  $__typename: 'OrderItemConnection',
                )
              : null,
          deliveries: _createdOrder!.deliveries != null
              ? Query$GetOrders$orders$edges$node$deliveries(
                  edges: _createdOrder!.deliveries!.edges?.map((e) {
                    if (e?.node == null) return null;
                    return Query$GetOrders$orders$edges$node$deliveries$edges(
                      node: Query$GetOrders$orders$edges$node$deliveries$edges$node(
                        id: e!.node!.id,
                        status: e.node!.status,
                        deliveryDate: e.node!.deliveryDate,
                        driver: e.node!.driver != null
                            ? Query$GetOrders$orders$edges$node$deliveries$edges$node$driver(
                                id: e.node!.driver!.id,
                                email: e.node!.driver!.email,
                                $__typename: 'User',
                              )
                            : null,
                        $__typename: 'Delivery',
                      ),
                      $__typename: 'DeliveryEdge',
                    );
                  }).toList(),
                  $__typename: 'DeliveryConnection',
                )
              : null,
          $__typename: 'Order',
        );
        _orders.add(newOrder);
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
    String orderId,
    Enum$OrderStatus status,
  ) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final options = MutationOptions(
        document: documentNodeMutationUpdateOrder,
        variables: Variables$Mutation$UpdateOrder(
          input: Input$updateOrderInput(id: orderId, status: status),
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
          _orders[index] = Query$GetOrders$orders$edges$node(
            id: _orders[index].id,
            status: updatedOrder.status,
            total: _orders[index].total,
            customer: _orders[index].customer,
            restaurant: _orders[index].restaurant,
            orderItems: _orders[index].orderItems,
            deliveries: _orders[index].deliveries,
            $__typename: _orders[index].$__typename,
          );
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
