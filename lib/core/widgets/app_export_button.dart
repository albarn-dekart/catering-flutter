import 'package:flutter/material.dart';
import 'package:catering_flutter/l10n/app_localizations.dart';

class AppExportButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isLoading;
  final String? tooltip;

  const AppExportButton({
    super.key,
    this.onPressed,
    this.isLoading = false,
    this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const SizedBox(
        width: 48,
        height: 48,
        child: Padding(
          padding: EdgeInsets.all(14),
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      );
    }

    return IconButton.filledTonal(
      onPressed: onPressed,
      icon: const Icon(Icons.download_rounded, size: 22),
      tooltip: tooltip ?? AppLocalizations.of(context)!.exportData,
      style: IconButton.styleFrom(
        // Inherits StadiumBorder and shadow from global theme
      ),
    );
  }
}
