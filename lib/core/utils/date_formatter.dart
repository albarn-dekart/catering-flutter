import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// A utility class for locale-aware date formatting.
///
/// All date formatting in the app should use this class to ensure
/// dates are displayed in the correct language based on the user's
/// selected locale.
class AppDateFormatter {
  /// Returns the current locale code from the BuildContext.
  /// Falls back to 'en' if locale cannot be determined.
  static String getLocaleCode(BuildContext context) {
    return Localizations.localeOf(context).languageCode;
  }

  /// Formats a date using the given pattern and the current app locale.
  ///
  /// Example:
  /// ```dart
  /// AppDateFormatter.format(context, 'dd MMM yyyy', myDate)
  /// ```
  static String format(BuildContext context, String pattern, DateTime date) {
    final locale = getLocaleCode(context);
    return DateFormat(pattern, locale).format(date);
  }

  /// Formats a date using a localized full date pattern.
  /// Example output: "Monday, 15 December 2025" (in English) or "poniedziałek, 15 grudnia 2025" (in Polish)
  static String fullDate(BuildContext context, DateTime date) {
    return format(context, 'EEEE, d MMMM yyyy', date);
  }

  /// Formats a date with day, month, and year.
  /// Example output: "15 Dec 2025"
  static String shortDate(BuildContext context, DateTime date) {
    return format(context, 'dd MMM yyyy', date);
  }

  /// Formats a date with day and abbreviated month.
  /// Example output: "15 Dec"
  static String dayMonth(BuildContext context, DateTime date) {
    return format(context, 'd MMM', date);
  }

  /// Formats a date with day, abbreviated month, and year.
  /// Example output: "15 Dec 2025" (same as shortDate, included for semantic clarity)
  static String dayMonthYear(BuildContext context, DateTime date) {
    return format(context, 'd MMM yyyy', date);
  }

  /// Formats a date with abbreviated day of week, day, month, and year.
  /// Example output: "Mon, 15 Dec 2025"
  static String weekdayShortDate(BuildContext context, DateTime date) {
    return format(context, 'EEE, dd MMM yyyy', date);
  }

  /// Returns the abbreviated day of week in English only (e.g., 'Mon', 'Tue').
  /// This is used for backend compatibility - always returns English day names.
  static String dayOfWeekAbbrBackend(DateTime date) {
    // Always use English locale for backend compatibility
    return DateFormat('EEE', 'en').format(date);
  }

  /// Returns the localized abbreviated day of week (e.g., 'Mon', 'Tue' in English or 'Pon', 'Wt' in Polish).
  /// This is used for UI display - respects the user's locale.
  static String shortDayName(BuildContext context, DateTime date) {
    return format(context, 'EEE', date);
  }

  /// Converts an English day abbreviation to a localized day name.
  /// Used for displaying delivery day chips with proper localization.
  ///
  /// Example: 'Mon' -> 'Pon' (in Polish) or 'Mon' (in English)
  static String localizedDayName(BuildContext context, String englishDayAbbr) {
    // Map of English day abbreviations
    final dayMap = {
      'Mon': DateTime.monday,
      'Tue': DateTime.tuesday,
      'Wed': DateTime.wednesday,
      'Thu': DateTime.thursday,
      'Fri': DateTime.friday,
      'Sat': DateTime.saturday,
      'Sun': DateTime.sunday,
    };

    final weekday = dayMap[englishDayAbbr];
    if (weekday == null) return englishDayAbbr;

    // Create a date with the desired weekday (using a known Monday as base)
    final baseDate = DateTime(2025, 1, 6); // This is a Monday
    final targetDate = baseDate.add(Duration(days: weekday - DateTime.monday));

    return shortDayName(context, targetDate);
  }

  /// Returns the month and day in MM/dd format (for charts - locale independent).
  static String chartDate(DateTime date) {
    return DateFormat('MM/dd').format(date);
  }

  /// Returns a date in ISO format for API calls (yyyy-MM-dd).
  static String isoDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }
}
