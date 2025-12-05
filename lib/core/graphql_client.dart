import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:catering_flutter/core/auth_service.dart';

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
    'https://localhost:8000/api/graphql',
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
          await authService.logout();
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
