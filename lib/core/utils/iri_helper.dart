/// Helper utilities for working with API Platform IRIs
class IriHelper {
  /// Extracts the numeric ID from an IRI (Internationalized Resource Identifier)
  ///
  /// Examples:
  /// - "/api/restaurants/10" -> 10
  /// - "/api/users/42" -> 42
  /// - "/api/meal-plans/123" -> 123
  ///
  /// Throws [FormatException] if the IRI doesn't contain a valid numeric ID
  static String getId(String iri) {
    final segments = iri.split('/');

    if (segments.isEmpty) {
      throw FormatException('Invalid IRI format: $iri');
    }

    final lastSegment = segments.reversed.firstWhere(
      (segment) => segment.isNotEmpty,
      orElse: () => throw FormatException('Invalid IRI format: $iri'),
    );

    return lastSegment;
  }

  /// Checks if a string is an IRI (starts with /api/)
  static bool isIri(String value) {
    return value.startsWith('/api/');
  }

  /// Converts a ID to an IRI for a given resource type
  ///
  /// Examples:
  /// - buildIri('restaurants', 10) -> "/api/restaurants/10"
  /// - buildIri('users', 42) -> "/api/users/42"
  static String buildIri(String resourceType, String id) {
    return '/api/$resourceType/$id';
  }
}
