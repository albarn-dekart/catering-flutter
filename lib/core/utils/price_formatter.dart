/// Formats a price from groszy (cents) to PLN string.
///
/// Example:
/// ```dart
/// formatPrice(1599) // Returns "15.99 PLN"
/// formatPrice(1599, suffix: "/dzień") // Returns "15.99 PLN/dzień"
/// ```
String formatPrice(int groszy, {String suffix = ''}) {
  final pln = groszy / 100.0;
  return '${pln.toStringAsFixed(2)} PLN$suffix';
}

/// Formats a price from groszy (cents) to PLN string (double version).
///
/// Use this when the price might already be calculated as a double.
String formatPriceDouble(double groszy, {String suffix = ''}) {
  final pln = groszy / 100.0;
  return '${pln.toStringAsFixed(2)} PLN$suffix';
}

/// Extension on int to easily format groszy to PLN.
extension GroszyToPln on int {
  /// Converts groszy to PLN formatted string.
  ///
  /// Example:
  /// ```dart
  /// 1599.toPln() // Returns "15.99 PLN"
  /// 1599.toPln(suffix: "/dzień") // Returns "15.99 PLN/dzień"
  /// ```
  String toPln({String suffix = ''}) => formatPrice(this, suffix: suffix);
}

/// Extension on double to easily format groszy to PLN.
extension GroszyToPlnDouble on double {
  /// Converts groszy to PLN formatted string.
  String toPln({String suffix = ''}) => formatPriceDouble(this, suffix: suffix);
}

/// Extension on nullable int for price formatting.
extension NullableGroszyToPln on int? {
  /// Converts groszy to PLN formatted string, or returns fallback if null.
  String toPln({String suffix = '', String fallback = '0.00 PLN'}) {
    if (this == null) return fallback;
    return formatPrice(this!, suffix: suffix);
  }
}

/// Extension on nullable double for price formatting.
extension NullableGroszyToPlnDouble on double? {
  /// Converts groszy to PLN formatted string, or returns fallback if null.
  String toPln({String suffix = '', String fallback = '0.00 PLN'}) {
    if (this == null) return fallback;
    return formatPriceDouble(this!, suffix: suffix);
  }
}
