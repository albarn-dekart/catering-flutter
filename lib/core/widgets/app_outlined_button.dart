import 'package:flutter/material.dart';

class AppOutlinedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? label;
  final Widget? customLabel;
  final IconData? icon;
  final Widget? customIcon;
  final bool isLoading;
  final Color? color;
  final double? height;
  final bool isFullWidth;

  const AppOutlinedButton({
    super.key,
    required this.onPressed,
    this.label,
    this.customLabel,
    this.icon,
    this.customIcon,
    this.isLoading = false,
    this.color,
    this.height = 48,
    this.isFullWidth = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final buttonColor = color ?? theme.colorScheme.primary;

    final Widget labelWidget =
        customLabel ??
        Text(
          label ?? '',
          style: theme.textTheme.titleLarge?.copyWith(
            color: buttonColor,
            fontWeight: FontWeight.w600,
          ),
        );

    final Widget iconWidget =
        isLoading
            ? SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 2, color: buttonColor),
            )
            : (customIcon ??
                (icon != null ? Icon(icon, size: 20) : const SizedBox.shrink()));

    return SizedBox(
      width: isFullWidth ? double.infinity : null,
      height: height,
      child: OutlinedButton.icon(
        onPressed: isLoading ? null : onPressed,
        icon: iconWidget,
        label: labelWidget,
        style: OutlinedButton.styleFrom(
          foregroundColor: buttonColor,
          side: BorderSide(color: buttonColor, width: 1.5),
          backgroundColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
    );
  }
}
