import 'dart:async';
import 'package:catering_flutter/core/services/api_service.dart';
import 'package:http/http.dart' as http;
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:catering_flutter/core/services/auth_service.dart';

class TimeoutClient extends http.BaseClient {
  final http.Client _inner;
  final Duration _timeout;

  TimeoutClient(this._inner, this._timeout);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    return _inner.send(request).timeout(_timeout);
  }
}

GraphQLClient initClient(AuthService authService) {
  final httpLink = HttpLink(
    '${ApiService.baseUrl}/api/graphql',
    defaultHeaders: {'Accept': 'application/json'},
    httpClient: TimeoutClient(http.Client(), const Duration(seconds: 30)),
  );

  final authLink = AuthLink(
    getToken: () async {
      final token = await authService.getToken();

      if (token != null) {
        final isExpired = await authService.isTokenExpired();

        if (!isExpired) {
          return 'Bearer $token';
        } else {
          // Token is expired, try to refresh
          final newToken = await authService.refreshToken();
          if (newToken != null) {
            return 'Bearer $newToken';
          }
          // If refresh failed, refreshToken() handles logout
        }
      }

      return null;
    },
  );

  final link = authLink.concat(httpLink);

  return GraphQLClient(
    link: link,
    cache: GraphQLCache(store: HiveStore()),
  );
}
