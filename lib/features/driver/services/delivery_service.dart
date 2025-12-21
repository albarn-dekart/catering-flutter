import 'package:catering_flutter/graphql/deliveries.graphql.dart';
import 'package:catering_flutter/graphql/schema.graphql.dart';
import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:catering_flutter/core/services/api_service.dart';

typedef Delivery = Fragment$BasicDeliveryFragment;
typedef DeliveryDetails = Fragment$BasicDeliveryFragment;

class DeliveryService extends ChangeNotifier {
  final GraphQLClient _client;

  List<Delivery> _deliveries = [];
  List<Delivery> get deliveries => _deliveries;

  DeliveryDetails? _currentDelivery;
  DeliveryDetails? get currentDelivery => _currentDelivery;

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

  DeliveryService(this._client);

  Future<void> fetchAllDeliveries() async {
    _isLoading = true;
    _errorMessage = null;
    _deliveries = [];
    notifyListeners();

    try {
      final options = QueryOptions(
        document: documentNodeQueryGetDeliveries,
        variables: Variables$Query$GetDeliveries(first: 20).toJson(),
        fetchPolicy: FetchPolicy.networkOnly,
      );
      final result = await _client.query(options);

      if (result.hasException) {
        throw ApiException(result.exception.toString());
      }

      final data = Query$GetDeliveries.fromJson(result.data!);
      if (data.deliveries?.edges != null) {
        _deliveries = data.deliveries!.edges!
            .map((e) => e?.node)
            .whereType<Delivery>()
            .toList();
      }
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getDeliveryById(String id) async {
    _isLoading = true;
    _errorMessage = null;
    _currentDelivery = null;
    notifyListeners();

    try {
      final options = QueryOptions(
        document: documentNodeQueryGetDelivery,
        variables: Variables$Query$GetDelivery(id: id).toJson(),
        fetchPolicy: FetchPolicy.networkOnly,
      );
      final result = await _client.query(options);

      if (result.hasException) {
        throw ApiException(result.exception.toString());
      }

      _currentDelivery = Query$GetDelivery.fromJson(result.data!).delivery;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Enum$DeliveryStatus? _currentStatusFilter;
  String? _currentSearchQuery;
  Input$DeliveryFilter_order? _currentSortOrder;

  Future<void> fetchRestaurantDeliveries(
    String restaurantIri, {
    Enum$DeliveryStatus? status,
    String? searchQuery,
    Input$DeliveryFilter_order? order,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    _currentStatusFilter = status;
    _currentSearchQuery = searchQuery;
    _currentSortOrder =
        order ?? Input$DeliveryFilter_order(deliveryDate: 'DESC');
    _deliveries = [];
    notifyListeners();

    try {
      final options = QueryOptions(
        document: documentNodeQueryGetDeliveriesByRestaurant,
        variables: Variables$Query$GetDeliveriesByRestaurant(
          restaurantId: restaurantIri,
          first: 20,
          status: status?.name,
          search: searchQuery,
          order: [_currentSortOrder!],
        ).toJson(),
        fetchPolicy: FetchPolicy.networkOnly,
      );
      final result = await _client.query(options);

      if (result.hasException) {
        throw ApiException(result.exception.toString());
      }

      final data = Query$GetDeliveriesByRestaurant.fromJson(result.data!);

      if (data.deliveries?.edges != null) {
        _deliveries = data.deliveries!.edges!
            .map((e) => e?.node)
            .whereType<Fragment$BasicDeliveryFragment>()
            .toList();
        _endCursor = data.deliveries?.pageInfo.endCursor;
        _hasNextPage = data.deliveries?.pageInfo.hasNextPage ?? false;
      }
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadMoreDeliveries({String? restaurantIri}) async {
    if (_isFetchingMore || !_hasNextPage || _endCursor == null) return;

    _isFetchingMore = true;
    notifyListeners();

    try {
      final QueryOptions options;
      if (restaurantIri != null) {
        options = QueryOptions(
          document: documentNodeQueryGetDeliveriesByRestaurant,
          variables: Variables$Query$GetDeliveriesByRestaurant(
            restaurantId: restaurantIri,
            first: 20,
            after: _endCursor,
            status: _currentStatusFilter?.name,
            search: _currentSearchQuery,
            order: [_currentSortOrder!],
          ).toJson(),
          fetchPolicy: FetchPolicy.networkOnly,
        );
      } else {
        options = QueryOptions(
          document: documentNodeQueryGetDeliveries,
          variables: Variables$Query$GetDeliveries(
            first: 20,
            after: _endCursor,
            search: _currentSearchQuery,
          ).toJson(),
          fetchPolicy: FetchPolicy.networkOnly,
        );
      }

      final result = await _client.query(options);

      if (result.hasException) {
        throw ApiException(result.exception.toString());
      }

      if (restaurantIri != null) {
        final data = Query$GetDeliveriesByRestaurant.fromJson(result.data!);
        if (data.deliveries?.edges != null) {
          final newDeliveries = data.deliveries!.edges!
              .map((e) => e?.node)
              .whereType<Fragment$BasicDeliveryFragment>()
              .toList();
          _deliveries.addAll(newDeliveries);
          _endCursor = data.deliveries?.pageInfo.endCursor;
          _hasNextPage = data.deliveries?.pageInfo.hasNextPage ?? false;
        }
      } else {
        final data = Query$GetDeliveries.fromJson(result.data!);
        if (data.deliveries?.edges != null) {
          final newDeliveries = data.deliveries!.edges!
              .map((e) => e?.node)
              .whereType<Delivery>()
              .toList();
          _deliveries.addAll(newDeliveries);
          _endCursor = data.deliveries?.pageInfo.endCursor;
          _hasNextPage = data.deliveries?.pageInfo.hasNextPage ?? false;
        }
      }
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isFetchingMore = false;
      notifyListeners();
    }
  }

  Future<void> updateDeliveryStatus(
    String deliveryId, {
    Enum$DeliveryStatus? status,
    String? driverIri,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final options = MutationOptions(
        document: documentNodeMutationUpdateDelivery,
        variables: Variables$Mutation$UpdateDelivery(
          input: Input$updateDeliveryInput(
            id: deliveryId,
            status: status,
            driver: driverIri,
          ),
        ).toJson(),
      );

      final result = await _client.mutate(options);

      if (result.hasException) {
        throw ApiException(result.exception.toString());
      }

      // Extract the updated delivery from the mutation response
      final updatedDelivery = Mutation$UpdateDelivery.fromJson(
        result.data!,
      ).updateDelivery?.delivery;

      if (updatedDelivery != null) {
        // Update current delivery if currently viewed
        if (_currentDelivery?.id == updatedDelivery.id) {
          _currentDelivery = updatedDelivery;
        }

        // Find and update the delivery in the local list
        final index = _deliveries.indexWhere((d) => d.id == updatedDelivery.id);
        if (index != -1) {
          _deliveries[index] = updatedDelivery;
        }
      }
    } catch (e) {
      _errorMessage = e.toString();
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deleteDelivery(String id) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final options = MutationOptions(
        document: documentNodeMutationDeleteDelivery,
        variables: Variables$Mutation$DeleteDelivery(
          input: Input$deleteDeliveryInput(id: id),
        ).toJson(),
      );
      final result = await _client.mutate(options);

      if (result.hasException) {
        throw ApiException(result.exception.toString());
      }
      _deliveries.removeWhere((d) => d.id == id);
    } catch (e) {
      _errorMessage = e.toString();
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
