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
    this.margin,
    this.color,
    this.elevation,
    this.shape,
    this.clipBehavior = Clip.antiAlias,
    this.borderOnForeground = true,
  });

  @override
  Widget build(BuildContext context) {
    final cardContent = padding == null
        ? Padding(padding: const EdgeInsets.all(16.0), child: child)
        : Padding(padding: padding!, child: child);

    return Card(
      elevation: elevation,
      color: color,
      margin: margin,
      shape: shape,
      clipBehavior: clipBehavior,
      borderOnForeground: borderOnForeground,
      child: onTap != null
          ? InkWell(onTap: onTap, child: cardContent)
          : cardContent,
    );
  }
}
