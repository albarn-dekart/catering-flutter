import 'package:catering_flutter/core/widgets/app_card.dart';
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
      return AppCard(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(chartTitle, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 16),
            const Text('No order data available'),
          ],
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

    // Ensure nice integer intervals
    final double interval = maxCount <= 5
        ? 1.0
        : (maxCount / 5).ceil().toDouble();
    final effectiveMaxY = interval * 5;

    return AppCard(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                chartTitle,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.normal,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.orange.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.orange.withValues(alpha: 0.2),
                  ),
                ),
                child: Text(
                  AppLocalizations.of(context)!.orders,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Colors.orange.shade800,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
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
                      interval: interval,
                      reservedSize: 40,
                      getTitlesWidget: (value, meta) {
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
                  border: Border.all(color: Colors.grey.withValues(alpha: 0.3)),
                ),
                minX: 0,
                maxX: spots.length <= 1 ? 1.0 : (spots.length - 1).toDouble(),
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
                          '$dateStr\n$count ${AppLocalizations.of(context)!.orders}',
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
    );
  }
}
