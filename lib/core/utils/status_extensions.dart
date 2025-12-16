import 'package:flutter/material.dart';
import 'package:catering_flutter/graphql/schema.graphql.dart';
import 'package:catering_flutter/l10n/app_localizations.dart';

// Extension for Order Status
extension OrderStatusUI on Enum$OrderStatus {
  /// Returns a human-readable label (e.g., "In Progress" instead of "IN_PROGRESS")
  /// Returns a human-readable label
  String getLabel(BuildContext context) {
    switch (this) {
      case Enum$OrderStatus.Unpaid:
        return AppLocalizations.of(context)!.statusUnpaid;
      case Enum$OrderStatus.Paid:
        return AppLocalizations.of(context)!.statusPaid;
      case Enum$OrderStatus.Active:
        return AppLocalizations.of(context)!.statusActive;
      case Enum$OrderStatus.Completed:
        return AppLocalizations.of(context)!.statusCompleted;
      case Enum$OrderStatus.Cancelled:
        return AppLocalizations.of(context)!.statusCancelled;
      default:
        return name.replaceAll('_', ' ');
    }
  }

  /// Returns the background color for the status chip
  Color get containerColor {
    switch (this) {
      case Enum$OrderStatus.Unpaid:
        return Colors.amber[100]!;
      case Enum$OrderStatus.Paid:
        return Colors.blue[100]!;
      case Enum$OrderStatus.Active:
        return Colors.orange[100]!;
      case Enum$OrderStatus.Completed:
        return Colors.green[100]!;
      case Enum$OrderStatus.Cancelled:
        return Colors.red[100]!;
      default:
        return Colors.grey[100]!;
    }
  }

  /// Returns the text/icon color for the status chip
  Color get onContainerColor {
    switch (this) {
      case Enum$OrderStatus.Unpaid:
        return Colors.amber[900]!;
      case Enum$OrderStatus.Paid:
        return Colors.blue[900]!;
      case Enum$OrderStatus.Active:
        return Colors.orange[900]!;
      case Enum$OrderStatus.Completed:
        return Colors.green[900]!;
      case Enum$OrderStatus.Cancelled:
        return Colors.red[900]!;
      default:
        return Colors.grey[900]!;
    }
  }

  /// Returns solid colors for charts (e.g., pie charts)
  Color get chartColor {
    switch (this) {
      case Enum$OrderStatus.Unpaid:
        return Colors.amber;
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
  String getLabel(BuildContext context) {
    switch (this) {
      case Enum$DeliveryStatus.Pending:
        return AppLocalizations.of(context)!.statusPending;
      case Enum$DeliveryStatus.Assigned:
        return AppLocalizations.of(context)!.statusAssigned;
      case Enum$DeliveryStatus.Picked_up:
        return AppLocalizations.of(context)!.statusPickedUp;
      case Enum$DeliveryStatus.Delivered:
        return AppLocalizations.of(context)!.statusDelivered;
      case Enum$DeliveryStatus.Failed:
        return AppLocalizations.of(context)!.statusFailed;
      case Enum$DeliveryStatus.Returned:
        return AppLocalizations.of(context)!.statusReturned;
      default:
        return name.replaceAll('_', ' ');
    }
  }

  Color get containerColor {
    switch (this) {
      case Enum$DeliveryStatus.Pending:
        return Colors.orange[100]!;
      case Enum$DeliveryStatus.Assigned:
        return Colors.blue[100]!;
      case Enum$DeliveryStatus.Picked_up:
        return Colors.purple[100]!;
      case Enum$DeliveryStatus.Delivered:
        return Colors.green[100]!;
      case Enum$DeliveryStatus.Failed:
        return Colors.red[100]!;
      case Enum$DeliveryStatus.Returned:
        return Colors.grey[100]!;
      default:
        return Colors.grey[100]!;
    }
  }

  Color get onContainerColor {
    switch (this) {
      case Enum$DeliveryStatus.Pending:
        return Colors.orange[900]!;
      case Enum$DeliveryStatus.Assigned:
        return Colors.blue[900]!;
      case Enum$DeliveryStatus.Picked_up:
        return Colors.purple[900]!;
      case Enum$DeliveryStatus.Delivered:
        return Colors.green[900]!;
      case Enum$DeliveryStatus.Failed:
        return Colors.red[900]!;
      case Enum$DeliveryStatus.Returned:
        return Colors.grey[900]!;
      default:
        return Colors.grey[900]!;
    }
  }

  IconData get icon {
    if (this == Enum$DeliveryStatus.Delivered) return Icons.check_circle;
    return Icons.schedule;
  }
}
