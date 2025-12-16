import 'package:catering_flutter/core/services/api_service.dart';

class MediaService {
  final ApiService _apiClient;

  MediaService(this._apiClient);

  /// Uploads an image to the specified relative [endpoint].
  /// Returns only if successful, otherwise throws [ApiException].
  Future<void> uploadImage(
    String endpoint,
    List<int> bytes,
    String filename,
  ) async {
    await _apiClient.postMultipart(endpoint, bytes, filename);
  }
}
