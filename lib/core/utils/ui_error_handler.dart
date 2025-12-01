import 'package:flutter/material.dart';
import 'package:catering_flutter/core/api_exception.dart';

class UIErrorHandler {
  static String mapExceptionToMessage(dynamic exception) {
    if (exception is ApiException) {
      return exception.message;
    }
    return 'An unexpected error occurred: ${exception.toString()}';
  }

  static void handleError(
    BuildContext context,
    dynamic exception, {
    bool showDialog = false,
    String? customMessage,
  }) {
    final message = customMessage ?? mapExceptionToMessage(exception);
    if (showDialog) {
      showErrorDialog(context, 'Error', message);
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
        backgroundColor: isError ? Theme.of(context).colorScheme.error : null,
        behavior: SnackBarBehavior.floating,
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
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
