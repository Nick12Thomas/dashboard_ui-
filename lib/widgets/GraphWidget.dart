import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300, // Adjust graph height
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Legend inside the graph
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLegend(Colors.blue, "Pending"),
              const SizedBox(width: 10),
              _buildLegend(Colors.green, "Done"),
              const SizedBox(width: 10),
              _buildLegend(Colors.red, "Project Completed"),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: true), // Show grid lines
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        if (value % 10 == 0 && value <= 50) {
                          return Text(
                            value.toInt().toString(),
                            style: const TextStyle(fontSize: 12),
                          );
                        }
                        return Container();
                      },
                      reservedSize: 30, // Space for Y-axis labels
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        final years = [2015, 2016, 2017, 2018, 2019, 2020];
                        if (value.toInt() >= 0 && value.toInt() < years.length) {
                          return Text(
                            years[value.toInt()].toString(),
                            style: const TextStyle(fontSize: 12),
                          );
                        }
                        return Container();
                      },
                      reservedSize: 30, // Space for X-axis labels
                    ),
                  ),
                  rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)), // Hide right labels
                  topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)), // Hide top labels
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(color: Colors.black),
                ),
                lineBarsData: [
                  // Pending Line
                  LineChartBarData(
                    spots: [
                      FlSpot(0, 15), // 2015 -> 15
                      FlSpot(1, 25), // 2016 -> 25
                      FlSpot(2, 35), // 2017 -> 35
                      FlSpot(3, 20), // 2018 -> 20
                      FlSpot(4, 30), // 2019 -> 30
                      FlSpot(5, 45), // 2020 -> 45
                    ],
                    isCurved: true,
                    color: Colors.blue,
                    barWidth: 3,
                    belowBarData: BarAreaData(show: false),
                  ),
                  // Done Line
                  LineChartBarData(
                    spots: [
                      FlSpot(0, 5), // 2015 -> 5
                      FlSpot(1, 10), // 2016 -> 10
                      FlSpot(2, 15), // 2017 -> 15
                      FlSpot(3, 30), // 2018 -> 30
                      FlSpot(4, 35), // 2019 -> 35
                      FlSpot(5, 50), // 2020 -> 50
                    ],
                    isCurved: true,
                    color: Colors.green,
                    barWidth: 3,
                    belowBarData: BarAreaData(show: false),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget for Legend (Inside the Graph)
  Widget _buildLegend(Color color, String text) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        const SizedBox(width: 5),
        Text(text, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}