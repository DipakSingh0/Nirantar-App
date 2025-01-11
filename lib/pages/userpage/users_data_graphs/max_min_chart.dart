import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class WeeklyBarChart extends StatelessWidget {
  final List<double> minValues;
  final List<double> maxValues;

  const WeeklyBarChart({
    super.key,
    required this.minValues,
    required this.maxValues,
  });

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        minY : 30,
        maxY: 200,
        
        barGroups: List.generate(7, (index) => _buildBarGroup(index)),
        // barGroupSpacing: 10,
        titlesData: FlTitlesData(
           rightTitles: AxisTitles(
              sideTitles:
                  SideTitles(showTitles: false)), // Hides right side titles
          topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false)), // Hides top titles
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                const days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
                return Text(days[value.toInt()]);
              },
            ),
          ),
        ),
      ),
    );
  }

  BarChartGroupData _buildBarGroup(int index) {
    return BarChartGroupData(
      x: index,
      barRods: [
        BarChartRodData(toY: minValues[index], color: Colors.blue, width: 8),
        BarChartRodData(toY: maxValues[index], color: Colors.red, width: 8),
      ],
    );
  }
}
