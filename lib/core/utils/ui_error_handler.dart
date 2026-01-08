import 'dart:async';
import 'dart:io';
import 'package:catering_flutter/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:catering_flutter/core/services/api_service.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class UIErrorHandler {
  static String mapExceptionToMessage(
    dynamic exception, [
    BuildContext? context,
  ]) {
    final localizations = context != null ? AppLocalizations.of(context) : null;

    if (exception is ApiException) {
      if (exception.message.contains('Unauthorized') ||
          exception.message.contains('expired')) {
        return localizations?.errorUnauthorized ?? 'Session expired.';
      }
      return exception.message;
    }

    if (exception is TimeoutException) {
      return localizations?.errorTimeout ??
          'Request timed out. Please try again.';
    }

    if (exception is SocketException) {
      return localizations?.errorNetwork ??
          'Network error. Please check your connection.';
    }

    if (exception is OperationException) {
      // GraphQL exception
      if (exception.linkException != null) {
        return mapExceptionToMessage(exception.linkException, context);
      }
      if (exception.graphqlErrors.isNotEmpty) {
        final messages = exception.graphqlErrors
            .map((e) {
              final msg = e.message;
              if (msg.contains('not defined by type')) {
                return localizations?.errorInvalidSchema ??
                    'Technical error: The app and server versions are out of sync. Please contact support.';
              }
              if (msg.contains('ConstraintViolationException')) {
                return localizations?.errorConstraintViolation ??
                    'This action cannot be completed because of a data conflict.';
              }
              if (msg.contains('Access Denied')) {
                return localizations?.errorUnauthorized ??
                    'You do not have permission to perform this action.';
              }
              return msg;
            })
            .join('\n');
        return messages;
      }
    }

    // Handle string representation if it contains certain technical terms
    final errorString = exception.toString().toLowerCase();
    if (errorString.contains('timeoutexception') ||
        errorString.contains('timeout') ||
        errorString.contains('no stream event')) {
      return localizations?.errorTimeout ??
          'Request timed out. The server is taking too long to respond.';
    }
    if (errorString.contains('socketexception') ||
        errorString.contains('connection refused')) {
      return localizations?.errorNetwork ??
          'Network error. Please check your connection.';
    }

    if (localizations != null) {
      return localizations.unexpectedError(exception.toString());
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
    final messenger = ScaffoldMessenger.of(context);
    messenger.hideCurrentSnackBar();

    messenger.showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError
            ? Theme.of(context).colorScheme.error
            : Theme.of(context).colorScheme.inverseSurface,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 5),
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
          TextButton.icon(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.check),
            label: Text(AppLocalizations.of(context)!.ok),
          ),
        ],
      ),
    );
  }
}
