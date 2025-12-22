import 'package:catering_flutter/l10n/app_localizations.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DailyOrdersChart extends StatelessWidget {
  final List<dynamic> dailyOrdersTimeSeries;
  final String? title;

  const DailyOrdersChart({
    super.key,
    required this.dailyOrdersTimeSeries,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    final chartTitle = title ?? AppLocalizations.of(context)!.dailyOrders;

    if (dailyOrdersTimeSeries.isEmpty) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(chartTitle, style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 16),
              const Text('No order data available'),
            ],
          ),
        ),
      );
    }

    // Parse the time series data
    final spots = <FlSpot>[];
    for (var i = 0; i < dailyOrdersTimeSeries.length; i++) {
      final dataPoint = dailyOrdersTimeSeries[i];
      final count = (dataPoint['count'] ?? 0).toInt();
      spots.add(FlSpot(i.toDouble(), count.toDouble()));
    }

    // Calculate min and max for better scaling
    final counts = spots.map((s) => s.y).toList();
    final maxCount = counts.reduce((a, b) => a > b ? a : b);

    // Ensure maxCount is at least 5 for good Y-axis intervals if low volume
    final effectiveMaxY = maxCount < 5 ? 5.0 : maxCount * 1.2;

    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 24, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              chartTitle,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.normal),
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 250,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: true,
                    getDrawingHorizontalLine: (value) {
                      return FlLine(
                        color: Colors.grey.withValues(alpha: 0.2),
                        strokeWidth: 1,
                      );
                    },
                    getDrawingVerticalLine: (value) {
                      return FlLine(
                        color: Colors.grey.withValues(alpha: 0.2),
                        strokeWidth: 1,
                      );
                    },
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 30,
                        interval: spots.length / 5 > 1 ? spots.length / 5 : 1,
                        getTitlesWidget: (value, meta) {
                          final index = value.toInt();
                          if (index < 0 ||
                              index >= dailyOrdersTimeSeries.length) {
                            return const Text('');
                          }

                          if (index == 0 && spots.length > 1) {
                            return const SizedBox.shrink();
                          }

                          final dateStr = dailyOrdersTimeSeries[index]['date'];
                          try {
                            final date = DateTime.parse(dateStr);
                            return Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                DateFormat('MM/dd').format(date),
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                            );
                          } catch (e) {
                            return const Text('');
                          }
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: effectiveMaxY / 5,
                        reservedSize: 30,
                        getTitlesWidget: (value, meta) {
                          // Only show integers
                          if (value % 1 != 0) return const Text('');
                          return Text(
                            value.toInt().toString(),
                            style: Theme.of(context).textTheme.labelSmall,
                          );
                        },
                      ),
                    ),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(
                      color: Colors.grey.withValues(alpha: 0.3),
                    ),
                  ),
                  minX: 0,
                  maxX: (spots.length - 1).toDouble(),
                  minY: 0,
                  maxY: effectiveMaxY,
                  lineBarsData: [
                    LineChartBarData(
                      spots: spots,
                      isCurved: true,
                      preventCurveOverShooting: true,
                      gradient: LinearGradient(
                        colors: [
                          Colors.orange,
                          Colors.orange.withValues(alpha: 0.6),
                        ],
                      ),
                      barWidth: 3,
                      isStrokeCapRound: true,
                      dotData: const FlDotData(show: false),
                      belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(
                          colors: [
                            Colors.orange.withValues(alpha: 0.3),
                            Colors.orange.withValues(alpha: 0.0),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ],
                  lineTouchData: LineTouchData(
                    touchTooltipData: LineTouchTooltipData(
                      fitInsideHorizontally: true,
                      fitInsideVertically: true,
                      getTooltipItems: (List<LineBarSpot> touchedSpots) {
                        return touchedSpots.map((LineBarSpot touchedSpot) {
                          final index = touchedSpot.x.toInt();
                          if (index < 0 ||
                              index >= dailyOrdersTimeSeries.length) {
                            return null;
                          }

                          final dateStr = dailyOrdersTimeSeries[index]['date'];
                          final count = touchedSpot.y.toInt();

                          return LineTooltipItem(
                            '$dateStr\n$count Orders',
                            Theme.of(context).textTheme.labelSmall?.copyWith(
                                  color: Colors.white,
                                ) ??
                                const TextStyle(color: Colors.white),
                          );
                        }).toList();
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
