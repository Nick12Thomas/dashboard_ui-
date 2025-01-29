import 'package:fitness_dashboard_ui/widgets/DashboardWidget.dart';
import 'package:fitness_dashboard_ui/widgets/SideMenu.dart';
import 'package:fitness_dashboard_ui/widgets/SideMenu2.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: SafeArea(
          child: Row(
        children: [
          Expanded(
            flex: 2,

            child: SizedBox(child: SideMenu(),)
          ),
          Expanded(
            flex: 7,
            child: SizedBox(child: DashboardWidget(),)
          ),
          Expanded(
            flex: 2,
            child:SizedBox(child: SideMenu2(),)
          ),
        ],
      )),
    );
  }
}
