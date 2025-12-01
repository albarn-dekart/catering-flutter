import 'package:catering_flutter/graphql/deliveries.graphql.dart';
import 'package:catering_flutter/graphql/restaurants.graphql.dart';
import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:catering_flutter/graphql/users.graphql.dart';
import 'package:catering_flutter/core/api_exception.dart';
import 'package:catering_flutter/graphql/schema.graphql.dart';

import 'package:catering_flutter/core/token_storage_service.dart';

typedef UserNode = Query$GetUsers$users$edges$node;
typedef RestaurantUserNode =
    Query$GetUsersByRestaurant$restaurant$users$edges$node;
typedef CurrentUserData = Query$GetUser$user;

class UserService extends ChangeNotifier {
  final GraphQLClient _client;
  final TokenStorageService _tokenStorage;

  List<UserNode> _users = [];

  List<UserNode> get users => _users;

  // Using dynamic for currentUser to accommodate different query results
  dynamic _currentUser;

  dynamic get currentUser => _currentUser;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  bool get hasError => _errorMessage != null;

  UserService(this._client, this._tokenStorage);

  Future<void> fetchAllUsers() async {
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
        _users = data.users!.edges!
            .map((e) => e?.node)
            .whereType<UserNode>()
            .toList();
      }
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
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
      final userIri = await _tokenStorage.getUserIri();
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
      final userIri = await _tokenStorage.getUserIri();
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

  Future<void> fetchCurrentUserWithDeliveries() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final userIri = await _tokenStorage.getUserIri();
      if (userIri == null) {
        throw ApiException('User ID not found in storage');
      }

      final options = QueryOptions(
        document: documentNodeQueryGetUserDeliveries,
        variables: Variables$Query$GetUserDeliveries(id: userIri).toJson(),
        fetchPolicy: FetchPolicy.networkOnly,
      );
      final result = await _client.query(options);

      if (result.hasException) {
        throw ApiException(result.exception.toString());
      }

      _currentUser = Query$GetUserDeliveries.fromJson(result.data!).user;
    } catch (e) {
      _errorMessage = e.toString();
      rethrow;
    } finally {
      _isLoading = false;
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

  Future<void> fetchDriversByRestaurant(String restaurantIri) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final options = QueryOptions(
        document: documentNodeQueryGetUsersByRestaurant,
        variables: Variables$Query$GetUsersByRestaurant(
          id: restaurantIri,
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
        final allRestaurantUsers = edges
            .map((e) => e?.node)
            .whereType<RestaurantUserNode>()
            .toList();

        _restaurantDrivers = allRestaurantUsers
            .where((u) => u.roles.contains('ROLE_DRIVER'))
            .toList();
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
}
