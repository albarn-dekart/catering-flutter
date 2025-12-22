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
        return exception.graphqlErrors.map((e) => e.message).join(', ');
      }
    }

    // Handle string representation if it contains certain technical terms
    final errorString = exception.toString();
    if (errorString.contains('TimeoutException')) {
      return localizations?.errorTimeout ?? 'Request timed out.';
    }
    if (errorString.contains('SocketException')) {
      return localizations?.errorNetwork ?? 'Network error.';
    }

    if (localizations != null) {
      return localizations.unexpectedError(errorString);
    }
    return 'An unexpected error occurred: $errorString';
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
