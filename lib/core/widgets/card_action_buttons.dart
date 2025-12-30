import 'package:flutter/material.dart';
import 'package:catering_flutter/l10n/app_localizations.dart';

/// A standardized row of action buttons for cards.
///
/// This widget provides consistent styling for Edit and Delete buttons
/// commonly used across card widgets like [MealCard] and [RestaurantCard].
class CardActionButtons extends StatelessWidget {
  /// Callback when the edit button is pressed.
  /// If null, the edit button will not be shown.
  final VoidCallback? onEdit;

  /// Callback when the delete button is pressed.
  /// If null, the delete button will not be shown.
  final VoidCallback? onDelete;

  /// Custom label for the edit button. Defaults to localized "Edit".
  final String? editLabel;

  /// Custom label for the delete button. Defaults to localized "Delete".
  final String? deleteLabel;

  /// Custom icon for the edit button. Defaults to [Icons.edit].
  final IconData editIcon;

  /// Custom icon for the delete button. Defaults to [Icons.delete_outline].
  final IconData deleteIcon;

  /// Additional custom actions to display after the standard buttons.
  final List<Widget>? extraActions;

  /// Size of the icons. Defaults to 18.
  final double iconSize;

  const CardActionButtons({
    super.key,
    this.onEdit,
    this.onDelete,
    this.editLabel,
    this.deleteLabel,
    this.editIcon = Icons.edit,
    this.deleteIcon = Icons.delete_outline,
    this.extraActions,
    this.iconSize = 18,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    final List<Widget> buttons = [];

    if (onEdit != null) {
      buttons.add(
        TextButton.icon(
          onPressed: onEdit,
          icon: Icon(editIcon, size: iconSize),
          label: Text(editLabel ?? l10n.edit),
        ),
      );
    }

    if (onDelete != null) {
      if (buttons.isNotEmpty) {
        buttons.add(const SizedBox(width: 8));
      }
      buttons.add(
        TextButton.icon(
          onPressed: onDelete,
          icon: Icon(deleteIcon, size: iconSize),
          label: Text(deleteLabel ?? l10n.delete),
          style: TextButton.styleFrom(foregroundColor: theme.colorScheme.error),
        ),
      );
    }

    if (extraActions != null && extraActions!.isNotEmpty) {
      for (final action in extraActions!) {
        if (buttons.isNotEmpty) {
          buttons.add(const SizedBox(width: 8));
        }
        buttons.add(action);
      }
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: buttons,
    );
  }
}

/// A helper class to show a standardized delete confirmation dialog.
///
/// Usage:
/// ```dart
/// final confirmed = await DeleteConfirmationDialog.show(
///   context: context,
///   title: 'Delete Item',
///   message: 'Are you sure you want to delete this item?',
/// );
/// if (confirmed) {
///   // Perform delete
/// }
/// ```
class DeleteConfirmationDialog {
  /// Shows a delete confirmation dialog and returns true if confirmed.
  static Future<bool> show({
    required BuildContext context,
    required String title,
    required String message,
  }) async {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton.icon(
            onPressed: () => Navigator.pop(context, false),
            icon: const Icon(Icons.close, size: 18),
            label: Text(l10n.cancel),
          ),
          TextButton.icon(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(
              foregroundColor: theme.colorScheme.error,
            ),
            icon: const Icon(Icons.delete, size: 18),
            label: Text(l10n.delete),
          ),
        ],
      ),
    );

    return result ?? false;
  }
}
