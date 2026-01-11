import 'package:catering_flutter/graphql/diet_categories.graphql.dart';
import 'package:catering_flutter/graphql/schema.graphql.dart';
import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:catering_flutter/core/services/api_service.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';

typedef DietCategory = Query$GetDietCategories$dietCategories$edges$node;
typedef DietCategoryDetails = Query$GetDietCategory$dietCategory;

class DietCategoryService extends ChangeNotifier {
  final GraphQLClient _client;

  List<DietCategory> _dietCategories = [];
  List<DietCategory> get dietCategories => _dietCategories;

  DietCategoryDetails? _currentDietCategory;
  DietCategoryDetails? get currentDietCategory => _currentDietCategory;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool get hasError => _errorMessage != null;

  int _totalItems = 0;
  int get totalItems => _totalItems;

  DietCategoryService(this._client);

  Future<void> getDietCategories() async {
    _isLoading = true;
    _errorMessage = null;
    _totalItems = 0;
    notifyListeners();

    try {
      final options = QueryOptions(
        document: documentNodeQueryGetDietCategories,
        variables: Variables$Query$GetDietCategories(first: 100).toJson(),
        fetchPolicy: FetchPolicy.networkOnly,
      );
      final result = await _client.query(options);
      ApiService.check(result);

      final data = Query$GetDietCategories.fromJson(result.data!);
      if (data.dietCategories?.edges != null) {
        _dietCategories = data.dietCategories!.edges!
            .map((e) => e?.node)
            .whereType<DietCategory>()
            .toList();
        _totalItems = data.dietCategories?.totalCount ?? 0;
      }
    } catch (e) {
      _errorMessage = UIErrorHandler.mapExceptionToMessage(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getDietCategoryById(String id) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final options = QueryOptions(
        document: documentNodeQueryGetDietCategory,
        variables: Variables$Query$GetDietCategory(id: id).toJson(),
        fetchPolicy: FetchPolicy.networkOnly,
      );
      final result = await _client.query(options);
      ApiService.check(result);

      _currentDietCategory = Query$GetDietCategory.fromJson(
        result.data!,
      ).dietCategory;
    } catch (e) {
      _errorMessage = UIErrorHandler.mapExceptionToMessage(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> createDietCategory(String name) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final options = MutationOptions(
        document: documentNodeMutationCreateDietCategory,
        variables: Variables$Mutation$CreateDietCategory(
          input: Input$createDietCategoryInput(name: name),
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

  Future<void> updateDietCategory(String id, String name) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final options = MutationOptions(
        document: documentNodeMutationUpdateDietCategory,
        variables: Variables$Mutation$UpdateDietCategory(
          input: Input$updateDietCategoryInput(id: id, name: name),
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

  Future<void> deleteDietCategory(String id) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final options = MutationOptions(
        document: documentNodeMutationDeleteDietCategory,
        variables: Variables$Mutation$DeleteDietCategory(
          input: Input$deleteDietCategoryInput(id: id),
        ).toJson(),
      );
      final result = await _client.mutate(options);
      ApiService.check(result);

      _dietCategories.removeWhere((c) => c.id == id);
    } catch (e) {
      _errorMessage = UIErrorHandler.mapExceptionToMessage(e);
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}
