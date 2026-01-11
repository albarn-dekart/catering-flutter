import 'dart:async';
import 'package:catering_flutter/core/widgets/app_outlined_button.dart';
import 'package:catering_flutter/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class UndoTimerButton extends StatefulWidget {
  final String statusUpdatedAt;
  final bool isUpdating;
  final VoidCallback onUndo;
  final VoidCallback? onExpired;

  const UndoTimerButton({
    super.key,
    required this.statusUpdatedAt,
    required this.isUpdating,
    required this.onUndo,
    this.onExpired,
  });

  @override
  State<UndoTimerButton> createState() => _UndoTimerButtonState();
}

class _UndoTimerButtonState extends State<UndoTimerButton> {
  late int _remainingSeconds = 60;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void didUpdateWidget(UndoTimerButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.statusUpdatedAt != widget.statusUpdatedAt) {
      _timer?.cancel();
      _startTimer();
    }
  }

  void _startTimer() {
    final updatedAt = DateTime.parse(widget.statusUpdatedAt).toLocal();
    final now = DateTime.now().toLocal();
    final diff = now.difference(updatedAt).inSeconds;
    _remainingSeconds = 60 - diff;

    if (_remainingSeconds > 0) {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (mounted) {
          final newDiff =
              DateTime.now().toLocal().difference(updatedAt).inSeconds;
          setState(() {
            _remainingSeconds = 60 - newDiff;
          });
          if (_remainingSeconds <= 0) {
            timer.cancel();
            widget.onExpired?.call();
          }
        } else {
          timer.cancel();
        }
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_remainingSeconds <= 0) {
      return const SizedBox.shrink();
    }

    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: AppOutlinedButton(
        onPressed: widget.onUndo,
        isLoading: widget.isUpdating,
        color: theme.colorScheme.secondary,
        icon: Icons.undo,
        customLabel: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              AppLocalizations.of(context)!.actionUndoStatus,
              style: theme.textTheme.titleLarge?.copyWith(
                color: theme.colorScheme.secondary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 12),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: theme.colorScheme.secondary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                '${_remainingSeconds}s',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.onSecondary,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}