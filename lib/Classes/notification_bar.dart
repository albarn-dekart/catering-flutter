import 'package:flutter/material.dart';
import 'package:catering_app/Classes/app_theme.dart';
import 'package:catering_app/main.dart';

class NotificationBar {
  void show(String message, Color backgroundColor, [String? debug]) {
    if (debug != null) debugPrint(debug);

    final textColor =
        backgroundColor.computeLuminance() > 0.5 ? Colors.black : Colors.white70;

    scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Row(
          children: [
            _getIcon(backgroundColor),
            const SizedBox(width: AppTheme.defaultPadding),
            Expanded(child: Text(message, style: TextStyle(color: textColor)))
          ],
        ),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTheme.cardRadius),
        ),
      ),
    );
  }

  Icon _getIcon(Color color) {
    if (color == AppTheme.successColor) return const Icon(Icons.check_circle);
    if (color == AppTheme.errorColor) return const Icon(Icons.error);
    if (color == AppTheme.warningColor) return const Icon(Icons.warning);
    return const Icon(Icons.info);
  }
}
