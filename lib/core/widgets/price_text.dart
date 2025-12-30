import 'package:flutter/material.dart';
import '../utils/price_formatter.dart';

/// A widget that displays a price in PLN format.
///
/// Converts groszy (cents) to PLN and displays with consistent formatting.
///
/// Example:
/// ```dart
/// PriceText(priceGroszy: 1599) // Displays "15.99 PLN"
/// PriceText(priceGroszy: 1599, suffix: "/dzień") // Displays "15.99 PLN/dzień"
/// ```
class PriceText extends StatelessWidget {
  /// The price in groszy (cents).
  final int priceGroszy;

  /// Optional suffix to append after PLN (e.g., "/dzień").
  final String suffix;

  /// Optional text style for the price.
  final TextStyle? style;

  /// Optional text alignment.
  final TextAlign? textAlign;

  /// Maximum number of lines.
  final int? maxLines;

  /// Text overflow behavior.
  final TextOverflow? overflow;

  const PriceText({
    super.key,
    required this.priceGroszy,
    this.suffix = '',
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  /// Standard style for prices across the app.
  static TextStyle standardStyle(BuildContext context) {
    return Theme.of(context).textTheme.titleLarge!.copyWith(
      color: Theme.of(context).colorScheme.primary,
      fontWeight: FontWeight.bold,
    );
  }

  /// Creates a PriceText from a double value (for calculated prices).
  factory PriceText.fromDouble({
    Key? key,
    required double priceGroszy,
    String suffix = '',
    TextStyle? style,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return _PriceTextDouble(
      key: key,
      priceGroszyDouble: priceGroszy,
      suffix: suffix,
      style: style,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      formatPrice(priceGroszy, suffix: suffix),
      style: style,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}

/// Internal widget for handling double prices.
class _PriceTextDouble extends PriceText {
  final double priceGroszyDouble;

  const _PriceTextDouble({
    super.key,
    required this.priceGroszyDouble,
    super.suffix,
    super.style,
    super.textAlign,
    super.maxLines,
    super.overflow,
  }) : super(priceGroszy: 0);

  @override
  Widget build(BuildContext context) {
    return Text(
      formatPriceDouble(priceGroszyDouble, suffix: suffix),
      style: style,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
