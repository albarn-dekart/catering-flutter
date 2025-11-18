import 'package:flutter/foundation.dart';
import 'package:catering_flutter/core/api_service.dart';
import 'package:catering_flutter/features/authentication/models/user.dart';

class UserService extends ChangeNotifier {
  final ApiService _apiService;

  List<User> _users = [];
  bool _isLoading = false;
  String? _errorMessage;
  bool _isSuccess = false;

  UserService({required ApiService apiService}) : _apiService = apiService;

  List<User> get users => _users;
  bool get isLoading => _isLoading;
  bool get hasError => _errorMessage != null;
  String? get errorMessage => _errorMessage;
  bool get isSuccess => _isSuccess;

  Future<void> fetchAllUsers() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _users = await _apiService.getCollection<User>(
        'users',
        fromJson: User.fromJson,
      );
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateUserRoles(int userId, List<String> roles) async {
    _isLoading = true;
    _errorMessage = null;
    _isSuccess = false;
    notifyListeners();

    try {
      await _apiService.patch('users/$userId', {'roles': roles});
      _isSuccess = true;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deleteUser(int userId) async {
    _isLoading = true;
    _errorMessage = null;
    _isSuccess = false;
    notifyListeners();

    try {
      await _apiService.delete('users/$userId');
      _isSuccess = true;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearStatus() {
    _errorMessage = null;
    _isSuccess = false;
    notifyListeners();
  }
}
