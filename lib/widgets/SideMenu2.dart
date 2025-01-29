import 'package:fitness_dashboard_ui/widgets/AniversaryCard.dart';
import 'package:fitness_dashboard_ui/widgets/BirthdayCard.dart';
import 'package:fitness_dashboard_ui/widgets/CalenderWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SideMenu2 extends StatelessWidget {
  const SideMenu2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF301934),
      child: Column(
        children: [
          Container(
            color: const Color(0xFFF5F5F5),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, // Distribute space evenly
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(Icons.newspaper),
                  const Icon(Icons.notifications_active),
                  const Icon(CupertinoIcons.power),
                  const SizedBox(width: 20),
                  Image.asset(
                    'assets/images/avatar.png',
                    height: 40,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const CalendarCardWidget(),
          const BirthdayCardWidget(),
          const AnniversaryCardWidget(),
        ],
      ),
    );
  }
}
