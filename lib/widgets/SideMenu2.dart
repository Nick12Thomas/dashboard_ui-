import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fitness_dashboard_ui/widgets/AniversaryCard.dart';
import 'package:fitness_dashboard_ui/widgets/BirthdayCard.dart';
import 'package:fitness_dashboard_ui/widgets/CalenderWidget.dart';

class SideMenu2 extends StatelessWidget {
  const SideMenu2({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;
        final isTablet = constraints.maxWidth >= 600 && constraints.maxWidth < 1024;
        final isDesktop = constraints.maxWidth >= 1024;

        return Container(
          color: const Color(0xFF301934),
          child: Column(
            children: [
              // 🟣 Top Bar
              Container(
                color: const Color(0xFFF5F5F5),
                padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 8 : 16, vertical: isMobile ? 6 : 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.newspaper),
                        SizedBox(width: 12),
                        Icon(Icons.notifications_active),
                        SizedBox(width: 12),
                        Icon(CupertinoIcons.power),
                      ],
                    ),
                    CircleAvatar(
                      radius: isMobile ? 16 : 22,
                      backgroundImage: const AssetImage('assets/images/avatar.png'),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // 🟣 Content Section
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 8 : 20,
                    vertical: isMobile ? 8 : 16,
                  ),
                  child: Column(
                    children: [
                      const CalendarCardWidget(),
                      const SizedBox(height: 20),
                      isMobile
                          ? const Column(
                        children: [
                          BirthdayCardWidget(),
                          SizedBox(height: 20),
                          AnniversaryCardWidget(),
                        ],
                      )
                          : const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: BirthdayCardWidget()),
                          SizedBox(width: 20),
                          Expanded(child: AnniversaryCardWidget()),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}