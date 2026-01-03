import 'package:catering_flutter/core/widgets/app_card.dart';
import 'package:flutter/material.dart';
import 'package:catering_flutter/l10n/app_localizations.dart';

class HorizontalBarChartWidget extends StatelessWidget {
  final List<MapEntry<String, int>> data;
  final String title;
  final String? valueLabel;
  final Color barColor;

  const HorizontalBarChartWidget({
    super.key,
    required this.data,
    required this.title,
    this.valueLabel,
    this.barColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveValueLabel =
        valueLabel ?? AppLocalizations.of(context)!.count;

    if (data.isEmpty) {
      return AppCard(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title, style: theme.textTheme.titleMedium),
            const SizedBox(height: 24),
            Text(AppLocalizations.of(context)!.noDataAvailable),
          ],
        ),
      );
    }

    final maxValue = data.map((e) => e.value).reduce((a, b) => a > b ? a : b);
    // Add 20% buffer to the max value for better visual balance
    final double maxY = maxValue < 5 ? 5.0 : maxValue * 1.2;

    return AppCard(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header matching style of other charts
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.normal,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: barColor.withValues(alpha: 1.0).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: barColor.withValues(alpha: 0.2)),
                ),
                child: Text(
                  effectiveValueLabel,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: barColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          // Chart Area (250px height matching other charts)
          SizedBox(
            height: 250,
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      // Labels on the left
                      SizedBox(
                        width: 100,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: data.map((entry) {
                              return Expanded(
                                child: Container(
                                  padding: const EdgeInsets.only(right: 12.0),
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    entry.key,
                                    style: theme.textTheme.labelSmall,
                                    textAlign: TextAlign.right,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      // Chart area with grid and bars
                      Expanded(
                        child: Stack(
                          children: [
                            // Grid Lines (Vertical matching fl_chart feel)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(6, (index) {
                                return Container(
                                  width: 1,
                                  color: Colors.grey.withValues(alpha: 0.15),
                                );
                              }),
                            ),
                            // Bars
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: data.map((entry) {
                                  final percentage = (entry.value / maxY).clamp(
                                    0.0,
                                    1.0,
                                  );
                                  return _buildBar(
                                    context,
                                    entry,
                                    percentage,
                                    effectiveValueLabel,
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // X-Axis Scale Labels (Now inside the 250px footprint)
                Padding(
                  padding: const EdgeInsets.only(left: 100.0, top: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(6, (index) {
                      final value = (maxY / 5 * index).toInt();
                      String label;
                      if (value >= 1000000) {
                        label = '${(value / 1000000).toStringAsFixed(1)}M';
                      } else if (value >= 1000) {
                        label = '${(value / 1000).toStringAsFixed(0)}K';
                      } else {
                        label = '$value';
                      }
                      return Text(label, style: theme.textTheme.labelSmall);
                    }),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBar(
    BuildContext context,
    MapEntry<String, int> entry,
    double percentage,
    String valueLabel,
  ) {
    final theme = Theme.of(context);

    // Height of each bar is handled by the Column mainAxisAlignment: spaceEvenly
    return Expanded(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Row(
              children: [
                // Bar itself
                Tooltip(
                  message: '${entry.key}\n${entry.value} $valueLabel',
                  preferBelow: false,
                  textAlign: TextAlign.center,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF526A76),
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.2),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  textStyle: theme.textTheme.labelSmall?.copyWith(
                    color: Colors.white,
                    fontSize: 11,
                  ),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 800),
                    curve: Curves.easeOutCubic,
                    width: (constraints.maxWidth * percentage).clamp(
                      0.0,
                      constraints.maxWidth,
                    ),
                    height: 24,
                    decoration: BoxDecoration(
                      color: barColor,
                      borderRadius: const BorderRadius.horizontal(
                        right: Radius.circular(4),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: barColor.withValues(alpha: 0.2),
                          blurRadius: 4,
                          offset: const Offset(2, 2),
                        ),
                      ],
                    ),
                    // Only show text inside if there is space
                    child: percentage > 0.2
                        ? Center(
                            child: Text(
                              '${entry.value}',
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                                shadows: const [
                                  Shadow(color: Colors.black, blurRadius: 2),
                                ],
                              ),
                            ),
                          )
                        : null,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
