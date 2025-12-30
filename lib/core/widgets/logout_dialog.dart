import 'package:flutter/material.dart';
import 'package:catering_flutter/core/widgets/app_premium_button.dart';
import 'package:catering_flutter/l10n/app_localizations.dart';

class LogoutConfirmationDialog {
  static Future<bool> show(BuildContext context) async {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.logout),
        content: Text(l10n.areYouSureYouWantToLogout),
        actions: [
          TextButton.icon(
            onPressed: () => Navigator.of(context).pop(false),
            icon: const Icon(Icons.close),
            label: Text(l10n.cancel),
          ),
          AppPremiumButton(
            onPressed: () => Navigator.of(context).pop(true),
            backgroundColor: theme.colorScheme.error,
            foregroundColor: theme.colorScheme.onError,
            icon: Icons.logout,
            label: l10n.logout,
            isFullWidth: false,
          ),
        ],
      ),
    );

    return result ?? false;
  }
}
