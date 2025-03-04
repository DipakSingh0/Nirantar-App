import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:nira/constants/colors.dart';
import 'package:nira/features/core/model/iot_data.dart';

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
  final List<IotData> data;

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    final int minutes = (value * 0.5).toInt();
    final String timeLabel =
        '${minutes ~/ 60}:${(minutes % 60).toString().padLeft(2, '0')}';
    return SideTitleWidget(
      meta: meta,
      space: 4,
      child: Text(
        timeLabel,
        style: TextStyle(
          fontSize: 8,
          color: mainLineColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: AppColors.mainTextColor3,
      fontSize: 10,
    );
    return SideTitleWidget(
      meta: meta,
      child: Text('${value.toInt()}', style: style),
    );
  }

  @override
  Widget build(BuildContext context) {
    const cutOffYValue = 5.0;

    final List<FlSpot> spots = data.map((point) {
      return FlSpot(
        point.timestamp.millisecondsSinceEpoch.toDouble(),
        point.heartRate,
      );
    }).toList();

    return LineChart(
      LineChartData(
        lineTouchData: const LineTouchData(enabled: false),
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            isCurved: true,
            barWidth: 4,
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
                fontSize: 10,
                color: mainLineColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 12,
              interval: 1,
              getTitlesWidget: bottomTitleWidgets,
            ),
          ),
          leftTitles: AxisTitles(
            axisNameSize: 16,
            axisNameWidget: const Text(
              'Value',
              style: TextStyle(
                color: AppColors.mainTextColor2,
                fontSize: 10,
              ),
            ),
            sideTitles: SideTitles(
              showTitles: true,
              interval: 1,
              reservedSize: 30,
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
