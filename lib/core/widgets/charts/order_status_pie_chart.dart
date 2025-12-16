import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:catering_flutter/graphql/schema.graphql.dart';
import 'package:catering_flutter/core/utils/status_extensions.dart';
import 'package:catering_flutter/l10n/app_localizations.dart';

class OrderStatusPieChart extends StatefulWidget {
  final Map<Enum$OrderStatus, int> ordersByStatus;
  final String? title;

  const OrderStatusPieChart({
    super.key,
    required this.ordersByStatus,
    this.title,
  });

  @override
  State<OrderStatusPieChart> createState() => _OrderStatusPieChartState();
}

class _OrderStatusPieChartState extends State<OrderStatusPieChart> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    // Localize title if not provided
    final chartTitle =
        widget.title ?? AppLocalizations.of(context)!.ordersByStatus;

    if (widget.ordersByStatus.isEmpty) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(chartTitle, style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 16),
              Text(AppLocalizations.of(context)!.noOrderData),
            ],
          ),
        ),
      );
    }

    final totalOrders = widget.ordersByStatus.values.reduce((a, b) => a + b);

    final sections = widget.ordersByStatus.entries.toList().asMap().entries.map(
      (entry) {
        final index = entry.key;
        final dataEntry = entry.value;
        final isTouched = index == touchedIndex;
        final fontSize = isTouched ? 16.0 : 14.0;
        final radius = isTouched ? 110.0 : 100.0;
        final percentage = (dataEntry.value / totalOrders) * 100;

        return PieChartSectionData(
          color: dataEntry.key.chartColor,
          value: dataEntry.value.toDouble(),
          title: isTouched
              ? '${dataEntry.key.getLabel(context)}\n${dataEntry.value}'
              : '${percentage.toStringAsFixed(1)}%',
          radius: radius,
          titlePositionPercentageOffset: 0.6,
          titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            shadows: const [Shadow(color: Colors.black, blurRadius: 2)],
          ),
        );
      },
    ).toList();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              chartTitle,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            LayoutBuilder(
              builder: (context, constraints) {
                final isWide = constraints.maxWidth > 500;
                if (isWide) {
                  return Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: SizedBox(
                          height: 250,
                          child: PieChart(
                            PieChartData(
                              pieTouchData: PieTouchData(
                                touchCallback:
                                    (FlTouchEvent event, pieTouchResponse) {
                                      setState(() {
                                        if (!event
                                                .isInterestedForInteractions ||
                                            pieTouchResponse == null ||
                                            pieTouchResponse.touchedSection ==
                                                null) {
                                          touchedIndex = -1;
                                          return;
                                        }
                                        touchedIndex = pieTouchResponse
                                            .touchedSection!
                                            .touchedSectionIndex;
                                      });
                                    },
                              ),
                              borderData: FlBorderData(show: false),
                              sectionsSpace: 2,
                              centerSpaceRadius: 0,
                              sections: sections,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: widget.ordersByStatus.entries.map((entry) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 4.0,
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 12,
                                    height: 12,
                                    decoration: BoxDecoration(
                                      color: entry.key.chartColor,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      '${entry.key.getLabel(context)} (${entry.value})',
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      SizedBox(
                        height: 250,
                        child: PieChart(
                          PieChartData(
                            pieTouchData: PieTouchData(
                              touchCallback:
                                  (FlTouchEvent event, pieTouchResponse) {
                                    setState(() {
                                      if (!event.isInterestedForInteractions ||
                                          pieTouchResponse == null ||
                                          pieTouchResponse.touchedSection ==
                                              null) {
                                        touchedIndex = -1;
                                        return;
                                      }
                                      touchedIndex = pieTouchResponse
                                          .touchedSection!
                                          .touchedSectionIndex;
                                    });
                                  },
                            ),
                            borderData: FlBorderData(show: false),
                            sectionsSpace: 2,
                            centerSpaceRadius: 0,
                            sections: sections,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Wrap(
                        spacing: 16,
                        runSpacing: 8,
                        children: widget.ordersByStatus.entries.map((entry) {
                          return Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 12,
                                height: 12,
                                decoration: BoxDecoration(
                                  color: entry.key.chartColor,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '${entry.key.getLabel(context)} (${entry.value})',
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
