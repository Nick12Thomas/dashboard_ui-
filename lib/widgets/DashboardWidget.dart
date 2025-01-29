import 'package:fitness_dashboard_ui/widgets/DataCards.dart';
import 'package:fitness_dashboard_ui/widgets/GraphWidget.dart';
import 'package:fitness_dashboard_ui/widgets/HeaderWidget.dart'; // Import the graph
import 'package:flutter/material.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({super.key});

  @override
  State<DashboardWidget> createState() => _MainScreenMenuState();
}

class _MainScreenMenuState extends State<DashboardWidget> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 20),
              HeaderWidget(),
              CustomCardWidget(),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(child: CustomCardWidget()),
                  SizedBox(width: 10),
                  Expanded(child: CustomCardWidget()),
                ],
              ),
              SizedBox(height: 10),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        "Performance Over Time",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      LineChartWidget(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
