import 'dart:convert';
import 'package:catering_flutter/core/utils/iri_helper.dart';
import 'package:catering_flutter/graphql/deliveries.graphql.dart';
import 'package:catering_flutter/graphql/restaurants.graphql.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:catering_flutter/graphql/users.graphql.dart';
import 'package:catering_flutter/core/services/api_service.dart';
import 'package:catering_flutter/graphql/schema.graphql.dart';
import 'package:catering_flutter/core/services/auth_service.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';

typedef UserNode = Query$GetUsers$users$edges$node;
typedef RestaurantCourierNode =
    Query$GetCouriersByRestaurant$restaurant$couriers$edges$node;
typedef CurrentUserData = Query$GetUser$user;

class UserService extends ChangeNotifier {
  final GraphQLClient _client;
  final AuthService _authService;
  final ApiService _apiClient;

  List<UserNode> _users = [];
  List<UserNode> get users => _users;

  // Pagination state
  String? _endCursor;
  bool _hasNextPage = false;
  bool get hasNextPage => _hasNextPage;
  bool _isFetchingMore = false;
  bool get isFetchingMore => _isFetchingMore;

  int _totalItems = 0;
  int get totalItems => _totalItems;

  int _totalUserDeliveries = 0;
  int get totalUserDeliveries => _totalUserDeliveries;

  int _totalCouriers = 0;
  int get totalCouriers => _totalCouriers;

  // Filters state
  String? _currentSearchQuery;
  String? _currentRoleFilter;

  // Using dynamic for currentUser to accommodate different query results
  dynamic _currentUser;

  dynamic get currentUser => _currentUser;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  bool get hasError => _errorMessage != null;

  UserService(this._client, this._authService, this._apiClient);

  Future<void> fetchAllUsers({String? searchQuery, String? roleFilter}) async {
    _isLoading = true;
    _errorMessage = null;
    _currentSearchQuery = searchQuery;
    _currentRoleFilter = roleFilter;
    _users = [];
    _totalItems = 0;
    notifyListeners();

    try {
      final options = QueryOptions(
        document: documentNodeQueryGetUsers,
        variables: Variables$Query$GetUsers(
          first: 20,
          search: searchQuery,
          role: roleFilter,
        ).toJson(),
        fetchPolicy: FetchPolicy.networkOnly,
      );

      final result = await _client.query(options);
      ApiService.check(result);

      final data = Query$GetUsers.fromJson(result.data!);
      if (data.users?.edges != null) {
        _users = data.users!.edges!
            .map((e) => e?.node)
            .whereType<UserNode>()
            .toList();
        _endCursor = data.users?.pageInfo.endCursor;
        _hasNextPage = data.users?.pageInfo.hasNextPage ?? false;
        _totalItems = data.users?.totalCount ?? 0;
      }
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadMoreUsers() async {
    if (_isFetchingMore || !_hasNextPage || _endCursor == null) return;

    _isFetchingMore = true;
    notifyListeners();

    try {
      final options = QueryOptions(
        document: documentNodeQueryGetUsers,
        variables: Variables$Query$GetUsers(
          first: 20,
          after: _endCursor,
          search: _currentSearchQuery,
          role: _currentRoleFilter,
        ).toJson(),
        fetchPolicy: FetchPolicy.networkOnly,
      );

      final result = await _client.query(options);
      ApiService.check(result);

      final data = Query$GetUsers.fromJson(result.data!);
      if (data.users?.edges != null) {
        final newUsers = data.users!.edges!
            .map((e) => e?.node)
            .whereType<UserNode>()
            .toList();
        _users = [..._users, ...newUsers];
        _endCursor = data.users?.pageInfo.endCursor;
        _hasNextPage = data.users?.pageInfo.hasNextPage ?? false;
        _totalItems = data.users?.totalCount ?? 0;
      }
    } catch (e) {
      _errorMessage = UIErrorHandler.mapExceptionToMessage(e);
    } finally {
      _isFetchingMore = false;
      notifyListeners();
    }
  }

  Future<void> getUserById(String userIri) async {
    _isLoading = true;
    _errorMessage = null;
    _currentUser = null;
    notifyListeners();

    try {
      final options = QueryOptions(
        document: documentNodeQueryGetUser,
        variables: Variables$Query$GetUser(id: userIri).toJson(),
        fetchPolicy: FetchPolicy.networkOnly,
      );

      final result = await _client.query(options);
      ApiService.check(result);

      _currentUser = Query$GetUser.fromJson(result.data!).user;
    } catch (e) {
      _errorMessage = UIErrorHandler.mapExceptionToMessage(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchCurrentUser() async {
    _isLoading = true;
    _errorMessage = null;
    _currentUser = null;
    notifyListeners();

    try {
      final userIri = await _authService.getUserIriFromStorage();
      if (userIri == null) {
        throw ApiException('User ID not found in storage');
      }

      final options = QueryOptions(
        document: documentNodeQueryGetUser,
        variables: Variables$Query$GetUser(id: userIri).toJson(),
        fetchPolicy: FetchPolicy.networkOnly,
      );

      final result = await _client.query(options);
      ApiService.check(result);

      _currentUser = Query$GetUser.fromJson(result.data!).user;
    } catch (e) {
      _errorMessage = UIErrorHandler.mapExceptionToMessage(e);
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchCurrentRestaurant() async {
    _isLoading = true;
    _errorMessage = null;
    _currentUser = null;
    notifyListeners();

    try {
      final userIri = await _authService.getUserIriFromStorage();
      if (userIri == null) {
        throw ApiException('User ID not found in storage');
      }

      final options = QueryOptions(
        document: documentNodeQueryGetUserRestaurant,
        variables: Variables$Query$GetUserRestaurant(id: userIri).toJson(),
        fetchPolicy: FetchPolicy.networkOnly,
      );
      final result = await _client.query(options);
      ApiService.check(result);

      _currentUser = Query$GetUserRestaurant.fromJson(result.data!).user;
    } catch (e) {
      _errorMessage = UIErrorHandler.mapExceptionToMessage(e);
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Specific pagination for user deliveries
  List<Fragment$CourierDeliveryFragment> _userDeliveries = [];
  List<Fragment$CourierDeliveryFragment> get userDeliveries => _userDeliveries;
  String? _userDeliveriesEndCursor;
  bool _userDeliveriesHasNextPage = false;
  bool get userDeliveriesHasNextPage => _userDeliveriesHasNextPage;
  bool _isFetchingMoreUserDeliveries = false;
  bool get isFetchingMoreUserDeliveries => _isFetchingMoreUserDeliveries;

  List<Enum$DeliveryStatus>? _currentDeliveryStatuses;
  Input$DeliveryFilter_order? _currentSortOrder;
  DateTimeRange? _currentDateRange;

  Future<void> fetchCurrentUserWithDeliveries({
    List<Enum$DeliveryStatus>? statuses,
    String? searchQuery,
    Input$DeliveryFilter_order? sortOrder,
    DateTimeRange? dateRange,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    _currentUser = null;
    _currentDeliveryStatuses = statuses;
    _currentSearchQuery = searchQuery;
    _currentSortOrder = sortOrder;
    _currentDateRange = dateRange;
    _userDeliveriesEndCursor = null;
    _userDeliveriesHasNextPage = false;

    // Clear existing list to ensure loading state is visible and old data is removed
    _userDeliveries = [];
    _totalUserDeliveries = 0;

    notifyListeners();

    try {
      final userIri = await _authService.getUserIriFromStorage();
      if (userIri == null) {
        throw ApiException('User ID not found in storage');
      }

      List<Input$DeliveryFilter_deliveryDate>? deliveryDateFilter;
      if (dateRange != null) {
        deliveryDateFilter = [
          Input$DeliveryFilter_deliveryDate(
            after: dateRange.start.toIso8601String().split('T')[0],
            before: dateRange.end.toIso8601String().split('T')[0],
          ),
        ];
      }

      final options = QueryOptions(
        document: documentNodeQueryGetUserDeliveries,
        variables: Variables$Query$GetUserDeliveries(
          id: userIri,
          first: 20,
          status: statuses?.map((e) => e.name).toList(),
          search: searchQuery,
          order: sortOrder != null ? [sortOrder] : null,
          deliveryDate: deliveryDateFilter,
        ).toJson(),
        fetchPolicy: FetchPolicy.networkOnly,
      );
      final result = await _client.query(options);
      ApiService.check(result);

      final data = Query$GetUserDeliveries.fromJson(result.data!);
      _currentUser = data.user;

      if (data.user?.deliveries?.edges != null) {
        _userDeliveries = data.user!.deliveries!.edges!
            .map((e) => e?.node)
            .whereType<Fragment$CourierDeliveryFragment>()
            .toList();
        _userDeliveriesEndCursor = data.user!.deliveries!.pageInfo.endCursor;
        _userDeliveriesHasNextPage =
            data.user!.deliveries!.pageInfo.hasNextPage;
        _totalUserDeliveries = data.user!.deliveries!.totalCount;
      } else {
        _userDeliveries = [];
        _totalUserDeliveries = 0;
      }
    } catch (e) {
      _errorMessage = UIErrorHandler.mapExceptionToMessage(e);
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadMoreCurrentUserDeliveries() async {
    if (_isFetchingMoreUserDeliveries ||
        !_userDeliveriesHasNextPage ||
        _userDeliveriesEndCursor == null) {
      return;
    }

    _isFetchingMoreUserDeliveries = true;
    notifyListeners();

    try {
      final userIri = await _authService.getUserIriFromStorage();
      if (userIri == null) return;

      List<Input$DeliveryFilter_deliveryDate>? deliveryDateFilter;
      if (_currentDateRange != null) {
        deliveryDateFilter = [
          Input$DeliveryFilter_deliveryDate(
            after: _currentDateRange!.start.toIso8601String().split('T')[0],
            before: _currentDateRange!.end.toIso8601String().split('T')[0],
          ),
        ];
      }

      final options = QueryOptions(
        document: documentNodeQueryGetUserDeliveries,
        variables: Variables$Query$GetUserDeliveries(
          id: userIri,
          first: 20,
          after: _userDeliveriesEndCursor,
          status: _currentDeliveryStatuses?.map((e) => e.name).toList(),
          search: _currentSearchQuery,
          order: _currentSortOrder != null ? [_currentSortOrder!] : null,
          deliveryDate: deliveryDateFilter,
        ).toJson(),
        fetchPolicy: FetchPolicy.networkOnly,
      );
      final result = await _client.query(options);
      ApiService.check(result);

      final data = Query$GetUserDeliveries.fromJson(result.data!);
      if (data.user?.deliveries?.edges != null) {
        final newDeliveries = data.user!.deliveries!.edges!
            .map((e) => e?.node)
            .whereType<Fragment$CourierDeliveryFragment>()
            .toList();
        _userDeliveries = [..._userDeliveries, ...newDeliveries];
        _userDeliveriesEndCursor = data.user!.deliveries!.pageInfo.endCursor;
        _userDeliveriesHasNextPage =
            data.user!.deliveries!.pageInfo.hasNextPage;
        _totalUserDeliveries = data.user!.deliveries!.totalCount;
      }
    } catch (e) {
      _errorMessage = UIErrorHandler.mapExceptionToMessage(e);
    } finally {
      _isFetchingMoreUserDeliveries = false;
      notifyListeners();
    }
  }

  void updateUserDelivery(Fragment$CourierDeliveryFragment updatedDelivery) {
    final index = _userDeliveries.indexWhere((d) => d.id == updatedDelivery.id);
    if (index != -1) {
      _userDeliveries[index] = updatedDelivery;

      // If the delivery status no longer matches current filters, we might want to remove it
      // For CourierDashboard, it filters by status.
      if (_currentDeliveryStatuses != null &&
          !_currentDeliveryStatuses!.contains(updatedDelivery.status)) {
        _userDeliveries.removeAt(index);
      }

      notifyListeners();
    }
  }

  Future<void> updateUserRoles(String userIri, List<String> roles) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final options = MutationOptions(
        document: documentNodeMutationUpdateUser,
        variables: Variables$Mutation$UpdateUser(
          input: Input$updateUserInput(id: userIri, roles: roles),
        ).toJson(),
      );
      final result = await _client.mutate(options);
      ApiService.check(result);

      // Extract the updated user from the mutation response
      final updatedUser = Mutation$UpdateUser.fromJson(
        result.data!,
      ).updateUser?.user;

      if (updatedUser != null) {
        // Find and update the user in the local list
        final index = _users.indexWhere((u) => u.id == updatedUser.id);
        if (index != -1) {
          // Convert the mutation response to UserNode type
          // Since the mutation response has the same fields, we can create a UserNode from it
          _users[index] = Query$GetUsers$users$edges$node(
            id: updatedUser.id,
            email: updatedUser.email,
            roles: updatedUser.roles,
          );
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

  // NOTE: updateUserRestaurant has been removed as User no longer has a restaurant field.
  // Courier assignment is now managed via Restaurant.couriers collection.

  Future<void> deleteUser(String userIri) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final options = MutationOptions(
        document: documentNodeMutationDeleteUser,
        variables: Variables$Mutation$DeleteUser(
          input: Input$deleteUserInput(id: userIri),
        ).toJson(),
      );
      final result = await _client.mutate(options);
      ApiService.check(result);
      _users.removeWhere((u) => u.id == userIri);
      _restaurantCouriers.removeWhere((u) => u.id == userIri);
    } catch (e) {
      _errorMessage = UIErrorHandler.mapExceptionToMessage(e);
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  List<RestaurantCourierNode> _restaurantCouriers = [];

  List<RestaurantCourierNode> get restaurantCouriers => _restaurantCouriers;

  Future<void> fetchCouriersByRestaurant(
    String restaurantIri, {
    String? searchQuery,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    _restaurantCouriers = [];
    _totalCouriers = 0;
    notifyListeners();

    try {
      final options = QueryOptions(
        document: documentNodeQueryGetCouriersByRestaurant,
        variables: Variables$Query$GetCouriersByRestaurant(
          id: restaurantIri,
          search: searchQuery,
        ).toJson(),
        fetchPolicy: FetchPolicy.networkOnly,
      );

      final result = await _client.query(options);
      ApiService.check(result);

      final data = Query$GetCouriersByRestaurant.fromJson(result.data!);
      final edges = data.restaurant?.couriers?.edges;

      if (edges != null) {
        _restaurantCouriers = edges
            .map((e) => e?.node)
            .whereType<RestaurantCourierNode>()
            .toList();
        _totalCouriers = data.restaurant?.couriers?.totalCount ?? 0;
      } else {
        _restaurantCouriers = [];
      }
    } catch (e) {
      _errorMessage = UIErrorHandler.mapExceptionToMessage(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  List<UserNode> _restaurantOwners = [];

  List<UserNode> get restaurantOwners => _restaurantOwners;

  Future<void> fetchRestaurantOwners() async {
    _isLoading = true;
    _errorMessage = null;
    _restaurantOwners = [];
    notifyListeners();

    try {
      final options = QueryOptions(
        document: documentNodeQueryGetUsers,
        variables: Variables$Query$GetUsers(
          first: 100,
          role: 'ROLE_RESTAURANT',
        ).toJson(),
        fetchPolicy: FetchPolicy.networkOnly,
      );

      final result = await _client.query(options);
      ApiService.check(result);

      final data = Query$GetUsers.fromJson(result.data!);
      if (data.users?.edges != null) {
        _restaurantOwners = data.users!.edges!
            .map((e) => e?.node)
            .whereType<UserNode>()
            .toList();
      }
    } catch (e) {
      _errorMessage = UIErrorHandler.mapExceptionToMessage(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> createCourier(String email, {String? restaurantIri}) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final body = <String, dynamic>{'email': email};
      if (restaurantIri != null) {
        body['restaurantId'] = IriHelper.getId(restaurantIri);
      }

      final response = await _apiClient.post('/api/invite-courier', body: body);

      if (response.statusCode == 201) {
        final data = jsonDecode(response.body);
        final newNode = RestaurantCourierNode(
          id: IriHelper.buildIri('users', (data['id'] as int).toString()),
          email: data['email'],
          roles: List<String>.from(data['roles']),
        );
        _restaurantCouriers.add(newNode);
      } else {
        final error =
            jsonDecode(response.body)['error'] ?? 'Failed to invite courier';
        throw ApiException(error);
      }
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
