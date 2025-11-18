import 'dart:js_interop';

extension type CheckoutOptions._(JSObject _) implements JSObject {
  external factory CheckoutOptions({String? sessionId});

  external String? sessionId;
}

@JS('Stripe')
@staticInterop
class StripeJS {
  external factory StripeJS(String apiKey);
}

extension StripeJSExtension on StripeJS {
  external JSAny redirectToCheckout(CheckoutOptions options);
}

void redirectToStripeCheckout({
  required String apiKey,
  required String sessionId,
}) {
  try {
    final stripeJs = StripeJS(apiKey);
    stripeJs.redirectToCheckout(CheckoutOptions(sessionId: sessionId));
  } catch (e) {
    // TODO: Handle error
  }
}
