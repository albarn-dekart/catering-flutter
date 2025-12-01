import 'package:catering_flutter/core/api_config.dart';

/// Helper class for handling image URLs
class ImageHelper {
  /// Converts a relative image URL to a full URL by prepending the API base URL
  /// Returns null if imageUrl is null or empty
  /// If imageUrl already starts with 'http://' or 'https://', returns it as is
  static String? getFullImageUrl(String? imageUrl) {
    if (imageUrl == null || imageUrl.isEmpty) {
      return null;
    }

    // If already an absolute URL, return as is
    if (imageUrl.startsWith('http://') || imageUrl.startsWith('https://')) {
      return imageUrl;
    }

    // Construct full URL
    final baseUrl = ApiConfig.baseUrl;
    // Use baseUrl as is, ensuring requests go through /api/images which handles CORS
    final cleanBaseUrl = baseUrl;

    // Ensure proper URL formation
    if (imageUrl.startsWith('/')) {
      return '$cleanBaseUrl$imageUrl';
    } else {
      return '$cleanBaseUrl/$imageUrl';
    }
  }
}
