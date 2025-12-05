import 'package:flutter/material.dart';

class ResponsiveGrid extends StatelessWidget {
  final List<Widget> children;
  final double childAspectRatio;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final EdgeInsetsGeometry padding;

  const ResponsiveGrid({
    super.key,
    required this.children,
    this.childAspectRatio = 1.5,
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
        return GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: padding,
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: mainAxisSpacing,
          crossAxisSpacing: crossAxisSpacing,
          childAspectRatio: childAspectRatio,
          children: children,
        );
      },
    );
  }
}

class ResponsiveGridBuilder extends StatelessWidget {
  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;
  final double childAspectRatio;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final EdgeInsetsGeometry padding;

  final ScrollController? controller;

  const ResponsiveGridBuilder({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.childAspectRatio = 1.5,
    this.mainAxisSpacing = 16,
    this.crossAxisSpacing = 16,
    this.padding = const EdgeInsets.all(24),
    this.controller,
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
        return GridView.builder(
          shrinkWrap: true,
          physics: controller == null
              ? const NeverScrollableScrollPhysics()
              : null,
          controller: controller,
          padding: padding,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: mainAxisSpacing,
            crossAxisSpacing: crossAxisSpacing,
            childAspectRatio: childAspectRatio,
          ),
          itemCount: itemCount,
          itemBuilder: itemBuilder,
        );
      },
    );
  }
}
