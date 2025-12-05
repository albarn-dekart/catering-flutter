import 'package:catering_flutter/graphql/meals.graphql.dart';
import 'package:catering_flutter/graphql/schema.graphql.dart';
import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:catering_flutter/core/api_exception.dart';

import 'package:catering_flutter/core/utils/ui_error_handler.dart';
import 'package:catering_flutter/core/services/media_service.dart';

typedef Meal = Query$GetMeals$meals$edges$node;
typedef MealDetails = Query$GetMeal$meal;

class MealService extends ChangeNotifier {
  final GraphQLClient _client;
  final MediaService _mediaService;

  List<Meal> _meals = [];
  List<Meal> get meals => _meals;

  MealDetails? _currentMeal;
  MealDetails? get currentMeal => _currentMeal;

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

  MealService(this._client, this._mediaService);

  Future<void> fetchAllMeals() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final options = QueryOptions(
        document: documentNodeQueryGetMeals,
        variables: Variables$Query$GetMeals(first: 100).toJson(),
        fetchPolicy: FetchPolicy.networkOnly,
      );
      final result = await _client.query(options);

      if (result.hasException) {
        throw ApiException(result.exception.toString());
      }

      final data = Query$GetMeals.fromJson(result.data!);
      if (data.meals?.edges != null) {
        _meals = data.meals!.edges!
            .map((e) => e?.node)
            .whereType<Meal>()
            .toList();
      }
    } catch (e) {
      _errorMessage = UIErrorHandler.mapExceptionToMessage(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchMealsByRestaurant(String restaurantIri) async {
    _isLoading = true;
    _errorMessage = null;
    _endCursor = null;
    _hasNextPage = false;
    notifyListeners();

    try {
      final options = QueryOptions(
        document: documentNodeQueryGetMealsByRestaurant,
        variables: Variables$Query$GetMealsByRestaurant(
          restaurantId: restaurantIri,
          first: 20,
        ).toJson(),
      );
      final result = await _client.query(options);

      if (result.hasException) {
        throw ApiException(result.exception.toString());
      }

      final data = Query$GetMealsByRestaurant.fromJson(result.data!);

      if (data.restaurant?.meals?.edges != null) {
        _meals = data.restaurant!.meals!.edges!
            .map((e) => e?.node)
            .whereType<Query$GetMealsByRestaurant$restaurant$meals$edges$node>()
            .map(
              (e) => Meal(
                id: e.id,
                name: e.name,
                description: e.description,
                price: e.price,
                imageUrl: e.imageUrl,
                $__typename: e.$__typename,
              ),
            )
            .toList();

        _endCursor = data.restaurant?.meals?.pageInfo.endCursor;
        _hasNextPage = data.restaurant?.meals?.pageInfo.hasNextPage ?? false;
      }
    } catch (e) {
      _errorMessage = UIErrorHandler.mapExceptionToMessage(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadMoreMeals(String restaurantIri) async {
    if (_isFetchingMore || !_hasNextPage || _endCursor == null) return;

    _isFetchingMore = true;
    notifyListeners();

    try {
      final options = QueryOptions(
        document: documentNodeQueryGetMealsByRestaurant,
        variables: Variables$Query$GetMealsByRestaurant(
          restaurantId: restaurantIri,
          first: 20,
          after: _endCursor,
        ).toJson(),
        fetchPolicy: FetchPolicy.networkOnly,
      );
      final result = await _client.query(options);

      if (result.hasException) {
        throw ApiException(result.exception.toString());
      }

      final data = Query$GetMealsByRestaurant.fromJson(result.data!);

      if (data.restaurant?.meals?.edges != null) {
        final newMeals = data.restaurant!.meals!.edges!
            .map((e) => e?.node)
            .whereType<Query$GetMealsByRestaurant$restaurant$meals$edges$node>()
            .map(
              (e) => Meal(
                id: e.id,
                name: e.name,
                description: e.description,
                price: e.price,
                imageUrl: e.imageUrl,
                $__typename: e.$__typename,
              ),
            )
            .toList();

        _meals.addAll(newMeals);
        _endCursor = data.restaurant?.meals?.pageInfo.endCursor;
        _hasNextPage = data.restaurant?.meals?.pageInfo.hasNextPage ?? false;
      }
    } catch (e) {
      _errorMessage = UIErrorHandler.mapExceptionToMessage(e);
    } finally {
      _isFetchingMore = false;
      notifyListeners();
    }
  }

  Future<void> getMealById(String id) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final options = QueryOptions(
        document: documentNodeQueryGetMeal,
        variables: Variables$Query$GetMeal(id: id).toJson(),
        fetchPolicy: FetchPolicy.networkOnly,
      );
      final result = await _client.query(options);

      if (result.hasException) {
        throw ApiException(result.exception.toString());
      }

      _currentMeal = Query$GetMeal.fromJson(result.data!).meal;
    } catch (e) {
      _errorMessage = UIErrorHandler.mapExceptionToMessage(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<String?> createMeal({
    required String restaurantId,
    required String name,
    required String description,
    required double price,
    double? calories,
    double? protein,
    double? fat,
    double? carbs,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final options = MutationOptions(
        document: documentNodeMutationCreateMeal,
        variables: Variables$Mutation$CreateMeal(
          input: Input$createMealInput(
            restaurant: restaurantId,
            name: name,
            description: description,
            price: price.toInt(),
            calories: calories ?? 0.0,
            protein: protein ?? 0.0,
            fat: fat ?? 0.0,
            carbs: carbs ?? 0.0,
          ),
        ).toJson(),
      );

      final result = await _client.mutate(options);

      if (result.hasException) {
        throw ApiException(result.exception.toString());
      }
      return Mutation$CreateMeal.fromJson(result.data!).createMeal?.meal?.id;
    } catch (e) {
      _errorMessage = UIErrorHandler.mapExceptionToMessage(e);
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateMeal({
    required String id,
    String? name,
    String? description,
    double? price,
    double? calories,
    double? protein,
    double? fat,
    double? carbs,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final options = MutationOptions(
        document: documentNodeMutationUpdateMeal,
        variables: Variables$Mutation$UpdateMeal(
          input: Input$updateMealInput(
            id: id,
            name: name,
            description: description,
            price: price?.toInt(),
            calories: calories,
            protein: protein,
            fat: fat,
            carbs: carbs,
          ),
        ).toJson(),
      );

      final result = await _client.mutate(options);

      if (result.hasException) {
        throw ApiException(result.exception.toString());
      }
    } catch (e) {
      _errorMessage = UIErrorHandler.mapExceptionToMessage(e);
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deleteMeal(String id) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final options = MutationOptions(
        document: documentNodeMutationDeleteMeal,
        variables: Variables$Mutation$DeleteMeal(
          input: Input$deleteMealInput(id: id),
        ).toJson(),
      );
      final result = await _client.mutate(options);

      if (result.hasException) {
        throw ApiException(result.exception.toString());
      }

      _meals.removeWhere((m) => m.id == id);
    } catch (e) {
      _errorMessage = UIErrorHandler.mapExceptionToMessage(e);
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearStatus() {
    _errorMessage = null;
    notifyListeners();
  }

  Future<void> updateMealImage(
    String mealIri,
    List<int> imageBytes,
    String filename,
  ) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      await _mediaService.uploadImage('$mealIri/image', imageBytes, filename);
      await getMealById(mealIri);
    } catch (e) {
      _errorMessage = UIErrorHandler.mapExceptionToMessage(e);
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
