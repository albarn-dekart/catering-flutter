import 'package:catering_flutter/graphql/meals.graphql.dart';
import 'package:catering_flutter/graphql/schema.graphql.dart';
import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:catering_flutter/core/api_exception.dart';

import 'package:catering_flutter/core/utils/ui_error_handler.dart';
import 'package:catering_flutter/core/api_client.dart';

typedef MealPlan = Query$GetMealPlans$mealPlans$edges$node;
typedef MealPlanDetails = Query$GetMealPlan$mealPlan;

class MealPlanService extends ChangeNotifier {
  final GraphQLClient _client;

  final ApiClient _apiClient;

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

  MealPlanService(this._client, this._apiClient);

  Future<void> fetchAllMealPlans() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final options = QueryOptions(
        document: documentNodeQueryGetMealPlans,
        variables: Variables$Query$GetMealPlans(first: 100).toJson(),
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
      }
    } catch (e) {
      _errorMessage = UIErrorHandler.mapExceptionToMessage(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchMealPlansByRestaurant(String restaurantIri) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final options = QueryOptions(
        document: documentNodeQueryGetMealPlansByRestaurant,
        variables: Variables$Query$GetMealPlansByRestaurant(
          restaurantId: restaurantIri,
          first: 20,
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
            .whereType<
              Query$GetMealPlansByRestaurant$restaurant$mealPlans$edges$node
            >()
            .map((e) {
              final dietCategoriesNode = e.dietCategories;
              return MealPlan(
                id: e.id,
                name: e.name,
                description: e.description,
                price: e.price,
                imageUrl: e.imageUrl,
                dietCategories: dietCategoriesNode != null
                    ? Query$GetMealPlans$mealPlans$edges$node$dietCategories(
                        edges: dietCategoriesNode.edges?.map((edge) {
                          if (edge?.node == null) return null;
                          return Query$GetMealPlans$mealPlans$edges$node$dietCategories$edges(
                            node:
                                Query$GetMealPlans$mealPlans$edges$node$dietCategories$edges$node(
                                  id: edge!.node!.id,
                                  name: edge.node!.name,
                                  $__typename: edge.node!.$__typename,
                                ),
                            $__typename: edge.$__typename,
                          );
                        }).toList(),
                        $__typename: dietCategoriesNode.$__typename,
                      )
                    : null,
                $__typename: e.$__typename,
              );
            })
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

  Future<void> loadMoreMealPlans(String restaurantIri) async {
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
            .whereType<
              Query$GetMealPlansByRestaurant$restaurant$mealPlans$edges$node
            >()
            .map((e) {
              final dietCategoriesNode = e.dietCategories;
              return MealPlan(
                id: e.id,
                name: e.name,
                description: e.description,
                price: e.price,
                imageUrl: e.imageUrl,
                dietCategories: dietCategoriesNode != null
                    ? Query$GetMealPlans$mealPlans$edges$node$dietCategories(
                        edges: dietCategoriesNode.edges?.map((edge) {
                          if (edge?.node == null) return null;
                          return Query$GetMealPlans$mealPlans$edges$node$dietCategories$edges(
                            node:
                                Query$GetMealPlans$mealPlans$edges$node$dietCategories$edges$node(
                                  id: edge!.node!.id,
                                  name: edge.node!.name,
                                  $__typename: edge.node!.$__typename,
                                ),
                            $__typename: edge.$__typename,
                          );
                        }).toList(),
                        $__typename: dietCategoriesNode.$__typename,
                      )
                    : null,
                $__typename: e.$__typename,
              );
            })
            .toList();
        _mealPlans.addAll(newMealPlans);
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
          ),
        ).toJson(),
      );

      final result = await _client.mutate(options);

      if (result.hasException) {
        throw ApiException(result.exception.toString());
      }

      return Mutation$CreateMealPlan.fromJson(
        result.data!,
      ).createMealPlan?.mealPlan?.id;
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

  void clearStatus() {
    _errorMessage = null;
    notifyListeners();
  }

  Future<void> updateMealPlanImage(
    String mealPlanIri,
    List<int> imageBytes,
    String filename,
  ) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _apiClient.postMultipart(
        '$mealPlanIri/image',
        imageBytes,
        filename,
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        await getMealPlanById(mealPlanIri);
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
