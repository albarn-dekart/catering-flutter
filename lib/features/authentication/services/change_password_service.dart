import 'package:flutter/foundation.dart';
import 'package:catering_flutter/core/api_service.dart';
import 'package:catering_flutter/features/authentication/services/auth_service.dart';

class ChangePasswordService extends ChangeNotifier {
  final ApiService _apiService;
  final AuthService _authService;

  bool _isLoading = false;
  String? _errorMessage;
  bool _isSuccess = false;

  ChangePasswordService({
    required ApiService apiService,
    required AuthService authService,
  }) : _apiService = apiService,
       _authService = authService;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get isSuccess => _isSuccess;
  bool get hasError => _errorMessage != null;

  Future<void> changePassword(
    String oldPassword,
    String newPassword,
    String confirmedPassword,
  ) async {
    _isLoading = true;
    _errorMessage = null;
    _isSuccess = false;
    notifyListeners();

    if (newPassword != confirmedPassword) {
      _errorMessage = 'New password and confirmed password do not match.';
      _isLoading = false;
      notifyListeners();
      return;
    }

    try {
      final user = _authService.user;
      if (user == null) {
        _errorMessage = 'User not authenticated.';
        _isLoading = false;
        notifyListeners();
        return;
      }

      // Assuming there's an API endpoint for changing password
      // and it takes oldPassword and newPassword in the body.
      await _apiService.patch(
        'users/${user.id}/password', // Example endpoint
        {'oldPassword': oldPassword, 'newPassword': newPassword},
      );
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
