import 'package:flutter/material.dart';
import 'package:fitness_dashboard_ui/widgets/DashboardWidget.dart';
import 'package:fitness_dashboard_ui/widgets/SideMenu.dart';
import 'package:fitness_dashboard_ui/widgets/SideMenu2.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool showSideMenu1 = false;
  bool showSideMenu2 = false;

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 800;

    return Scaffold(
      appBar: isMobile
          ? AppBar(
        title: const Text("Dashboard"),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            setState(() {
              showSideMenu1 = !showSideMenu1;
              showSideMenu2 = false;
            });
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.widgets),
            onPressed: () {
              setState(() {
                showSideMenu2 = !showSideMenu2;
                showSideMenu1 = false;
              });
            },
          ),
        ],
      )
          : null,
      body: SafeArea(
        child: isMobile
            ? Stack(
          children: [
            const DashboardWidget(),
            if (showSideMenu1)
              Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                width: 250,
                child: Material(
                  elevation: 10,
                  child: Container(
                    color: Colors.white,
                    child: const SideMenu(),
                  ),
                ),
              ),
            if (showSideMenu2)
              Positioned(
                top: 0,
                bottom: 0,
                right: 0,
                width: 250,
                child: Material(
                  elevation: 10,
                  child: Container(
                    color: Colors.white,
                    child: const SideMenu2(),
                  ),
                ),
              ),
          ],
        )
            : const Row(
          children: [
            Expanded(flex: 2, child: SideMenu()),
            Expanded(flex: 7, child: DashboardWidget()),
            Expanded(flex: 2, child: SideMenu2()),
          ],
        ),
      ),
    );
  }
}