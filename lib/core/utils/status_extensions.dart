import 'package:flutter/material.dart';
import 'package:catering_flutter/graphql/schema.graphql.dart';
import 'package:catering_flutter/l10n/app_localizations.dart';

/// Premium color palette for status indicators
/// Uses softer, more refined colors that align with modern design aesthetics
class _StatusColors {
  // Order Status Colors - Curated for premium look
  static const unpaidContainer = Color(0xFFFFF8E1); // Soft warm cream
  static const unpaidOnContainer = Color(0xFFB8860B); // Dark goldenrod
  static const unpaidChart = Color(0xFFFFB300); // Amber

  static const paidContainer = Color(0xFFE8F5E9); // Soft mint green
  static const paidOnContainer = Color(0xFF2E7D32); // Forest green
  static const paidChart = Color(0xFF43A047); // Medium green

  static const activeContainer = Color(0xFFFFF3E0); // Soft peach
  static const activeOnContainer = Color(0xFFE65100); // Deep orange
  static const activeChart = Color(0xFFFF9800); // Orange

  static const completedContainer = Color(0xFFE0F2F1); // Soft teal tint
  static const completedOnContainer = Color(0xFF00796B); // Teal
  static const completedChart = Color(0xFF26A69A); // Teal accent

  static const cancelledContainer = Color(0xFFFFEBEE); // Soft rose
  static const cancelledOnContainer = Color(0xFFC62828); // Deep red
  static const cancelledChart = Color(0xFFEF5350); // Red accent

  static const defaultContainer = Color(0xFFF5F5F5); // Light grey
  static const defaultOnContainer = Color(0xFF616161); // Medium grey
  static const defaultChart = Color(0xFF9E9E9E); // Grey

  // Delivery Status Colors
  static const pendingContainer = Color(0xFFFFF3E0); // Soft peach
  static const pendingOnContainer = Color(0xFFE65100); // Deep orange

  static const assignedContainer = Color(0xFFE3F2FD); // Soft sky blue
  static const assignedOnContainer = Color(0xFF1565C0); // Deep blue

  static const pickedUpContainer = Color(0xFFF3E5F5); // Soft lavender
  static const pickedUpOnContainer = Color(0xFF7B1FA2); // Deep purple

  static const deliveredContainer = Color(0xFFE0F2F1); // Soft teal tint
  static const deliveredOnContainer = Color(0xFF00796B); // Teal

  static const failedContainer = Color(0xFFFFEBEE); // Soft rose
  static const failedOnContainer = Color(0xFFC62828); // Deep red

  static const returnedContainer = Color(0xFFECEFF1); // Blue grey tint
  static const returnedOnContainer = Color(0xFF546E7A); // Blue grey
}

// Extension for Order Status
extension OrderStatusUI on Enum$OrderStatus {
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
        return _StatusColors.unpaidContainer;
      case Enum$OrderStatus.Paid:
        return _StatusColors.paidContainer;
      case Enum$OrderStatus.Active:
        return _StatusColors.activeContainer;
      case Enum$OrderStatus.Completed:
        return _StatusColors.completedContainer;
      case Enum$OrderStatus.Cancelled:
        return _StatusColors.cancelledContainer;
      default:
        return _StatusColors.defaultContainer;
    }
  }

  /// Returns the text/icon color for the status chip
  Color get onContainerColor {
    switch (this) {
      case Enum$OrderStatus.Unpaid:
        return _StatusColors.unpaidOnContainer;
      case Enum$OrderStatus.Paid:
        return _StatusColors.paidOnContainer;
      case Enum$OrderStatus.Active:
        return _StatusColors.activeOnContainer;
      case Enum$OrderStatus.Completed:
        return _StatusColors.completedOnContainer;
      case Enum$OrderStatus.Cancelled:
        return _StatusColors.cancelledOnContainer;
      default:
        return _StatusColors.defaultOnContainer;
    }
  }

  /// Returns solid colors for charts (e.g., pie charts)
  Color get chartColor {
    switch (this) {
      case Enum$OrderStatus.Unpaid:
        return _StatusColors.unpaidChart;
      case Enum$OrderStatus.Paid:
        return _StatusColors.paidChart;
      case Enum$OrderStatus.Active:
        return _StatusColors.activeChart;
      case Enum$OrderStatus.Completed:
        return _StatusColors.completedChart;
      case Enum$OrderStatus.Cancelled:
        return _StatusColors.cancelledChart;
      default:
        return _StatusColors.defaultChart;
    }
  }
}

// Extension for Delivery Status
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
        return _StatusColors.pendingContainer;
      case Enum$DeliveryStatus.Assigned:
        return _StatusColors.assignedContainer;
      case Enum$DeliveryStatus.Picked_up:
        return _StatusColors.pickedUpContainer;
      case Enum$DeliveryStatus.Delivered:
        return _StatusColors.deliveredContainer;
      case Enum$DeliveryStatus.Failed:
        return _StatusColors.failedContainer;
      case Enum$DeliveryStatus.Returned:
        return _StatusColors.returnedContainer;
      default:
        return _StatusColors.defaultContainer;
    }
  }

  Color get onContainerColor {
    switch (this) {
      case Enum$DeliveryStatus.Pending:
        return _StatusColors.pendingOnContainer;
      case Enum$DeliveryStatus.Assigned:
        return _StatusColors.assignedOnContainer;
      case Enum$DeliveryStatus.Picked_up:
        return _StatusColors.pickedUpOnContainer;
      case Enum$DeliveryStatus.Delivered:
        return _StatusColors.deliveredOnContainer;
      case Enum$DeliveryStatus.Failed:
        return _StatusColors.failedOnContainer;
      case Enum$DeliveryStatus.Returned:
        return _StatusColors.returnedOnContainer;
      default:
        return _StatusColors.defaultOnContainer;
    }
  }

  IconData get icon {
    switch (this) {
      case Enum$DeliveryStatus.Delivered:
        return Icons.check_circle_rounded;
      case Enum$DeliveryStatus.Failed:
        return Icons.error_rounded;
      case Enum$DeliveryStatus.Returned:
        return Icons.keyboard_return_rounded;
      case Enum$DeliveryStatus.Picked_up:
        return Icons.local_shipping_rounded;
      case Enum$DeliveryStatus.Assigned:
        return Icons.assignment_ind_rounded;
      default:
        return Icons.schedule_rounded;
    }
  }
}
