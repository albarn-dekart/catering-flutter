import 'dart:typed_data';
import 'package:catering_flutter/core/services/api_service.dart';
import 'package:catering_flutter/graphql/schema.graphql.dart';
import 'dart:js_interop';
import 'package:web/web.dart' as web;

/// Service for handling CSV export operations
class ExportService {
  final ApiService _apiClient;

  ExportService(this._apiClient);

  Future<void> exportOrdersToCsv({
    Enum$OrderStatus? statusFilter,
    String? restaurantIri,
  }) async {
    try {
      final body = <String, dynamic>{};
      if (statusFilter != null) {
        body['status'] = statusFilter.name;
      }

      String endpoint;
      if (restaurantIri != null) {
        endpoint = '$restaurantIri/export/orders';
      } else {
        endpoint = '/api/export/orders';
      }

      final response = await _apiClient.post(endpoint, body: body);

      _downloadCsv(response.bodyBytes, _generateFilename('orders'));
    } catch (e) {
      rethrow;
    }
  }

  /// Export users to CSV (Admin only)
  /// [roleFilter] - Optional role filter to apply
  Future<void> exportUsersToCsv({String? roleFilter}) async {
    try {
      final body = <String, dynamic>{};
      if (roleFilter != null) {
        body['role'] = roleFilter;
      }

      final response = await _apiClient.post('/api/export/users', body: body);

      _downloadCsv(response.bodyBytes, _generateFilename('users'));
    } catch (e) {
      rethrow;
    }
  }

  /// Export deliveries to CSV
  /// [statusFilter] - Optional status filter to apply
  Future<void> exportDeliveriesToCsv({
    Enum$DeliveryStatus? statusFilter,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    try {
      final body = <String, dynamic>{};
      if (statusFilter != null) {
        body['status'] = statusFilter.name;
      }
      if (startDate != null) {
        body['startDate'] = startDate.toIso8601String().split('T')[0];
      }
      if (endDate != null) {
        body['endDate'] = endDate.toIso8601String().split('T')[0];
      }

      final response = await _apiClient.post(
        '/api/export/deliveries',
        body: body,
      );

      _downloadCsv(response.bodyBytes, _generateFilename('deliveries'));
    } catch (e) {
      rethrow;
    }
  }

  /// Export statistics to CSV (Admin only)
  Future<void> exportDataToCsv({DateTime? startDate, DateTime? endDate}) async {
    try {
      final body = <String, dynamic>{};
      if (startDate != null) {
        body['startDate'] = startDate.toIso8601String().split('T')[0];
      }
      if (endDate != null) {
        body['endDate'] = endDate.toIso8601String().split('T')[0];
      }

      final response = await _apiClient.post(
        '/api/export/statistics',
        body: body,
      );

      _downloadCsv(response.bodyBytes, _generateFilename('statistics'));
    } catch (e) {
      rethrow;
    }
  }

  /// Export restaurant statistics to CSV
  Future<void> exportRestaurantStatisticsToCsv(
    String restaurantId, {
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    try {
      final body = <String, dynamic>{};
      if (startDate != null) {
        body['startDate'] = startDate.toIso8601String().split('T')[0];
      }
      if (endDate != null) {
        body['endDate'] = endDate.toIso8601String().split('T')[0];
      }

      final response = await _apiClient.post(
        '/api/export/restaurants/$restaurantId/statistics',
        body: body,
      );

      _downloadCsv(
        response.bodyBytes,
        _generateFilename('restaurant_statistics'),
      );
    } catch (e) {
      rethrow;
    }
  }

  /// Export production plan to CSV
  Future<void> exportProductionPlan(
    String restaurantId, {
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    try {
      final body = <String, dynamic>{};
      if (startDate != null) {
        body['startDate'] = startDate.toIso8601String().split('T')[0];
      }
      if (endDate != null) {
        body['endDate'] = endDate.toIso8601String().split('T')[0];
      }

      final response = await _apiClient.post(
        '/api/export/restaurants/$restaurantId/production-plan',
        body: body,
      );

      _downloadCsv(response.bodyBytes, _generateFilename('production_plan'));
    } catch (e) {
      rethrow;
    }
  }

  void _downloadCsv(List<int> bytes, String filename) {
    final Uint8List uint8List = Uint8List.fromList(bytes);
    final jsUint8Array = uint8List.toJS;
    final List<JSUint8Array> blobPartList = [jsUint8Array];
    final blobParts = blobPartList.toJS;

    final blob = web.Blob(blobParts, web.BlobPropertyBag(type: 'text/csv'));
    final url = web.URL.createObjectURL(blob);

    final anchor = (web.document.createElement('a') as web.HTMLAnchorElement)
      ..href = url
      ..download = filename
      ..style.display = 'none';

    web.document.body?.append(anchor);
    anchor.click();

    // Clean up
    anchor.remove();
    web.URL.revokeObjectURL(url);
  }

  /// Generate a filename with timestamp
  String _generateFilename(String prefix) {
    final timestamp = DateTime.now()
        .toIso8601String()
        .split('.')[0]
        .replaceAll(':', '-');
    return '${prefix}_$timestamp.csv';
  }
}
