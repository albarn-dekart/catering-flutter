import 'package:catering_flutter/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:catering_flutter/core/services/api_service.dart';

class UIErrorHandler {
  static String mapExceptionToMessage(
    dynamic exception, [
    BuildContext? context,
  ]) {
    if (exception is ApiException) {
      return exception.message;
    }
    if (context != null) {
      return AppLocalizations.of(
        context,
      )!.unexpectedError(exception.toString());
    }
    return 'An unexpected error occurred: ${exception.toString()}';
  }

  static void handleError(
    BuildContext context,
    dynamic exception, {
    bool showDialog = false,
    String? customMessage,
  }) {
    final message = customMessage ?? mapExceptionToMessage(exception, context);
    if (showDialog) {
      showErrorDialog(context, AppLocalizations.of(context)!.error, message);
    } else {
      showSnackBar(context, message, isError: true);
    }
  }

  static void showSnackBar(
    BuildContext context,
    String message, {
    bool isError = true,
    SnackBarAction? action,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError
            ? Theme.of(context).colorScheme.error
            : Theme.of(context).colorScheme.inverseSurface,
        behavior: SnackBarBehavior.fixed, // Fixed at bottom, below FAB
        action: action,
      ),
    );
  }

  static Future<void> showErrorDialog(
    BuildContext context,
    String title,
    String message,
  ) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(AppLocalizations.of(context)!.ok),
          ),
        ],
      ),
    );
  }
}
