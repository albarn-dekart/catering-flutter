import 'package:flutter/material.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart';
import 'package:catering_flutter/l10n/app_localizations.dart';

class GlobalErrorWidget extends StatelessWidget {
  final FlutterErrorDetails? details;
  final String? message;
  final VoidCallback? onRetry;
  final bool withScaffold;

  const GlobalErrorWidget({
    super.key,
    this.details,
    this.message,
    this.onRetry,
    this.withScaffold = true,
  });

  @override
  Widget build(BuildContext context) {
    final errorMessage =
        message ??
        details?.exceptionAsString() ??
        AppLocalizations.of(context)!.somethingWentWrong;

    final content = Center(
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 48.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Animated Error Icon Container
              Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  color: Theme.of(
                    context,
                  ).colorScheme.error.withValues(alpha: 0.05),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Theme.of(
                        context,
                      ).colorScheme.error.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.error_outline_rounded,
                      color: Theme.of(context).colorScheme.error,
                      size: 56,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Text(
                AppLocalizations.of(context)!.somethingWentWrong,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.normal,
                  letterSpacing: -0.5,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: Theme.of(
                      context,
                    ).colorScheme.outlineVariant.withValues(alpha: 0.5),
                  ),
                ),
                child: Text(
                  errorMessage,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    height: 1.6,
                  ),
                  maxLines: 8,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (onRetry != null) ...[
                const SizedBox(height: 48),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: FilledButton.icon(
                    onPressed: onRetry,
                    icon: const Icon(Icons.refresh_rounded),
                    label: Text(AppLocalizations.of(context)!.retry),
                  ),
                ),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: () => Navigator.of(context).canPop()
                      ? Navigator.of(context).pop()
                      : null,
                  child: Text(
                    AppLocalizations.of(context)!.cancel,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );

    final hasScaffold = Scaffold.maybeOf(context) != null;
    if (withScaffold && !hasScaffold) {
      return CustomScaffold(
        title: AppLocalizations.of(context)!.error,
        child: content,
      );
    }

    return content;
  }
}
