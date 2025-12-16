import 'dart:convert';
import 'package:catering_flutter/core/utils/iri_helper.dart';
import 'package:catering_flutter/graphql/deliveries.graphql.dart';
import 'package:catering_flutter/graphql/restaurants.graphql.dart';
import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:catering_flutter/graphql/users.graphql.dart';
import 'package:catering_flutter/core/services/api_service.dart';
import 'package:catering_flutter/graphql/schema.graphql.dart';
import 'package:catering_flutter/core/services/auth_service.dart';

typedef UserNode = Query$GetUsers$users$edges$node;
typedef RestaurantUserNode =
    Query$GetUsersByRestaurant$restaurant$users$edges$node;
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

      if (result.hasException) {
        throw ApiException(result.exception.toString());
      }

      final data = Query$GetUsers.fromJson(result.data!);
      if (data.users?.edges != null) {
        _users = data.users!.edges!
            .map((e) => e?.node)
            .whereType<UserNode>()
            .toList();
        _endCursor = data.users?.pageInfo.endCursor;
        _hasNextPage = data.users?.pageInfo.hasNextPage ?? false;
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

      if (result.hasException) {
        throw ApiException(result.exception.toString());
      }

      final data = Query$GetUsers.fromJson(result.data!);
      if (data.users?.edges != null) {
        final newUsers = data.users!.edges!
            .map((e) => e?.node)
            .whereType<UserNode>()
            .toList();
        _users = [..._users, ...newUsers];
        _endCursor = data.users?.pageInfo.endCursor;
        _hasNextPage = data.users?.pageInfo.hasNextPage ?? false;
      }
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isFetchingMore = false;
      notifyListeners();
    }
  }

  Future<void> getUserById(String userIri) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final options = QueryOptions(
        document: documentNodeQueryGetUser,
        variables: Variables$Query$GetUser(id: userIri).toJson(),
        fetchPolicy: FetchPolicy.networkOnly,
      );

      final result = await _client.query(options);

      if (result.hasException) {
        throw ApiException(result.exception.toString());
      }

      _currentUser = Query$GetUser.fromJson(result.data!).user;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchCurrentUser() async {
    _isLoading = true;
    _errorMessage = null;
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

      if (result.hasException) {
        throw ApiException(result.exception.toString());
      }

      _currentUser = Query$GetUser.fromJson(result.data!).user;
    } catch (e) {
      _errorMessage = e.toString();
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchCurrentRestaurant() async {
    _isLoading = true;
    _errorMessage = null;
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

      if (result.hasException) {
        throw ApiException(result.exception.toString());
      }

      _currentUser = Query$GetUserRestaurant.fromJson(result.data!).user;
    } catch (e) {
      _errorMessage = e.toString();
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Specific pagination for user deliveries
  List<Fragment$DriverDeliveryFragment> _userDeliveries = [];
  List<Fragment$DriverDeliveryFragment> get userDeliveries => _userDeliveries;
  String? _userDeliveriesEndCursor;
  bool _userDeliveriesHasNextPage = false;
  bool get userDeliveriesHasNextPage => _userDeliveriesHasNextPage;
  bool _isFetchingMoreUserDeliveries = false;
  bool get isFetchingMoreUserDeliveries => _isFetchingMoreUserDeliveries;

  List<Enum$DeliveryStatus>? _currentDeliveryStatuses;
  Input$DeliveryFilter_order? _currentSortOrder;

  Future<void> fetchCurrentUserWithDeliveries({
    List<Enum$DeliveryStatus>? statuses,
    String? searchQuery,
    Input$DeliveryFilter_order? sortOrder,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    _currentDeliveryStatuses = statuses;
    _currentSearchQuery = searchQuery;
    _currentSortOrder = sortOrder;
    _userDeliveriesEndCursor = null;
    _userDeliveriesHasNextPage = false;

    // Clear existing list to ensure loading state is visible and old data is removed
    _userDeliveries = [];

    notifyListeners();

    try {
      final userIri = await _authService.getUserIriFromStorage();
      if (userIri == null) {
        throw ApiException('User ID not found in storage');
      }

      final options = QueryOptions(
        document: documentNodeQueryGetUserDeliveries,
        variables: Variables$Query$GetUserDeliveries(
          id: userIri,
          first: 20,
          status: statuses?.map((e) => e.name).toList(),
          search: searchQuery,
          order: sortOrder != null ? [sortOrder] : null,
        ).toJson(),
        fetchPolicy: FetchPolicy.networkOnly,
      );
      final result = await _client.query(options);

      if (result.hasException) {
        throw ApiException(result.exception.toString());
      }

      final data = Query$GetUserDeliveries.fromJson(result.data!);
      _currentUser = data.user;

      if (data.user?.deliveries?.edges != null) {
        _userDeliveries = data.user!.deliveries!.edges!
            .map((e) => e?.node)
            .whereType<Fragment$DriverDeliveryFragment>()
            .toList();
        _userDeliveriesEndCursor = data.user!.deliveries!.pageInfo.endCursor;
        _userDeliveriesHasNextPage =
            data.user!.deliveries!.pageInfo.hasNextPage;
      } else {
        _userDeliveries = [];
      }
    } catch (e) {
      _errorMessage = e.toString();
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

      final options = QueryOptions(
        document: documentNodeQueryGetUserDeliveries,
        variables: Variables$Query$GetUserDeliveries(
          id: userIri,
          first: 20,
          after: _userDeliveriesEndCursor,
          status: _currentDeliveryStatuses?.map((e) => e.name).toList(),
          search: _currentSearchQuery,
          order: _currentSortOrder != null ? [_currentSortOrder!] : null,
        ).toJson(),
        fetchPolicy: FetchPolicy.networkOnly,
      );
      final result = await _client.query(options);

      if (result.hasException) {
        throw ApiException(result.exception.toString());
      }
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isFetchingMoreUserDeliveries = false;
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

      if (result.hasException) {
        throw ApiException(result.exception.toString());
      }

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
      _errorMessage = e.toString();
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateUserRestaurant(
    String userIri,
    String restaurantIri,
  ) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final options = MutationOptions(
        document: documentNodeMutationUpdateUser,
        variables: Variables$Mutation$UpdateUser(
          input: Input$updateUserInput(id: userIri, restaurant: restaurantIri),
        ).toJson(),
      );
      final result = await _client.mutate(options);

      if (result.hasException) {
        throw ApiException(result.exception.toString());
      }
    } catch (e) {
      _errorMessage = e.toString();
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

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

      if (result.hasException) {
        throw ApiException(result.exception.toString());
      }
      _users.removeWhere((u) => u.id == userIri);
      _restaurantDrivers.removeWhere((u) => u.id == userIri);
    } catch (e) {
      _errorMessage = e.toString();
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  List<RestaurantUserNode> _restaurantDrivers = [];

  List<RestaurantUserNode> get restaurantDrivers => _restaurantDrivers;

  Future<void> fetchDriversByRestaurant(
    String restaurantIri, {
    String? searchQuery,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final options = QueryOptions(
        document: documentNodeQueryGetUsersByRestaurant,
        variables: Variables$Query$GetUsersByRestaurant(
          id: restaurantIri,
          search: searchQuery,
          role: 'ROLE_DRIVER',
        ).toJson(),
        fetchPolicy: FetchPolicy.networkOnly,
      );

      final result = await _client.query(options);

      if (result.hasException) {
        throw ApiException(result.exception.toString());
      }

      final data = Query$GetUsersByRestaurant.fromJson(result.data!);
      final edges = data.restaurant?.users?.edges;

      if (edges != null) {
        _restaurantDrivers = edges
            .map((e) => e?.node)
            .whereType<RestaurantUserNode>()
            .toList();
      } else {
        _restaurantDrivers = [];
      }
    } catch (e) {
      _errorMessage = e.toString();
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
    notifyListeners();

    try {
      final options = QueryOptions(
        document: documentNodeQueryGetUsers,
        variables: Variables$Query$GetUsers(first: 100).toJson(),
        fetchPolicy: FetchPolicy.networkOnly,
      );

      final result = await _client.query(options);

      if (result.hasException) {
        throw ApiException(result.exception.toString());
      }

      final data = Query$GetUsers.fromJson(result.data!);
      if (data.users?.edges != null) {
        final allUsers = data.users!.edges!
            .map((e) => e?.node)
            .whereType<UserNode>()
            .toList();
        _restaurantOwners = allUsers
            .where((u) => u.roles.contains('ROLE_RESTAURANT'))
            .toList();
      }
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> createDriver(String email, {String? restaurantIri}) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final body = <String, dynamic>{'email': email};
      if (restaurantIri != null) {
        body['restaurantId'] = IriHelper.getId(restaurantIri);
      }

      final response = await _apiClient.post('/api/invite-driver', body: body);

      if (response.statusCode == 201) {
        final data = jsonDecode(response.body);
        final newNode = RestaurantUserNode(
          id: IriHelper.buildIri('users', (data['id'] as int).toString()),
          email: data['email'],
          roles: List<String>.from(data['roles']),
        );
        _restaurantDrivers.add(newNode);
      } else {
        final error =
            jsonDecode(response.body)['error'] ?? 'Failed to invite driver';
        throw ApiException(error);
      }
    } catch (e) {
      _errorMessage = e.toString();
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
