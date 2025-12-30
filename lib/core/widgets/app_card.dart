import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final double? elevation;
  final ShapeBorder? shape;
  final Clip clipBehavior;
  final bool borderOnForeground;

  const AppCard({
    super.key,
    required this.child,
    this.onTap,
    this.padding,
    this.margin = EdgeInsets.zero,
    this.color,
    this.elevation = 0,
    this.shape,
    this.clipBehavior = Clip.antiAlias,
    this.borderOnForeground = true,
  });

  @override
  Widget build(BuildContext context) {
    final cardContent = padding == null
        ? child
        : Padding(padding: padding!, child: child);

    final theme = Theme.of(context);
    final defaultShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
      side: BorderSide(color: theme.colorScheme.outlineVariant),
    );

    return Card(
      elevation: elevation,
      color: color,
      margin: margin,
      shape: shape ?? defaultShape,
      clipBehavior: clipBehavior,
      borderOnForeground: borderOnForeground,
      child: onTap != null
          ? InkWell(
              onTap: onTap,
              borderRadius: (shape ?? defaultShape) is RoundedRectangleBorder
                  ? ((shape ?? defaultShape) as RoundedRectangleBorder)
                            .borderRadius
                        as BorderRadius
                  : BorderRadius.circular(24),
              child: cardContent,
            )
          : cardContent,
    );
  }
}
