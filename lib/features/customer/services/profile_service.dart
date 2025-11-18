import 'package:flutter/foundation.dart';
import 'package:catering_flutter/features/authentication/models/user.dart';
import 'package:catering_flutter/features/authentication/services/auth_service.dart';
import 'package:catering_flutter/features/customer/models/recipient_details.dart';
import 'package:catering_flutter/features/customer/services/profile_api_service.dart';

class ProfileService extends ChangeNotifier {
  final AuthService _authService;
  final ProfileApiService _profileApiService;

  User? _profile;
  bool _isLoading = false;
  String? _errorMessage;

  ProfileService({
    required AuthService authService,
    required ProfileApiService profileApiService,
  }) : _authService = authService,
       _profileApiService = profileApiService;

  User? get profile => _profile;
  bool get isLoading => _isLoading;
  bool get hasError => _errorMessage != null;
  String? get errorMessage => _errorMessage;

  Future<void> fetchProfile() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _profile = await _authService.getProfile();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateRecipientDetails(RecipientDetails recipientDetails) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      // Assuming profileApiService has a method to update recipient details
      // This might need to be adjusted based on the actual API.
      await _profileApiService.updateRecipientDetails(
        _profile!.id,
        recipientDetails,
      );
      // After updating, refetch the profile to get the latest data
      await fetchProfile();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
