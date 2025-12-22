import 'package:catering_flutter/graphql/restaurant_categories.graphql.dart';
import 'package:catering_flutter/graphql/schema.graphql.dart';
import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:catering_flutter/core/services/api_service.dart';

import 'package:catering_flutter/core/utils/ui_error_handler.dart';

typedef RestaurantCategory =
    Query$GetRestaurantCategories$restaurantCategories$edges$node;
typedef RestaurantCategoryDetails =
    Query$GetRestaurantCategory$restaurantCategory;

class RestaurantCategoryService extends ChangeNotifier {
  final GraphQLClient _client;

  List<RestaurantCategory> _restaurantCategories = [];
  List<RestaurantCategory> get restaurantCategories => _restaurantCategories;

  RestaurantCategoryDetails? _currentRestaurantCategory;
  RestaurantCategoryDetails? get currentRestaurantCategory =>
      _currentRestaurantCategory;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool get hasError => _errorMessage != null;

  RestaurantCategoryService(this._client);

  Future<void> getRestaurantCategories() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final options = QueryOptions(
        document: documentNodeQueryGetRestaurantCategories,
        variables: Variables$Query$GetRestaurantCategories(first: 100).toJson(),
        fetchPolicy: FetchPolicy.networkOnly,
      );
      final result = await _client.query(options);
      ApiService.check(result);

      final data = Query$GetRestaurantCategories.fromJson(result.data!);
      if (data.restaurantCategories?.edges != null) {
        _restaurantCategories = data.restaurantCategories!.edges!
            .map((e) => e?.node)
            .whereType<RestaurantCategory>()
            .toList();
      }
    } catch (e) {
      _errorMessage = UIErrorHandler.mapExceptionToMessage(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getRestaurantCategoryById(String id) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final options = QueryOptions(
        document: documentNodeQueryGetRestaurantCategory,
        variables: Variables$Query$GetRestaurantCategory(id: id).toJson(),
        fetchPolicy: FetchPolicy.networkOnly,
      );
      final result = await _client.query(options);
      ApiService.check(result);

      _currentRestaurantCategory = Query$GetRestaurantCategory.fromJson(
        result.data!,
      ).restaurantCategory;
    } catch (e) {
      _errorMessage = UIErrorHandler.mapExceptionToMessage(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> createRestaurantCategory(String name) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final options = MutationOptions(
        document: documentNodeMutationCreateRestaurantCategory,
        variables: Variables$Mutation$CreateRestaurantCategory(
          input: Input$createRestaurantCategoryInput(name: name),
        ).toJson(),
      );
      final result = await _client.mutate(options);
      ApiService.check(result);
    } catch (e) {
      _errorMessage = UIErrorHandler.mapExceptionToMessage(e);
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateRestaurantCategory(String id, String name) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final options = MutationOptions(
        document: documentNodeMutationUpdateRestaurantCategory,
        variables: Variables$Mutation$UpdateRestaurantCategory(
          input: Input$updateRestaurantCategoryInput(id: id, name: name),
        ).toJson(),
      );
      final result = await _client.mutate(options);
      ApiService.check(result);
    } catch (e) {
      _errorMessage = UIErrorHandler.mapExceptionToMessage(e);
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deleteRestaurantCategory(String id) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final options = MutationOptions(
        document: documentNodeMutationDeleteRestaurantCategory,
        variables: Variables$Mutation$DeleteRestaurantCategory(
          input: Input$deleteRestaurantCategoryInput(id: id),
        ).toJson(),
      );
      final result = await _client.mutate(options);
      ApiService.check(result);

      _restaurantCategories.removeWhere((c) => c.id == id);
    } catch (e) {
      _errorMessage = UIErrorHandler.mapExceptionToMessage(e);
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
