import 'package:flutter/material.dart';
import 'package:catering_flutter/graphql/schema.graphql.dart';

// Extension for Order Status
extension OrderStatusUI on Enum$OrderStatus {
  /// Returns a human-readable label (e.g., "In Progress" instead of "IN_PROGRESS")
  String get label {
    // Basic formatting: replace underscores and Title Case if needed
    // You can also add a switch statement here for specific translations
    return name.replaceAll('_', ' ');
  }

  /// Returns the background color for the status chip
  Color containerColor(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    switch (this) {
      case Enum$OrderStatus.Unpaid:
        return colorScheme.errorContainer;
      case Enum$OrderStatus.Paid:
        return colorScheme.primaryContainer;
      case Enum$OrderStatus.Active:
        return colorScheme.tertiaryContainer;
      case Enum$OrderStatus.Completed:
        return colorScheme.secondaryContainer;
      case Enum$OrderStatus.Cancelled:
        return colorScheme.errorContainer;
      default:
        return colorScheme.surfaceContainerHighest;
    }
  }

  /// Returns the text/icon color for the status chip
  Color onContainerColor(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    switch (this) {
      case Enum$OrderStatus.Unpaid:
        return colorScheme.onErrorContainer;
      case Enum$OrderStatus.Paid:
        return colorScheme.onPrimaryContainer;
      case Enum$OrderStatus.Active:
        return colorScheme.onTertiaryContainer;
      case Enum$OrderStatus.Completed:
        return colorScheme.onSecondaryContainer;
      case Enum$OrderStatus.Cancelled:
        return colorScheme.onErrorContainer;
      default:
        return colorScheme.onSurface;
    }
  }

  /// Returns solid colors for charts (e.g., pie charts)
  Color get chartColor {
    switch (this) {
      case Enum$OrderStatus.Unpaid:
        return Colors.grey;
      case Enum$OrderStatus.Paid:
        return Colors.blue;
      case Enum$OrderStatus.Active:
        return Colors.orange;
      case Enum$OrderStatus.Completed:
        return Colors.green;
      case Enum$OrderStatus.Cancelled:
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}

// Extension for Delivery Status (Reuse the same logic pattern)
extension DeliveryStatusUI on Enum$DeliveryStatus {
  String get label {
    return name.replaceAll('_', ' ');
  }

  Color containerColor(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    switch (this) {
      case Enum$DeliveryStatus.Pending:
        return colorScheme.tertiaryContainer;
      case Enum$DeliveryStatus.Assigned:
        return colorScheme.primaryContainer;
      case Enum$DeliveryStatus.Picked_up:
        return colorScheme.secondaryContainer;
      case Enum$DeliveryStatus.Delivered:
        return colorScheme.secondaryContainer;
      default:
        return colorScheme.surfaceContainerHighest;
    }
  }

  Color onContainerColor(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    switch (this) {
      case Enum$DeliveryStatus.Pending:
        return colorScheme.onTertiaryContainer;
      case Enum$DeliveryStatus.Assigned:
        return colorScheme.onPrimaryContainer;
      case Enum$DeliveryStatus.Picked_up:
        return colorScheme.onSecondaryContainer;
      case Enum$DeliveryStatus.Delivered:
        return colorScheme.onSecondaryContainer;
      default:
        return colorScheme.onSurface;
    }
  }

  IconData get icon {
    if (this == Enum$DeliveryStatus.Delivered) return Icons.check_circle;
    return Icons.schedule;
  }
}
