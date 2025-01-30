import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
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
                gridData: const FlGridData(show: true),
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
                      reservedSize: 30,
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        final years = [2015, 2016, 2017, 2018, 2019, 2020];
                        if (value.toInt() >= 0 &&
                            value.toInt() < years.length) {
                          return Text(
                            years[value.toInt()].toString(),
                            style: const TextStyle(fontSize: 12),
                          );
                        }
                        return Container();
                      },
                      reservedSize: 30,
                    ),
                  ),
                  rightTitles: const AxisTitles(
                      sideTitles:
                          SideTitles(showTitles: false)), // Hide right labels
                  topTitles: const AxisTitles(
                      sideTitles:
                          SideTitles(showTitles: false)), // Hide top labels
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(color: Colors.black),
                ),
                lineBarsData: [
                  // Pending Line
                  LineChartBarData(
                    spots: [
                      const FlSpot(0, 15),
                      const FlSpot(1, 25),
                      const FlSpot(2, 35),
                      const FlSpot(3, 20),
                      const FlSpot(4, 30),
                      const FlSpot(5, 45),
                    ],
                    isCurved: true,
                    color: Colors.blue,
                    barWidth: 3,
                    belowBarData: BarAreaData(show: false),
                  ),
                  LineChartBarData(
                    spots: [
                      const FlSpot(0, 5),
                      const FlSpot(1, 10),
                      const FlSpot(2, 15),
                      const FlSpot(3, 30),
                      const FlSpot(4, 35),
                      const FlSpot(5, 50),
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
