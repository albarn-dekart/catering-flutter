import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:catering_flutter/l10n/app_localizations.dart';

class RevenueLineChart extends StatelessWidget {
  final List<dynamic> revenueTimeSeries;
  final String? title;

  const RevenueLineChart({
    super.key,
    required this.revenueTimeSeries,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    final chartTitle =
        title ?? AppLocalizations.of(context)!.revenueTrendLast30Days;

    if (revenueTimeSeries.isEmpty) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(chartTitle, style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 16),
              Text(AppLocalizations.of(context)!.noRevenueDataAvailable),
            ],
          ),
        ),
      );
    }

    // Parse the time series data
    final spots = <FlSpot>[];
    for (var i = 0; i < revenueTimeSeries.length; i++) {
      final dataPoint = revenueTimeSeries[i];
      final revenue = (dataPoint['revenue'] ?? 0.0).toDouble();
      spots.add(FlSpot(i.toDouble(), revenue));
    }

    // Calculate min and max for better scaling
    final revenues = spots.map((s) => s.y).toList();
    final maxRevenue = revenues.reduce((a, b) => a > b ? a : b);
    final minRevenue = revenues.reduce((a, b) => a < b ? a : b);

    // Ensure we have reasonable values for empty data (all zeros)
    final effectiveMaxY = maxRevenue < 100 ? 100.0 : maxRevenue * 1.1;
    final yAxisInterval =
        (effectiveMaxY - (minRevenue > 0 ? 0 : minRevenue)) / 5;
    final safeYInterval = yAxisInterval > 0 ? yAxisInterval : 20.0;
    final safeXInterval = spots.length > 5 ? spots.length / 5.0 : 1.0;

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
                        interval: safeXInterval,
                        getTitlesWidget: (value, meta) {
                          final index = value.toInt();
                          if (index < 0 || index >= revenueTimeSeries.length) {
                            return const Text('');
                          }

                          // Avoid showing the first label if it's too close to the start
                          // to prevent overlap with Y-axis or cutoff
                          if (index == 0) {
                            return const SizedBox.shrink();
                          }

                          final dateStr = revenueTimeSeries[index]['date'];
                          try {
                            final date = DateTime.parse(dateStr);
                            return Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                DateFormat('MM/dd').format(date),
                                style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                          } catch (e) {
                            return const Text('');
                          }
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      axisNameWidget: const Text(
                        'PLN',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      axisNameSize: 20,
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: safeYInterval,
                        reservedSize: 45,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            value.toStringAsFixed(0),
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
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
                  minY: minRevenue > 0 ? 0 : minRevenue,
                  maxY: effectiveMaxY,
                  lineBarsData: [
                    LineChartBarData(
                      spots: spots,
                      isCurved: true,
                      preventCurveOverShooting: true,
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context).primaryColor,
                          Theme.of(context).primaryColor.withValues(alpha: 0.6),
                        ],
                      ),
                      barWidth: 3,
                      isStrokeCapRound: true,
                      dotData: const FlDotData(show: false),
                      belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(
                          colors: [
                            Theme.of(
                              context,
                            ).primaryColor.withValues(alpha: 0.3),
                            Theme.of(
                              context,
                            ).primaryColor.withValues(alpha: 0.0),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ],
                  lineTouchData: LineTouchData(
                    touchTooltipData: LineTouchTooltipData(
                      getTooltipItems: (List<LineBarSpot> touchedSpots) {
                        return touchedSpots.map((LineBarSpot touchedSpot) {
                          final index = touchedSpot.x.toInt();
                          if (index < 0 || index >= revenueTimeSeries.length) {
                            return null;
                          }

                          final dateStr = revenueTimeSeries[index]['date'];
                          final revenue = touchedSpot.y;

                          return LineTooltipItem(
                            '$dateStr\n$revenue PLN',
                            const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
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
