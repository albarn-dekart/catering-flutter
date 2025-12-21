import 'dart:convert';
import 'package:catering_flutter/graphql/meals.graphql.dart';
import 'package:catering_flutter/graphql/schema.graphql.dart';
import 'package:catering_flutter/graphql/users.graphql.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:catering_flutter/core/services/api_service.dart';

import 'package:catering_flutter/core/utils/ui_error_handler.dart';

typedef MealPlan = Fragment$MealPlanSummaryFragment;
typedef MealPlanDetails = Fragment$MealPlanFragment;

class MealPlanService extends ChangeNotifier {
  final GraphQLClient _client;

  final ApiService _apiClient;

  List<MealPlan> _mealPlans = [];
  List<MealPlan> get mealPlans => _mealPlans;

  MealPlanDetails? _currentMealPlan;
  MealPlanDetails? get currentMealPlan => _currentMealPlan;

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

  // Cache current filters for pagination
  RangeValues? _lastPriceRange;
  RangeValues? _lastCalorieRange;
  RangeValues? _lastProteinRange;
  RangeValues? _lastFatRange;
  RangeValues? _lastCarbRange;

  bool _isUploadingImage = false;
  bool get isUploadingImage => _isUploadingImage;

  MealPlanService(this._client, this._apiClient);

  Future<void> fetchAllMealPlans({String? searchQuery}) async {
    _isLoading = true;
    _errorMessage = null;
    _currentSearchQuery = searchQuery;
    _mealPlans = [];
    notifyListeners();

    try {
      final options = QueryOptions(
        document: documentNodeQueryGetMealPlans,
        variables: Variables$Query$GetMealPlans(
          first: 20,
          search: searchQuery,
        ).toJson(),
        fetchPolicy: FetchPolicy.networkOnly,
      );
      final result = await _client.query(options);

      if (result.hasException) {
        throw ApiException(result.exception.toString());
      }

      final data = Query$GetMealPlans.fromJson(result.data!);
      if (data.mealPlans?.edges != null) {
        _mealPlans = data.mealPlans!.edges!
            .map((e) => e?.node)
            .whereType<MealPlan>()
            .toList();
        _endCursor = data.mealPlans?.pageInfo.endCursor;
        _hasNextPage = data.mealPlans?.pageInfo.hasNextPage ?? false;
      }
    } catch (e) {
      _errorMessage = UIErrorHandler.mapExceptionToMessage(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadMoreMealPlansGlobal() async {
    if (_isFetchingMore || !_hasNextPage || _endCursor == null) return;

    _isFetchingMore = true;
    notifyListeners();

    try {
      final options = QueryOptions(
        document: documentNodeQueryGetMealPlans,
        variables: Variables$Query$GetMealPlans(
          first: 20,
          after: _endCursor,
          search: _currentSearchQuery,
        ).toJson(),
        fetchPolicy: FetchPolicy.networkOnly,
      );
      final result = await _client.query(options);

      if (result.hasException) {
        throw ApiException(result.exception.toString());
      }

      final data = Query$GetMealPlans.fromJson(result.data!);
      if (data.mealPlans?.edges != null) {
        final newMealPlans = data.mealPlans!.edges!
            .map((e) => e?.node)
            .whereType<MealPlan>()
            .toList();
        _mealPlans = [..._mealPlans, ...newMealPlans];
        _endCursor = data.mealPlans?.pageInfo.endCursor;
        _hasNextPage = data.mealPlans?.pageInfo.hasNextPage ?? false;
      }
    } catch (e) {
      _errorMessage = UIErrorHandler.mapExceptionToMessage(e);
    } finally {
      _isFetchingMore = false;
      notifyListeners();
    }
  }

  Future<void> fetchMealPlansByRestaurant(
    String restaurantIri, {
    String? searchQuery,
    String? category, // Added category parameter
    RangeValues? priceRange,
    RangeValues? calorieRange,
    RangeValues? proteinRange,
    RangeValues? fatRange,
    RangeValues? carbRange,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    _currentSearchQuery = searchQuery;
    _currentCategory = category; // Store category
    _endCursor = null;
    _hasNextPage = false;
    _lastPriceRange = priceRange;
    _lastCalorieRange = calorieRange;
    _lastProteinRange = proteinRange;
    _lastFatRange = fatRange;
    _lastCarbRange = carbRange;
    _mealPlans = [];
    notifyListeners();

    try {
      final options = QueryOptions(
        document: documentNodeQueryGetMealPlansByRestaurant,
        variables: Variables$Query$GetMealPlansByRestaurant(
          restaurantId: restaurantIri,
          first: 20,
          search: _currentSearchQuery,
          category: _currentCategory, // Pass category to query
          price: priceRange != null
              ? [
                  Input$MealPlanFilter_price(
                    gte: (priceRange.start * 100).toInt().toString(),
                    lte: (priceRange.end * 100).toInt().toString(),
                  ),
                ]
              : null,
          calories: calorieRange != null
              ? [
                  Input$MealPlanFilter_calories(
                    gte: calorieRange.start.toString(),
                    lte: calorieRange.end.toString(),
                  ),
                ]
              : null,
          protein: proteinRange != null
              ? [
                  Input$MealPlanFilter_protein(
                    gte: proteinRange.start.toString(),
                    lte: proteinRange.end.toString(),
                  ),
                ]
              : null,
          fat: fatRange != null
              ? [
                  Input$MealPlanFilter_fat(
                    gte: fatRange.start.toString(),
                    lte: fatRange.end.toString(),
                  ),
                ]
              : null,
          carbs: carbRange != null
              ? [
                  Input$MealPlanFilter_carbs(
                    gte: carbRange.start.toString(),
                    lte: carbRange.end.toString(),
                  ),
                ]
              : null,
        ).toJson(),
        fetchPolicy: FetchPolicy.networkOnly,
      );
      final result = await _client.query(options);

      if (result.hasException) {
        throw ApiException(result.exception.toString());
      }

      final data = Query$GetMealPlansByRestaurant.fromJson(result.data!);

      if (data.restaurant?.mealPlans?.edges != null) {
        _mealPlans = data.restaurant!.mealPlans!.edges!
            .map((e) => e?.node)
            .whereType<MealPlan>()
            .toList();
        _endCursor = data.restaurant?.mealPlans?.pageInfo.endCursor;
        _hasNextPage =
            data.restaurant?.mealPlans?.pageInfo.hasNextPage ?? false;
      }
    } catch (e) {
      _errorMessage = UIErrorHandler.mapExceptionToMessage(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadMoreMealPlansByRestaurant(String restaurantIri) async {
    if (_isFetchingMore || !_hasNextPage || _endCursor == null) return;

    _isFetchingMore = true;
    notifyListeners();

    try {
      final options = QueryOptions(
        document: documentNodeQueryGetMealPlansByRestaurant,
        variables: Variables$Query$GetMealPlansByRestaurant(
          restaurantId: restaurantIri,
          first: 20,
          after: _endCursor,
          search: _currentSearchQuery,
          category: _currentCategory, // Pass category to query
          price: _lastPriceRange != null
              ? [
                  Input$MealPlanFilter_price(
                    gte: (_lastPriceRange!.start * 100).toInt().toString(),
                    lte: (_lastPriceRange!.end * 100).toInt().toString(),
                  ),
                ]
              : null,
          calories: _lastCalorieRange != null
              ? [
                  Input$MealPlanFilter_calories(
                    gte: _lastCalorieRange!.start.toString(),
                    lte: _lastCalorieRange!.end.toString(),
                  ),
                ]
              : null,
          protein: _lastProteinRange != null
              ? [
                  Input$MealPlanFilter_protein(
                    gte: _lastProteinRange!.start.toString(),
                    lte: _lastProteinRange!.end.toString(),
                  ),
                ]
              : null,
          fat: _lastFatRange != null
              ? [
                  Input$MealPlanFilter_fat(
                    gte: _lastFatRange!.start.toString(),
                    lte: _lastFatRange!.end.toString(),
                  ),
                ]
              : null,
          carbs: _lastCarbRange != null
              ? [
                  Input$MealPlanFilter_carbs(
                    gte: _lastCarbRange!.start.toString(),
                    lte: _lastCarbRange!.end.toString(),
                  ),
                ]
              : null,
        ).toJson(),
        fetchPolicy: FetchPolicy.networkOnly,
      );
      final result = await _client.query(options);

      if (result.hasException) {
        throw ApiException(result.exception.toString());
      }

      final data = Query$GetMealPlansByRestaurant.fromJson(result.data!);

      if (data.restaurant?.mealPlans?.edges != null) {
        final newMealPlans = data.restaurant!.mealPlans!.edges!
            .map((e) => e?.node)
            .whereType<MealPlan>()
            .toList();
        _mealPlans = [..._mealPlans, ...newMealPlans];
        _endCursor = data.restaurant?.mealPlans?.pageInfo.endCursor;
        _hasNextPage =
            data.restaurant?.mealPlans?.pageInfo.hasNextPage ?? false;
      }
    } catch (e) {
      _errorMessage = UIErrorHandler.mapExceptionToMessage(e);
    } finally {
      _isFetchingMore = false;
      notifyListeners();
    }
  }

  Future<void> getMealPlanById(String id) async {
    _isLoading = true;
    _errorMessage = null;
    _currentMealPlan = null;
    notifyListeners();

    try {
      final options = QueryOptions(
        document: documentNodeQueryGetMealPlan,
        variables: Variables$Query$GetMealPlan(id: id).toJson(),
        fetchPolicy: FetchPolicy.networkOnly,
      );
      final result = await _client.query(options);

      if (result.hasException) {
        throw ApiException(result.exception.toString());
      }

      _currentMealPlan = Query$GetMealPlan.fromJson(result.data!).mealPlan;
    } catch (e) {
      _errorMessage = UIErrorHandler.mapExceptionToMessage(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<String?> createMealPlan({
    required String restaurantIri,
    required String name,
    required String description,
    List<String>? mealIds,
    List<String>? categoryIds,
    String? ownerIri,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final options = MutationOptions(
        document: documentNodeMutationCreateMealPlan,
        variables: Variables$Mutation$CreateMealPlan(
          input: Input$createMealPlanInput(
            restaurant: restaurantIri,
            name: name,
            description: description,
            meals: mealIds,
            dietCategories: categoryIds,
            owner: ownerIri,
          ),
        ).toJson(),
      );

      final result = await _client.mutate(options);

      if (result.hasException) {
        throw ApiException(result.exception.toString());
      }

      final createdMealPlan = Mutation$CreateMealPlan.fromJson(
        result.data!,
      ).createMealPlan?.mealPlan;
      if (createdMealPlan != null) {
        _mealPlans.insert(0, createdMealPlan);
      }
      return createdMealPlan?.id;
    } catch (e) {
      _errorMessage = UIErrorHandler.mapExceptionToMessage(e);
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateMealPlan({
    required String id,
    String? name,
    String? description,
    List<String>? mealIds,
    List<String>? categoryIds,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final options = MutationOptions(
        document: documentNodeMutationUpdateMealPlan,
        variables: Variables$Mutation$UpdateMealPlan(
          input: Input$updateMealPlanInput(
            id: id,
            name: name,
            description: description,
            meals: mealIds,
            dietCategories: categoryIds,
          ),
        ).toJson(),
      );

      final result = await _client.mutate(options);

      if (result.hasException) {
        throw ApiException(result.exception.toString());
      }

      final updatedMealPlan = Mutation$UpdateMealPlan.fromJson(
        result.data!,
      ).updateMealPlan?.mealPlan;
      if (updatedMealPlan != null) {
        final index = _mealPlans.indexWhere((mp) => mp.id == id);
        if (index != -1) {
          _mealPlans[index] = updatedMealPlan;
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

  Future<void> deleteMealPlan(String id) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final options = MutationOptions(
        document: documentNodeMutationDeleteMealPlan,
        variables: Variables$Mutation$DeleteMealPlan(
          input: Input$deleteMealPlanInput(id: id),
        ).toJson(),
      );
      final result = await _client.mutate(options);

      if (result.hasException) {
        throw ApiException(result.exception.toString());
      }

      _mealPlans.removeWhere((mp) => mp.id == id);
    } catch (e) {
      _errorMessage = UIErrorHandler.mapExceptionToMessage(e);
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getMealPlans() => fetchAllMealPlans();

  void clearCurrentMealPlan() {
    _currentMealPlan = null;
    _errorMessage = null;
    notifyListeners();
  }

  Future<void> updateMealPlanImage(
    String mealPlanIri,
    List<int> imageBytes,
    String filename,
  ) async {
    _isUploadingImage = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _apiClient.postMultipart(
        '$mealPlanIri/image',
        imageBytes,
        filename,
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        // Parse response to get new image URL
        final responseData = jsonDecode(response.body) as Map<String, dynamic>;
        final newImageUrl = responseData['imageUrl'] as String?;

        // Update current meal plan's imageUrl locally
        if (_currentMealPlan != null && newImageUrl != null) {
          _currentMealPlan = _currentMealPlan!.copyWith(imageUrl: newImageUrl);
        }

        // Update in meal plans list
        final index = _mealPlans.indexWhere((mp) => mp.id == mealPlanIri);
        if (index != -1 && newImageUrl != null) {
          _mealPlans[index] = _mealPlans[index].copyWith(imageUrl: newImageUrl);
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

  Future<void> fetchMyCustomMealPlans(
    String userIri, {
    String? searchQuery,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    _mealPlans = [];
    notifyListeners();

    try {
      final options = QueryOptions(
        document: documentNodeQueryGetMyCustomMealPlans,
        variables: Variables$Query$GetMyCustomMealPlans(
          id: userIri,
          search: searchQuery,
        ).toJson(),
        fetchPolicy: FetchPolicy.networkOnly,
      );
      final result = await _client.query(options);

      if (result.hasException) {
        throw ApiException(result.exception.toString());
      }

      final data = Query$GetMyCustomMealPlans.fromJson(result.data!);
      if (data.user?.customMealPlans?.edges != null) {
        _mealPlans = data.user!.customMealPlans!.edges!
            .map((e) => e?.node)
            .whereType<MealPlan>()
            .toList();
      }
    } catch (e) {
      _errorMessage = UIErrorHandler.mapExceptionToMessage(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
