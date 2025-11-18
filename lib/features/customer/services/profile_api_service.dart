import 'package:catering_flutter/core/api_service.dart';
import 'package:catering_flutter/features/authentication/models/user.dart';
import 'package:catering_flutter/features/customer/models/recipient_details.dart';

class ProfileApiService {
  final ApiService _apiService;

  ProfileApiService({required ApiService apiService})
    : _apiService = apiService;

  Future<User> fetchProfile() async {
    return await _apiService.get<User>('me', fromJson: User.fromJson);
  }

  Future<RecipientDetails> updateRecipientDetails(
    int userId,
    RecipientDetails recipientDetails,
  ) async {
    // Assuming the API endpoint for updating recipient details is something like 'users/{userId}/recipient_details'
    // And it expects a PATCH request with the RecipientDetails object.
    final response = await _apiService.patch(
      'users/$userId/recipient_details',
      recipientDetails.toJson(),
    );
    return RecipientDetails.fromJson(response);
  }
}
