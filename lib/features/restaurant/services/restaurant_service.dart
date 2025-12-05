import 'dart:convert';
import 'package:catering_flutter/graphql/restaurants.graphql.dart';
import 'package:catering_flutter/graphql/schema.graphql.dart';
import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:catering_flutter/core/api_exception.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';
import 'package:catering_flutter/core/api_client.dart';

typedef Restaurant = Query$GetRestaurants$restaurants$edges$node;
typedef RestaurantDetails = Query$GetRestaurant$restaurant;

class RestaurantService extends ChangeNotifier {
  final GraphQLClient _client;
  final ApiClient _apiClient;

  List<Restaurant> _restaurants = [];
  List<Restaurant> get restaurants => _restaurants;

  RestaurantDetails? _currentRestaurant;
  RestaurantDetails? get currentRestaurant => _currentRestaurant;

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

  RestaurantService(this._client, this._apiClient);

  Future<void> fetchAllRestaurants() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final options = QueryOptions(
        document: documentNodeQueryGetRestaurants,
        variables: Variables$Query$GetRestaurants(first: 50).toJson(),
        fetchPolicy: FetchPolicy.networkOnly,
      );
      final result = await _client.query(options);

      if (result.hasException) {
        throw ApiException(result.exception.toString());
      }

      final data = Query$GetRestaurants.fromJson(result.data!);
      if (data.restaurants?.edges != null) {
        _restaurants = data.restaurants!.edges!
            .map((e) => e?.node)
            .whereType<Restaurant>()
            .toList();
        _endCursor = data.restaurants?.pageInfo.endCursor;
        _hasNextPage = data.restaurants?.pageInfo.hasNextPage ?? false;
      }
    } catch (e) {
      _errorMessage = UIErrorHandler.mapExceptionToMessage(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadMoreRestaurants() async {
    if (_isFetchingMore || !_hasNextPage || _endCursor == null) return;

    _isFetchingMore = true;
    notifyListeners();

    try {
      final options = QueryOptions(
        document: documentNodeQueryGetRestaurants,
        variables: Variables$Query$GetRestaurants(
          first: 50,
          after: _endCursor,
        ).toJson(),
        fetchPolicy: FetchPolicy.networkOnly,
      );
      final result = await _client.query(options);

      if (result.hasException) {
        throw ApiException(result.exception.toString());
      }

      final data = Query$GetRestaurants.fromJson(result.data!);
      if (data.restaurants?.edges != null) {
        final newRestaurants = data.restaurants!.edges!
            .map((e) => e?.node)
            .whereType<Restaurant>()
            .toList();
        _restaurants.addAll(newRestaurants);
        _endCursor = data.restaurants?.pageInfo.endCursor;
        _hasNextPage = data.restaurants?.pageInfo.hasNextPage ?? false;
      }
    } catch (e) {
      _errorMessage = UIErrorHandler.mapExceptionToMessage(e);
    } finally {
      _isFetchingMore = false;
      notifyListeners();
    }
  }

  Future<void> getRestaurantById(String id) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final options = QueryOptions(
        document: documentNodeQueryGetRestaurant,
        variables: Variables$Query$GetRestaurant(id: id).toJson(),
        fetchPolicy: FetchPolicy.networkOnly,
      );
      final result = await _client.query(options);

      if (result.hasException) {
        throw ApiException(result.exception.toString());
      }

      _currentRestaurant = Query$GetRestaurant.fromJson(
        result.data!,
      ).restaurant;
    } catch (e) {
      _errorMessage = UIErrorHandler.mapExceptionToMessage(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<String?> createRestaurant({
    required String name,
    required String description,
    List<String>? categoryIris,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final options = MutationOptions(
        document: documentNodeMutationCreateRestaurant,
        variables: Variables$Mutation$CreateRestaurant(
          input: Input$createRestaurantInput(
            name: name,
            description: description,
            restaurantCategories: categoryIris,
          ),
        ).toJson(),
      );

      final result = await _client.mutate(options);

      if (result.hasException) {
        throw ApiException(result.exception.toString());
      }

      final newId = Mutation$CreateRestaurant.fromJson(
        result.data!,
      ).createRestaurant?.restaurant?.id;
      if (newId != null) {
        await getRestaurantById(newId);
      }
      return newId;
    } catch (e) {
      _errorMessage = UIErrorHandler.mapExceptionToMessage(e);
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateRestaurant({
    required String id,
    String? name,
    String? description,
    List<String>? categoryIris,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final options = MutationOptions(
        document: documentNodeMutationUpdateRestaurant,
        variables: Variables$Mutation$UpdateRestaurant(
          input: Input$updateRestaurantInput(
            id: id,
            name: name,
            description: description,
            restaurantCategories: categoryIris,
          ),
        ).toJson(),
      );

      final result = await _client.mutate(options);

      if (result.hasException) {
        throw ApiException(result.exception.toString());
      }

      await getRestaurantById(id);
    } catch (e) {
      _errorMessage = UIErrorHandler.mapExceptionToMessage(e);
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateRestaurantCategories(
    String restaurantId,
    List<String> categoryIds,
  ) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final options = MutationOptions(
        document: documentNodeMutationUpdateRestaurant,
        variables: Variables$Mutation$UpdateRestaurant(
          input: Input$updateRestaurantInput(
            id: restaurantId,
            restaurantCategories: categoryIds,
          ),
        ).toJson(),
      );

      final result = await _client.mutate(options);

      if (result.hasException) {
        throw ApiException(result.exception.toString());
      }

      await getRestaurantById(restaurantId);
    } catch (e) {
      _errorMessage = UIErrorHandler.mapExceptionToMessage(e);
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deleteRestaurant(String id) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final options = MutationOptions(
        document: documentNodeMutationDeleteRestaurant,
        variables: Variables$Mutation$DeleteRestaurant(
          input: Input$deleteRestaurantInput(id: id),
        ).toJson(),
      );
      final result = await _client.mutate(options);

      if (result.hasException) {
        throw ApiException(result.exception.toString());
      }

      _restaurants.removeWhere((r) => r.id == id);
    } catch (e) {
      _errorMessage = UIErrorHandler.mapExceptionToMessage(e);
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearCurrentRestaurant() {
    _currentRestaurant = null;
    notifyListeners();
  }

  Future<void> updateRestaurantImage(
    String restaurantIri,
    List<int> imageBytes,
    String filename,
  ) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _apiClient.postMultipart(
        '$restaurantIri/image',
        imageBytes,
        filename,
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        await getRestaurantById(restaurantIri);
      } else {
        throw ApiException('Failed to upload image: ${response.body}');
      }
    } catch (e) {
      _errorMessage = UIErrorHandler.mapExceptionToMessage(e);
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Invites a new restaurant owner by creating a user and restaurant atomically.
  /// Uses InviteRestaurantController on backend (/api/invite-restaurant).
  /// Returns the restaurant IRI on success.
  Future<String?> inviteRestaurantOwner({
    required String email,
    required String password,
    required String restaurantName,
    String? description,
    List<String>? categoryIds,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _apiClient.post(
        '/api/invite-restaurant',
        body: {
          'email': email,
          'plainPassword': password,
          'restaurantName': restaurantName,
          'restaurantDescription': description,
          'categoryIds': categoryIds ?? [],
        },
      );

      if (response.statusCode == 201) {
        final data = jsonDecode(response.body);
        final restaurantIri = '/api/restaurants/${data['restaurant']['id']}';

        // Refresh the restaurant list
        await fetchAllRestaurants();

        return restaurantIri;
      } else {
        final error = jsonDecode(response.body);
        throw ApiException(error['error'] ?? 'Failed to create restaurant');
      }
    } catch (e) {
      _errorMessage = UIErrorHandler.mapExceptionToMessage(e);
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
