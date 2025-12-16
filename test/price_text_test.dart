import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:catering_flutter/core/widgets/price_text.dart';

void main() {
  group('PriceText Widget Tests', () {
    testWidgets('renders correct price for integer input', (
      WidgetTester tester,
    ) async {
      // Build the widget
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: PriceText(priceGroszy: 1599))),
      );

      // Verify text
      expect(find.text('15.99 PLN'), findsOneWidget);
    });

    testWidgets('renders correct price with suffix', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: PriceText(priceGroszy: 2000, suffix: '/dzień')),
        ),
      );

      expect(find.text('20.00 PLN/dzień'), findsOneWidget);
    });

    testWidgets('PriceText.fromDouble renders correctly', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: PriceText.fromDouble(priceGroszy: 1550.0)),
        ),
      );

      expect(find.text('15.50 PLN'), findsOneWidget);
    });
  });
}
