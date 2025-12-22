import 'dart:convert';
import 'package:catering_flutter/graphql/meals.graphql.dart';
import 'package:catering_flutter/graphql/schema.graphql.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:catering_flutter/core/services/api_service.dart';

import 'package:catering_flutter/core/utils/ui_error_handler.dart';
import 'package:catering_flutter/core/services/media_service.dart';

typedef Meal = Fragment$MealFragment;
typedef MealDetails = Fragment$MealFragment;

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

  String? _currentSearchQuery;

  // Cache current filters for pagination
  RangeValues? _lastPriceRange;
  RangeValues? _lastCalorieRange;
  RangeValues? _lastProteinRange;
  RangeValues? _lastFatRange;
  RangeValues? _lastCarbRange;

  bool _isUploadingImage = false;
  bool get isUploadingImage => _isUploadingImage;

  MealService(this._client, this._mediaService);

  Future<void> fetchAllMeals({String? searchQuery}) async {
    _isLoading = true;
    _errorMessage = null;
    _currentSearchQuery = searchQuery;
    _meals = [];
    notifyListeners();

    try {
      final options = QueryOptions(
        document: documentNodeQueryGetMeals,
        variables: Variables$Query$GetMeals(
          first: 20,
          search: searchQuery,
        ).toJson(),
        fetchPolicy: FetchPolicy.networkOnly,
      );
      final result = await _client.query(options);
      ApiService.check(result);

      final data = Query$GetMeals.fromJson(result.data!);
      if (data.meals?.edges != null) {
        _meals = data.meals!.edges!
            .map((e) => e?.node)
            .whereType<Meal>()
            .toList();
        _endCursor = data.meals?.pageInfo.endCursor;
        _hasNextPage = data.meals?.pageInfo.hasNextPage ?? false;
      }
    } catch (e) {
      _errorMessage = UIErrorHandler.mapExceptionToMessage(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadMoreMeals() async {
    if (_isFetchingMore || !_hasNextPage || _endCursor == null) return;

    _isFetchingMore = true;
    notifyListeners();

    try {
      // Using fetchAllMeals strategy (global list) if _currentRestaurantIri is null, logic assumes global search context for now.
      // Or strictly separated: we can introduce loadMoreMealsGlobal and loadMoreMealsByRestaurant.
      // For simplicity reusing loadMore for both if we store context?
      // But the previous implementation for loadMoreMeals took restaurantIri argument.
      // Let's stick to the previous pattern: loadMoreMeals handles restaurant specific mostly.
      // BUT wait, fetchAllMeals now has pagination, so we need a global loadMore.
      // Let's create `loadMoreMealsGlobal`.

      final options = QueryOptions(
        document: documentNodeQueryGetMeals,
        variables: Variables$Query$GetMeals(
          first: 20,
          after: _endCursor,
          search: _currentSearchQuery,
        ).toJson(),
        fetchPolicy: FetchPolicy.networkOnly,
      );
      final result = await _client.query(options);
      ApiService.check(result);

      final data = Query$GetMeals.fromJson(result.data!);
      if (data.meals?.edges != null) {
        final newMeals = data.meals!.edges!
            .map((e) => e?.node)
            .whereType<Meal>()
            .toList();

        _meals = [..._meals, ...newMeals];
        _endCursor = data.meals?.pageInfo.endCursor;
        _hasNextPage = data.meals?.pageInfo.hasNextPage ?? false;
      }
    } catch (e) {
      _errorMessage = UIErrorHandler.mapExceptionToMessage(e);
    } finally {
      _isFetchingMore = false;
      notifyListeners();
    }
  }

  Future<void> fetchMealsByRestaurant(
    String restaurantIri, {
    String? searchQuery,
    RangeValues? priceRange,
    RangeValues? calorieRange,
    RangeValues? proteinRange,
    RangeValues? fatRange,
    RangeValues? carbRange,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    _endCursor = null;
    _hasNextPage = false;
    _currentSearchQuery = searchQuery;
    _lastPriceRange = priceRange;
    _lastCalorieRange = calorieRange;
    _lastProteinRange = proteinRange;
    _lastFatRange = fatRange;
    _lastCarbRange = carbRange;
    _meals = [];
    notifyListeners();

    try {
      final options = QueryOptions(
        document: documentNodeQueryGetMealsByRestaurant,
        variables: Variables$Query$GetMealsByRestaurant(
          restaurantId: restaurantIri,
          first: 20,
          search: _currentSearchQuery,
          price: priceRange != null
              ? [
                  Input$MealFilter_price(
                    gte: (priceRange.start * 100).toInt().toString(),
                    lte: (priceRange.end * 100).toInt().toString(),
                  ),
                ]
              : null,
          calories: calorieRange != null
              ? [
                  Input$MealFilter_calories(
                    gte: calorieRange.start.toString(),
                    lte: calorieRange.end.toString(),
                  ),
                ]
              : null,
          protein: proteinRange != null
              ? [
                  Input$MealFilter_protein(
                    gte: proteinRange.start.toString(),
                    lte: proteinRange.end.toString(),
                  ),
                ]
              : null,
          fat: fatRange != null
              ? [
                  Input$MealFilter_fat(
                    gte: fatRange.start.toString(),
                    lte: fatRange.end.toString(),
                  ),
                ]
              : null,
          carbs: carbRange != null
              ? [
                  Input$MealFilter_carbs(
                    gte: carbRange.start.toString(),
                    lte: carbRange.end.toString(),
                  ),
                ]
              : null,
        ).toJson(),
        fetchPolicy: FetchPolicy.networkOnly,
      );
      final result = await _client.query(options);
      ApiService.check(result);

      final data = Query$GetMealsByRestaurant.fromJson(result.data!);

      if (data.restaurant?.meals?.edges != null) {
        _meals = data.restaurant!.meals!.edges!
            .map((e) => e?.node)
            .whereType<Fragment$MealFragment>()
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

  Future<void> loadMoreMealsByRestaurant(String restaurantIri) async {
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
          search: _currentSearchQuery,
          price: _lastPriceRange != null
              ? [
                  Input$MealFilter_price(
                    gte: (_lastPriceRange!.start * 100).toInt().toString(),
                    lte: (_lastPriceRange!.end * 100).toInt().toString(),
                  ),
                ]
              : null,
          calories: _lastCalorieRange != null
              ? [
                  Input$MealFilter_calories(
                    gte: _lastCalorieRange!.start.toString(),
                    lte: _lastCalorieRange!.end.toString(),
                  ),
                ]
              : null,
          protein: _lastProteinRange != null
              ? [
                  Input$MealFilter_protein(
                    gte: _lastProteinRange!.start.toString(),
                    lte: _lastProteinRange!.end.toString(),
                  ),
                ]
              : null,
          fat: _lastFatRange != null
              ? [
                  Input$MealFilter_fat(
                    gte: _lastFatRange!.start.toString(),
                    lte: _lastFatRange!.end.toString(),
                  ),
                ]
              : null,
          carbs: _lastCarbRange != null
              ? [
                  Input$MealFilter_carbs(
                    gte: _lastCarbRange!.start.toString(),
                    lte: _lastCarbRange!.end.toString(),
                  ),
                ]
              : null,
        ).toJson(),
        fetchPolicy: FetchPolicy.networkOnly,
      );
      final result = await _client.query(options);
      ApiService.check(result);

      final data = Query$GetMealsByRestaurant.fromJson(result.data!);

      if (data.restaurant?.meals?.edges != null) {
        final newMeals = data.restaurant!.meals!.edges!
            .map((e) => e?.node)
            .whereType<Fragment$MealFragment>()
            .toList();

        _meals = [..._meals, ...newMeals];
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
    _currentMeal = null;
    notifyListeners();

    try {
      final options = QueryOptions(
        document: documentNodeQueryGetMeal,
        variables: Variables$Query$GetMeal(id: id).toJson(),
        fetchPolicy: FetchPolicy.networkOnly,
      );
      final result = await _client.query(options);
      ApiService.check(result);

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
    required int price,
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
            price: price,
            calories: calories ?? 0.0,
            protein: protein ?? 0.0,
            fat: fat ?? 0.0,
            carbs: carbs ?? 0.0,
          ),
        ).toJson(),
      );

      final result = await _client.mutate(options);
      ApiService.check(result);

      final createdMeal = Mutation$CreateMeal.fromJson(
        result.data!,
      ).createMeal?.meal;
      if (createdMeal != null) {
        _currentMeal = createdMeal;
        _meals.insert(0, createdMeal);
      }
      return createdMeal?.id;
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
    int? price,
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
            price: price,
            calories: calories,
            protein: protein,
            fat: fat,
            carbs: carbs,
          ),
        ).toJson(),
      );

      final result = await _client.mutate(options);
      ApiService.check(result);

      final updatedMeal = Mutation$UpdateMeal.fromJson(
        result.data!,
      ).updateMeal?.meal;
      if (updatedMeal != null) {
        _currentMeal = updatedMeal;
        final index = _meals.indexWhere((m) => m.id == id);
        if (index != -1) {
          _meals[index] = updatedMeal;
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
      ApiService.check(result);

      _meals.removeWhere((m) => m.id == id);
    } catch (e) {
      _errorMessage = UIErrorHandler.mapExceptionToMessage(e);
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearCurrentMeal() {
    _currentMeal = null;
    _errorMessage = null;
    notifyListeners();
  }

  Future<void> updateMealImage(
    String mealIri,
    List<int> imageBytes,
    String filename,
  ) async {
    _isUploadingImage = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final responseBody = await _mediaService.uploadImage(
        '$mealIri/image',
        imageBytes,
        filename,
      );

      // Parse response to get new image URL
      final responseData = jsonDecode(responseBody) as Map<String, dynamic>;
      final newImageUrl = responseData['imageUrl'] as String?;

      // Update current meal's imageUrl locally
      if (_currentMeal != null && newImageUrl != null) {
        _currentMeal = _currentMeal!.copyWith(imageUrl: newImageUrl);
      }

      // Update in meals list
      final index = _meals.indexWhere((m) => m.id == mealIri);
      if (index != -1 && newImageUrl != null) {
        _meals[index] = _meals[index].copyWith(imageUrl: newImageUrl);
      }
    } catch (e) {
      _errorMessage = UIErrorHandler.mapExceptionToMessage(e);
      rethrow;
    } finally {
      _isUploadingImage = false;
      notifyListeners();
    }
  }
}
