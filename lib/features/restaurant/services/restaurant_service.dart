import 'package:catering_flutter/graphql/restaurants.graphql.dart';
import 'package:catering_flutter/graphql/schema.graphql.dart';
import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:catering_flutter/core/api_exception.dart';
import 'package:catering_flutter/core/api_config.dart';
import 'package:catering_flutter/core/token_storage_service.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';

typedef Restaurant = Query$GetRestaurants$restaurants$edges$node;
typedef RestaurantDetails = Query$GetRestaurant$restaurant;

class RestaurantService extends ChangeNotifier {
  final GraphQLClient _client;
  final TokenStorageService _tokenStorage;

  List<Restaurant> _restaurants = [];
  List<Restaurant> get restaurants => _restaurants;

  RestaurantDetails? _currentRestaurant;
  RestaurantDetails? get currentRestaurant => _currentRestaurant;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool get hasError => _errorMessage != null;

  RestaurantService(this._client, this._tokenStorage);

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
            categories: categoryIds,
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
      final baseUrl = ApiConfig.baseUrl;

      final uri = Uri.parse(
        '${baseUrl.replaceFirst('/api', '')}$restaurantIri/image',
      );
      final request = http.MultipartRequest('POST', uri);

      final token = await _tokenStorage.getToken();
      if (token != null) {
        request.headers['Authorization'] = 'Bearer $token';
      }

      request.files.add(
        http.MultipartFile.fromBytes('file', imageBytes, filename: filename),
      );

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

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
}
