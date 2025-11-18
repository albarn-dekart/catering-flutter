import 'package:flutter/foundation.dart';
import 'package:catering_flutter/core/api_service.dart';
import 'package:catering_flutter/core/token_storage_service.dart';
import 'package:catering_flutter/features/authentication/models/login_request_model.dart';
import 'package:catering_flutter/features/authentication/models/register_request_model.dart';
import 'package:catering_flutter/features/authentication/models/user.dart';

class AuthService extends ChangeNotifier {
  final ApiService _apiService;
  final TokenStorageService _tokenStorage;
  bool _isAuthenticated = false;
  User? _user;
  bool _isLoading = false;
  String? _errorMessage;

  AuthService({
    required ApiService apiService,
    required TokenStorageService tokenStorage,
  }) : _apiService = apiService,
       _tokenStorage = tokenStorage {
    _checkAuthenticationStatus();
  }

  bool get isAuthenticated => _isAuthenticated;
  User? get user => _user;
  bool get isLoading => _isLoading;
  bool get hasError => _errorMessage != null;
  String? get errorMessage => _errorMessage;

  Future<void> _checkAuthenticationStatus() async {
    _isLoading = true; // Indicate loading while checking status
    notifyListeners();

    final token = await _tokenStorage.getToken();
    _isAuthenticated = token != null;
    if (_isAuthenticated) {
      try {
        _user = await getProfile();
      } catch (e) {
        // If fetching profile fails, consider user not authenticated
        _isAuthenticated = false;
        await _tokenStorage.deleteToken();
      }
    }
    _isLoading = false; // Loading complete
    notifyListeners();
  }

  Future<void> register(String email, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final registerRequest = RegisterRequestModel(
        email: email,
        password: password,
      );
      await _apiService.post('register', registerRequest.toJson());
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final loginRequest = LoginRequestModel(email: email, password: password);
      final response = await _apiService.post('login', loginRequest.toJson());
      if (response.containsKey('token')) {
        await _tokenStorage.saveToken(response['token']);
        _isAuthenticated = true;
        _user = await getProfile(); // Fetch user profile after successful login
        _isLoading = false; // Set loading to false after profile is fetched
        notifyListeners(); // Notify listeners after _user is populated and loading state is updated
      }
      return response;
    } catch (e) {
      _errorMessage = e.toString();
      rethrow;
    } finally {
      _isLoading = false; // Ensure loading is set to false
      notifyListeners(); // Notify listeners to update UI
    }
  }

  Future<void> logout() async {
    await _tokenStorage.deleteToken();
    _isAuthenticated = false;
    _user = null; // Clear user data on logout
    notifyListeners();
  }

  Future<String?> getToken() async {
    return await _tokenStorage.getToken();
  }

  Future<User> getProfile() async {
    return _apiService.get<User>('me', fromJson: User.fromJson);
  }

  Future<bool> isLoggedIn() async {
    final token = await _tokenStorage.getToken();
    return token != null;
  }

  Future<List<String>> getUserRoles() async {
    return _user?.roles ?? [];
  }
}
