import 'package:catering_flutter/graphql/payments.graphql.dart';
import 'package:catering_flutter/graphql/schema.graphql.dart';
import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:catering_flutter/core/api_exception.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentService extends ChangeNotifier {
  final GraphQLClient _client;

  String? _checkoutSessionId;

  String? get checkoutSessionId => _checkoutSessionId;

  String? _checkoutUrl;

  String? get checkoutUrl => _checkoutUrl;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  bool get hasError => _errorMessage != null;

  bool get checkoutSessionCreated =>
      _checkoutSessionId != null && _checkoutUrl != null;

  PaymentService(this._client);

  void clearCheckoutSessionStatus() {
    _checkoutSessionId = null;
    _checkoutUrl = null;
    _errorMessage = null;
    notifyListeners();
  }

  Future<void> createCheckoutSession({required String orderIri}) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final options = MutationOptions(
        document: documentNodeMutationCreatePayment,
        variables: Variables$Mutation$CreatePayment(
          input: Input$createPaymentInput(order: orderIri),
        ).toJson(),
      );
      final result = await _client.mutate(options);

      if (result.hasException) {
        throw ApiException(result.exception.toString());
      }

      final data = Mutation$CreatePayment.fromJson(result.data!);
      _checkoutSessionId = data.createPayment?.payment?.sessionId;
      _checkoutUrl = data.createPayment?.payment?.url;
    } catch (e) {
      _errorMessage = e.toString();
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> redirectToStripeCheckout({
    required String apiKey,
    required String sessionId,
  }) async {
    if (_checkoutUrl != null) {
      final uri = Uri.parse(_checkoutUrl!);

      final success = await launchUrl(
        uri,
        mode: LaunchMode.platformDefault,
        webOnlyWindowName: "_self",
      );

      if (!success) {
        throw ApiException('Could not launch payment URL');
      }
    } else {
      throw ApiException('Payment URL not available');
    }
  }
}
