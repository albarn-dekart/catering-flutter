import 'package:catering_flutter/core/utils/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppDateFormatter Tests', () {
    // Helper widget to provide context with locale
    Widget buildTestWidget(Locale locale, Function(BuildContext) callback) {
      return MaterialApp(
        locale: locale,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('en'), Locale('pl')],
        home: Builder(
          builder: (context) {
            callback(context);
            return const Placeholder();
          },
        ),
      );
    }

    final testDate = DateTime(2025, 12, 15); // Monday

    testWidgets('format uses correct locale (EN)', (tester) async {
      await tester.pumpWidget(
        buildTestWidget(const Locale('en'), (context) {
          expect(AppDateFormatter.format(context, 'EEE', testDate), 'Mon');
          expect(
            AppDateFormatter.fullDate(context, testDate),
            'Monday, 15 December 2025',
          );
          expect(AppDateFormatter.shortDate(context, testDate), '15 Dec 2025');
        }),
      );
    });

    testWidgets('format uses correct locale (PL)', (tester) async {
      await tester.pumpWidget(
        buildTestWidget(const Locale('pl'), (context) {
          // Note: In Polish 'Mon' is 'pon.' or 'pn' depending on pattern, 'EEE' in pl is usually 'pon.'
          expect(AppDateFormatter.format(context, 'EEE', testDate), 'pon.');
          // fullDate: 'EEEE, d MMMM yyyy' -> 'poniedziałek, 15 grudnia 2025'
          expect(
            AppDateFormatter.fullDate(context, testDate),
            'poniedziałek, 15 grudnia 2025',
          );
          expect(AppDateFormatter.shortDate(context, testDate), '15 gru 2025');
        }),
      );
    });

    testWidgets('localizedDayName converts English abbr to localized name', (
      tester,
    ) async {
      await tester.pumpWidget(
        buildTestWidget(const Locale('pl'), (context) {
          expect(AppDateFormatter.localizedDayName(context, 'Mon'), 'pon.');
          expect(AppDateFormatter.localizedDayName(context, 'Fri'), 'pt.');
        }),
      );
    });

    test('dayOfWeekAbbrBackend always returns English', () {
      expect(
        AppDateFormatter.dayOfWeekAbbrBackend(DateTime(2025, 12, 15)),
        'Mon',
      ); // Monday
      expect(
        AppDateFormatter.dayOfWeekAbbrBackend(DateTime(2025, 12, 16)),
        'Tue',
      ); // Tuesday
    });

    test('isoDate formats as yyyy-MM-dd', () {
      expect(AppDateFormatter.isoDate(DateTime(2025, 12, 15)), '2025-12-15');
      expect(AppDateFormatter.isoDate(DateTime(2025, 1, 5)), '2025-01-05');
    });

    test('chartDate formats as MM/dd', () {
      expect(AppDateFormatter.chartDate(DateTime(2025, 12, 15)), '12/15');
      expect(AppDateFormatter.chartDate(DateTime(2025, 1, 5)), '01/05');
    });
  });
}
