import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:nira/constants/colors.dart';

class LineChartSample4 extends StatelessWidget {
  LineChartSample4({
    super.key,
    required this.data,
    Color? mainLineColor,
    Color? belowLineColor,
    Color? aboveLineColor,
  })  : mainLineColor =
            mainLineColor ?? AppColors.contentColorYellow.withOpacity(1),
        belowLineColor =
            belowLineColor ?? AppColors.contentColorPink.withOpacity(1),
        aboveLineColor =
            aboveLineColor ?? AppColors.contentColorPurple.withOpacity(0.7);

  final Color mainLineColor;
  final Color belowLineColor;
  final Color aboveLineColor;
  final List<Map<String, dynamic>> data;

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    // Convert the X-axis value to a time label (e.g., 0:00, 0:30, 1:00, etc.)
    final int minutes = (value * 0.5).toInt(); // 0.5 represents 30 seconds
    final String timeLabel =
        '${minutes ~/ 60}:${(minutes % 60).toString().padLeft(2, '0')}';
    return SideTitleWidget(
      meta: meta,
      space: 4,
      child: Text(
        timeLabel,
        style: TextStyle(
          fontSize: 8, // Reduced font size
          color: mainLineColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: AppColors.mainTextColor3,
      fontSize: 10, // Reduced font size
    );
    return SideTitleWidget(
      meta: meta,
      child: Text('${value.toInt()}', style: style),
    );
  }

  @override
  Widget build(BuildContext context) {
    const cutOffYValue = 5.0;

    // Generate spots for the chart
    final List<FlSpot> spots = data.map((point) {
      return FlSpot(point['x'].toDouble(), point['y'].toDouble());
    }).toList();

    return LineChart(
      LineChartData(
        lineTouchData: const LineTouchData(enabled: false),
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            isCurved: true,
            barWidth: 4, // Reduced bar width
            color: mainLineColor,
            belowBarData: BarAreaData(
              show: true,
              color: belowLineColor,
              cutOffY: cutOffYValue,
              applyCutOffY: true,
            ),
            aboveBarData: BarAreaData(
              show: true,
              color: aboveLineColor,
              cutOffY: cutOffYValue,
              applyCutOffY: true,
            ),
            dotData: const FlDotData(
              show: false,
            ),
          ),
        ],
        minY: 0,
        titlesData: FlTitlesData(
          show: true,
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            axisNameWidget: Text(
              'Time (30s intervals)',
              style: TextStyle(
                fontSize: 10, // Reduced font size
                color: mainLineColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 12, // Reduced reserved size
              interval: 1,
              getTitlesWidget: bottomTitleWidgets,
            ),
          ),
          leftTitles: AxisTitles(
            axisNameSize: 16, // Reduced axis name size
            axisNameWidget: const Text(
              'Value',
              style: TextStyle(
                color: AppColors.mainTextColor2,
                fontSize: 10, // Reduced font size
              ),
            ),
            sideTitles: SideTitles(
              showTitles: true,
              interval: 1,
              reservedSize: 30, // Reduced reserved size
              getTitlesWidget: leftTitleWidgets,
            ),
          ),
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.all(
            color: AppColors.borderColor,
          ),
        ),
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          horizontalInterval: 1,
          checkToShowHorizontalLine: (double value) {
            return value == 1 || value == 6 || value == 4 || value == 5;
          },
        ),
      ),
    );
  }
}
