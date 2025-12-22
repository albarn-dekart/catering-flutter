import 'dart:math';
import 'package:flutter/material.dart';

class ResponsiveGrid extends StatelessWidget {
  final List<Widget> children;
  final double preferredItemHeight;
  final int maxColumns;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final EdgeInsetsGeometry padding;

  const ResponsiveGrid({
    super.key,
    required this.children,
    required this.preferredItemHeight,
    this.maxColumns = 3,
    this.mainAxisSpacing = 16,
    this.crossAxisSpacing = 16,
    this.padding = const EdgeInsets.all(24),
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final (crossAxisCount, aspectRatio) = _calculateLayout(
          constraints.maxWidth,
          maxColumns,
          preferredItemHeight,
          padding,
          crossAxisSpacing,
        );

        return GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: padding,
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: mainAxisSpacing,
          crossAxisSpacing: crossAxisSpacing,
          childAspectRatio: aspectRatio,
          children: children,
        );
      },
    );
  }

  static (int, double) _calculateLayout(
    double maxWidth,
    int maxColumns,
    double preferredHeight,
    EdgeInsetsGeometry padding,
    double crossAxisSpacing,
  ) {
    // Determine number of columns based on width
    int count;
    if (maxWidth > 1100) {
      count = maxColumns;
    } else if (maxWidth > 700) {
      count = min(maxColumns, 2);
    } else {
      count = 1;
    }

    // Calculate aspect ratio for fixed height
    final double horizontalPadding = padding.horizontal;
    final double totalSpacing = (count - 1) * crossAxisSpacing;
    final double itemWidth =
        (maxWidth - horizontalPadding - totalSpacing) / count;

    double ratio = 1.0;
    if (itemWidth > 0 && preferredHeight > 0) {
      ratio = itemWidth / preferredHeight;
    }

    return (count, ratio);
  }
}

class ResponsiveGridBuilder extends StatelessWidget {
  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;
  final double preferredItemHeight;
  final int maxColumns;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final EdgeInsetsGeometry padding;
  final ScrollController? controller;
  final ScrollPhysics? physics;
  final bool shrinkWrap;

  const ResponsiveGridBuilder({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    required this.preferredItemHeight,
    this.maxColumns = 3,
    this.mainAxisSpacing = 16,
    this.crossAxisSpacing = 16,
    this.padding = const EdgeInsets.all(24),
    this.controller,
    this.physics,
    this.shrinkWrap = false,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final (crossAxisCount, aspectRatio) = ResponsiveGrid._calculateLayout(
          constraints.maxWidth,
          maxColumns,
          preferredItemHeight,
          padding,
          crossAxisSpacing,
        );

        return GridView.builder(
          shrinkWrap: shrinkWrap,
          physics:
              physics ??
              (controller == null
                  ? const NeverScrollableScrollPhysics()
                  : null),
          controller: controller,
          padding: padding,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: mainAxisSpacing,
            crossAxisSpacing: crossAxisSpacing,
            childAspectRatio: aspectRatio,
          ),
          itemCount: itemCount,
          itemBuilder: itemBuilder,
        );
      },
    );
  }
}
