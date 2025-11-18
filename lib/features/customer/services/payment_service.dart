import 'package:flutter/foundation.dart';
import 'package:catering_flutter/core/api_service.dart';
import 'package:catering_flutter/features/customer/models/create_checkout_session_request_model.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentService extends ChangeNotifier {
  final ApiService _apiService;

  String? _checkoutSessionId;
  bool _isLoading = false;
  String? _errorMessage;

  PaymentService({required ApiService apiService}) : _apiService = apiService;

  String? get checkoutSessionId => _checkoutSessionId;
  bool get checkoutSessionCreated => _checkoutSessionId != null;
  bool get isLoading => _isLoading;
  bool get hasError => _errorMessage != null;
  String? get errorMessage => _errorMessage;

  Future<void> createCheckoutSession({required int orderId}) async {
    _isLoading = true;
    _errorMessage = null;
    _checkoutSessionId = null;
    notifyListeners();

    try {
      final requestModel = CreateCheckoutSessionRequestModel(orderId: orderId);
      final response = await _apiService.post<Map<String, dynamic>>(
        'payments/create-checkout-session',
        requestModel.toJson(),
      );
      _checkoutSessionId = response['sessionId'];
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void redirectToStripeCheckout({
    required String apiKey,
    required String sessionId,
  }) {
    final url =
        'https://checkout.stripe.com/pay/$sessionId#fidkd4gchQbEE9gptxStruYt57Wq8zYl@1599737340';
    launchUrl(Uri.parse(url));
  }

  void clearCheckoutSessionStatus() {
    _checkoutSessionId = null;
    _errorMessage = null;
    notifyListeners();
  }
}
