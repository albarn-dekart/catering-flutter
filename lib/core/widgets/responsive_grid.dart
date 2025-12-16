import 'package:flutter/material.dart';

class ResponsiveGrid extends StatelessWidget {
  final List<Widget> children;
  final double preferredItemHeight;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final EdgeInsetsGeometry padding;

  const ResponsiveGrid({
    super.key,
    required this.children,
    required this.preferredItemHeight,
    this.mainAxisSpacing = 16,
    this.crossAxisSpacing = 16,
    this.padding = const EdgeInsets.all(24),
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

        final double horizontalPadding = padding.horizontal;
        final double totalSpacing = (crossAxisCount - 1) * crossAxisSpacing;
        final double itemWidth =
            (constraints.maxWidth - horizontalPadding - totalSpacing) /
            crossAxisCount;

        // Default to square if calculation fails or width is invalid
        double aspectRatio = 1.0;
        if (itemWidth > 0 && preferredItemHeight > 0) {
          aspectRatio = itemWidth / preferredItemHeight;
        }

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
}

class ResponsiveGridBuilder extends StatelessWidget {
  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;
  final double preferredItemHeight;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final EdgeInsetsGeometry padding;
  final ScrollController? controller;
  final ScrollPhysics? physics;

  const ResponsiveGridBuilder({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    required this.preferredItemHeight,
    this.mainAxisSpacing = 16,
    this.crossAxisSpacing = 16,
    this.padding = const EdgeInsets.all(24),
    this.controller,
    this.physics,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final int crossAxisCount = constraints.maxWidth > 1100
            ? 3
            : constraints.maxWidth > 700
            ? 2
            : 1;

        final double horizontalPadding = padding.horizontal;
        final double totalSpacing = (crossAxisCount - 1) * crossAxisSpacing;
        final double itemWidth =
            (constraints.maxWidth - horizontalPadding - totalSpacing) /
            crossAxisCount;

        double aspectRatio = 1.0;
        if (itemWidth > 0 && preferredItemHeight > 0) {
          aspectRatio = itemWidth / preferredItemHeight;
        }

        return GridView.builder(
          shrinkWrap: true,
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
