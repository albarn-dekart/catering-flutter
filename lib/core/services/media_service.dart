import 'package:catering_flutter/core/services/api_service.dart';

class MediaService {
  final ApiService _apiClient;

  MediaService(this._apiClient);

  /// Uploads an image to the specified relative [endpoint].
  /// Returns the response body on success, otherwise throws [ApiException].
  Future<String> uploadImage(
    String endpoint,
    List<int> bytes,
    String filename,
  ) async {
    final response = await _apiClient.postMultipart(endpoint, bytes, filename);
    return response.body;
  }
}
