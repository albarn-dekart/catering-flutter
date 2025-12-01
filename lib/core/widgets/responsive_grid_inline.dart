import 'package:flutter/material.dart';

/// A responsive grid-like wrapper that uses Column and Wrap
/// Useful when you need a non-scrollable grid inside a SingleChildScrollView
class ResponsiveGridInline extends StatelessWidget {
  final List<Widget> children;
  final double childAspectRatio;
  final double spacing;
  final EdgeInsetsGeometry padding;

  const ResponsiveGridInline({
    super.key,
    required this.children,
    this.childAspectRatio = 1.5,
    this.spacing = 16,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final int crossAxisCount = constraints.maxWidth > 1100
            ? 4
            : constraints.maxWidth > 700
            ? 2
            : 1;

        // Calculate item width based on cross axis count
        final itemWidth =
            (constraints.maxWidth -
                (padding.horizontal) -
                (spacing * (crossAxisCount - 1))) /
            crossAxisCount;
        final itemHeight = itemWidth / childAspectRatio;

        return Padding(
          padding: padding,
          child: Wrap(
            spacing: spacing,
            runSpacing: spacing,
            children: children.map((child) {
              return SizedBox(
                width: itemWidth,
                height: itemHeight,
                child: child,
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
