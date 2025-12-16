import 'package:flutter_test/flutter_test.dart';
import 'package:catering_flutter/core/utils/price_formatter.dart';

void main() {
  group('PriceFormatter Tests', () {
    test('formats integer groszy correctly', () {
      expect(formatPrice(1599), '15.99 PLN');
      expect(formatPrice(100), '1.00 PLN');
      expect(formatPrice(0), '0.00 PLN');
      expect(formatPrice(50), '0.50 PLN');
    });

    test('formats integer groszy with suffix', () {
      expect(formatPrice(1599, suffix: '/day'), '15.99 PLN/day');
    });

    test('formats double groszy correctly', () {
      expect(formatPriceDouble(1599.0), '15.99 PLN');
      expect(formatPriceDouble(1550.0), '15.50 PLN');
    });

    test('extension toPln works on int', () {
      expect(1599.toPln(), '15.99 PLN');
    });

    test('extension toPln works on nullable int', () {
      const int? nullPrice = null;
      expect(nullPrice.toPln(), '0.00 PLN');
      expect(1599.toPln(), '15.99 PLN');
    });
  });
}
