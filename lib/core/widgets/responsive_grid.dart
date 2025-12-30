import 'dart:math';
import 'package:flutter/material.dart';

class ResponsiveGrid extends StatelessWidget {
  final List<Widget> children;
  final int maxColumns;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final EdgeInsetsGeometry padding;

  const ResponsiveGrid({
    super.key,
    required this.children,
    this.maxColumns = 3,
    this.mainAxisSpacing = 24,
    this.crossAxisSpacing = 24,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = _calculateColumnCount(
          constraints.maxWidth,
          maxColumns,
        );

        final List<Widget> rows = [];
        for (int i = 0; i < children.length; i += crossAxisCount) {
          final chunk = children.sublist(
            i,
            min(i + crossAxisCount, children.length),
          );

          if (rows.isNotEmpty) {
            rows.add(SizedBox(height: mainAxisSpacing));
          }

          rows.add(
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: List.generate(crossAxisCount, (index) {
                  final widget = index < chunk.length ? chunk[index] : null;

                  return Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: index == 0 ? 0 : crossAxisSpacing / 2,
                        right: index == crossAxisCount - 1
                            ? 0
                            : crossAxisSpacing / 2,
                      ),
                      child: widget ?? const SizedBox.shrink(),
                    ),
                  );
                }),
              ),
            ),
          );
        }

        return Padding(
          padding: padding,
          child: Column(children: rows),
        );
      },
    );
  }

  static int _calculateColumnCount(double maxWidth, int maxColumns) {
    if (maxWidth > 1100) {
      return maxColumns;
    } else if (maxWidth > 700) {
      return min(maxColumns, 2);
    } else {
      return 1;
    }
  }
}

class ResponsiveGridBuilder extends StatelessWidget {
  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;
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
    this.maxColumns = 3,
    this.mainAxisSpacing = 24,
    this.crossAxisSpacing = 24,
    this.padding = EdgeInsets.zero,
    this.controller,
    this.physics,
    this.shrinkWrap = false,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = ResponsiveGrid._calculateColumnCount(
          constraints.maxWidth,
          maxColumns,
        );

        final int rowCount = (itemCount / crossAxisCount).ceil();

        return ListView.separated(
          shrinkWrap: shrinkWrap,
          physics:
              physics ??
              (controller == null
                  ? const NeverScrollableScrollPhysics()
                  : null),
          controller: controller,
          padding: padding,
          itemCount: rowCount,
          separatorBuilder: (context, index) =>
              SizedBox(height: mainAxisSpacing),
          itemBuilder: (context, rowIndex) {
            return IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: List.generate(crossAxisCount, (colIndex) {
                  final itemIndex = rowIndex * crossAxisCount + colIndex;

                  if (itemIndex >= itemCount) {
                    return const Expanded(child: SizedBox.shrink());
                  }

                  return Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: colIndex == 0 ? 0 : crossAxisSpacing / 2,
                        right: colIndex == crossAxisCount - 1
                            ? 0
                            : crossAxisSpacing / 2,
                      ),
                      child: itemBuilder(context, itemIndex),
                    ),
                  );
                }),
              ),
            );
          },
        );
      },
    );
  }
}
