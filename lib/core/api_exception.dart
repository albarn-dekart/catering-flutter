import 'package:graphql_flutter/graphql_flutter.dart';

class ApiException implements Exception {
  final String message;

  ApiException(this.message);

  /// Static helper to check QueryResult and throw ApiException if there's an error
  static void check(QueryResult result) {
    if (result.hasException) {
      final exception = result.exception!;
      String errorMessage = 'An error occurred';

      // Extract error message from GraphQL errors
      if (exception.graphqlErrors.isNotEmpty) {
        errorMessage = exception.graphqlErrors.map((e) => e.message).join(', ');
      } else if (exception.linkException != null) {
        errorMessage = exception.linkException.toString();
      }

      throw ApiException(errorMessage);
    }
  }

  @override
  String toString() => message;
}
