import 'dart:convert';
import 'package:catering_flutter/graphql/restaurants.graphql.dart';
import 'package:catering_flutter/graphql/restaurant_categories.graphql.dart';
import 'package:catering_flutter/graphql/schema.graphql.dart';
import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:catering_flutter/core/services/api_service.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';

typedef Restaurant = Fragment$RestaurantSummaryFragment;
typedef RestaurantDetails = Query$GetRestaurant$restaurant;

class RestaurantService extends ChangeNotifier {
  final GraphQLClient _client;
  final ApiService _apiClient;

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

  String? _currentSearchQuery;
  String? get currentSearchQuery => _currentSearchQuery;

  String? _currentCategory;
  String? get currentCategory => _currentCategory;

  bool _isUploadingImage = false;
  bool get isUploadingImage => _isUploadingImage;

  RestaurantService(this._client, this._apiClient);

  Future<void> fetchAllRestaurants({
    String? searchQuery,
    String? category,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    _currentSearchQuery = searchQuery;
    _currentCategory = category;
    _restaurants = [];
    notifyListeners();

    try {
      final options = QueryOptions(
        document: documentNodeQueryGetRestaurants,
        variables: Variables$Query$GetRestaurants(
          first: 20,
          search: searchQuery,
          category: category,
        ).toJson(),
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
          first: 20,
          after: _endCursor,
          search: _currentSearchQuery,
          category: _currentCategory,
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
        _restaurants = [..._restaurants, ...newRestaurants];
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

  List<Query$GetRestaurantCategories$restaurantCategories$edges$node>
  _categories = [];
  List<Query$GetRestaurantCategories$restaurantCategories$edges$node>
  get categories => _categories;

  Future<void> fetchCategories() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final options = QueryOptions(
        document: documentNodeQueryGetRestaurantCategories,
        fetchPolicy: FetchPolicy.networkOnly,
      );
      final result = await _client.query(options);

      if (result.hasException) {
        throw ApiException(result.exception.toString());
      }

      final data = Query$GetRestaurantCategories.fromJson(result.data!);
      if (data.restaurantCategories?.edges != null) {
        _categories = data.restaurantCategories!.edges!
            .map((e) => e?.node)
            .whereType<
              Query$GetRestaurantCategories$restaurantCategories$edges$node
            >()
            .toList();
      }
    } catch (e) {
      _errorMessage = UIErrorHandler.mapExceptionToMessage(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getRestaurantById(String id) async {
    _isLoading = true;
    _errorMessage = null;
    _currentRestaurant = null;
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
    int? deliveryPrice,
    String? phoneNumber,
    String? email,
    String? city,
    String? street,
    String? zipCode,
    String? nip,
    String? ownerIri,
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
            deliveryPrice: deliveryPrice ?? 0,
            restaurantCategories: categoryIris,
            phoneNumber: phoneNumber,
            email: email,
            city: city,
            street: street,
            zipCode: zipCode,
            nip: nip,
            owner: ownerIri,
          ),
        ).toJson(),
      );

      final result = await _client.mutate(options);

      if (result.hasException) {
        throw ApiException(result.exception.toString());
      }

      final createdRestaurant = Mutation$CreateRestaurant.fromJson(
        result.data!,
      ).createRestaurant?.restaurant;

      if (createdRestaurant != null) {
        // Set as current restaurant
        _currentRestaurant = Query$GetRestaurant$restaurant.fromJson(
          createdRestaurant.toJson(),
        );
        // Add to local list (Fragment$RestaurantDetailFragment implements Fragment$RestaurantSummaryFragment)
        _restaurants.add(createdRestaurant);
      }
      return createdRestaurant?.id;
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
    int? deliveryPrice,
    String? phoneNumber,
    String? email,
    String? city,
    String? street,
    String? zipCode,
    String? nip,
    String? ownerIri,
    bool unassignOwner = false,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      var input = Input$updateRestaurantInput(
        id: id,
        name: name,
        description: description,
        deliveryPrice: deliveryPrice,
        restaurantCategories: categoryIris,
        phoneNumber: phoneNumber,
        email: email,
        city: city,
        street: street,
        zipCode: zipCode,
        nip: nip,
      );

      if (unassignOwner) {
        input = input.copyWith(owner: null);
      } else if (ownerIri != null) {
        input = input.copyWith(owner: ownerIri);
      }

      final options = MutationOptions(
        document: documentNodeMutationUpdateRestaurant,
        variables: Variables$Mutation$UpdateRestaurant(input: input).toJson(),
      );

      final result = await _client.mutate(options);

      if (result.hasException) {
        throw ApiException(result.exception.toString());
      }

      final updatedRestaurant = Mutation$UpdateRestaurant.fromJson(
        result.data!,
      ).updateRestaurant?.restaurant;

      if (updatedRestaurant != null) {
        // Update current restaurant
        _currentRestaurant = Query$GetRestaurant$restaurant.fromJson(
          updatedRestaurant.toJson(),
        );
        // Find and update in local list
        final index = _restaurants.indexWhere((r) => r.id == id);
        if (index != -1) {
          _restaurants[index] = updatedRestaurant;
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

      final updatedRestaurant = Mutation$UpdateRestaurant.fromJson(
        result.data!,
      ).updateRestaurant?.restaurant;

      if (updatedRestaurant != null) {
        // Update current restaurant
        _currentRestaurant = Query$GetRestaurant$restaurant.fromJson(
          updatedRestaurant.toJson(),
        );
        // Find and update in local list
        final index = _restaurants.indexWhere((r) => r.id == restaurantId);
        if (index != -1) {
          _restaurants[index] = updatedRestaurant;
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
    _errorMessage = null;
    notifyListeners();
  }

  Future<void> updateRestaurantImage(
    String restaurantIri,
    List<int> imageBytes,
    String filename,
  ) async {
    _isUploadingImage = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _apiClient.postMultipart(
        '$restaurantIri/image',
        imageBytes,
        filename,
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        // Parse response to get new image URL
        final responseData = jsonDecode(response.body);
        final newImageUrl = responseData['imageUrl'] as String?;

        // Update current restaurant's imageUrl locally
        if (_currentRestaurant != null && newImageUrl != null) {
          _currentRestaurant = _currentRestaurant!.copyWith(
            imageUrl: newImageUrl,
          );
        }

        // Update in restaurants list
        final index = _restaurants.indexWhere((r) => r.id == restaurantIri);
        if (index != -1 && newImageUrl != null) {
          _restaurants[index] = _restaurants[index].copyWith(
            imageUrl: newImageUrl,
          );
        }
      } else {
        throw ApiException('Failed to upload image: ${response.body}');
      }
    } catch (e) {
      _errorMessage = UIErrorHandler.mapExceptionToMessage(e);
      rethrow;
    } finally {
      _isUploadingImage = false;
      notifyListeners();
    }
  }

  /// Invites a new restaurant owner and creates their restaurant.
  ///
  /// Two-step flow:
  /// 1. Creates a user with ROLE_RESTAURANT via /api/invite-restaurant-owner
  /// 2. Creates the restaurant via GraphQL mutation with the user as owner
  ///
  /// Returns the restaurant IRI on success.
  Future<String?> inviteRestaurantOwner({
    required String email,
    required String restaurantName,
    String? description,
    List<String>? categoryIds,
    int? deliveryPrice,
    String? phoneNumber,
    String? restaurantEmail,
    String? city,
    String? street,
    String? zipCode,
    String? nip,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      // Step 1: Create the user with ROLE_RESTAURANT
      final response = await _apiClient.post(
        '/api/invite-restaurant-owner',
        body: {
          'email': email,
          'restaurantName': restaurantName, // Used for the invitation email
        },
      );

      if (response.statusCode != 201) {
        final error = jsonDecode(response.body);
        throw ApiException(
          error['error'] ?? 'Failed to create restaurant owner',
        );
      }

      final userData = jsonDecode(response.body);
      final userIri = userData['user']['iri'] as String;

      // Step 2: Create the restaurant with the user as owner
      final restaurantIri = await createRestaurant(
        name: restaurantName,
        description: description ?? '',
        deliveryPrice: deliveryPrice ?? 0,
        categoryIris: categoryIds,
        phoneNumber: phoneNumber,
        email: restaurantEmail,
        city: city,
        street: street,
        zipCode: zipCode,
        nip: nip,
        ownerIri: userIri,
      );

      return restaurantIri;
    } catch (e) {
      _errorMessage = UIErrorHandler.mapExceptionToMessage(e);
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
