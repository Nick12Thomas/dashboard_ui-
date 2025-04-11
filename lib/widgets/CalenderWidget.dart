import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarCardWidget extends StatelessWidget {
  const CalendarCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;

        final isSmallScreen = screenWidth < 400;
        final isTablet = screenWidth > 600;
        final rowHeight = isTablet ? 52.0 : (isSmallScreen ? 36.0 : 44.0);
        final fontSize = isTablet ? 14.0 : (isSmallScreen ? 11.0 : 12.0);

        return Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.all(16),
          child: Padding(
            padding: EdgeInsets.all(isSmallScreen ? 12.0 : 24.0),
            child: Column(
              children: [
                const SizedBox(height: 10),
                TableCalendar(
                  focusedDay: DateTime.now(),
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  calendarFormat: CalendarFormat.month,
                  availableGestures: AvailableGestures.horizontalSwipe,
                  daysOfWeekHeight: rowHeight * 0.6,
                  rowHeight: rowHeight,
                  headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                    leftChevronIcon: Icon(
                      Icons.arrow_left,
                      color: Colors.blue,
                      size: isSmallScreen ? 16 : 24,
                    ),
                    rightChevronIcon: Icon(
                      Icons.arrow_right,
                      color: Colors.blue,
                      size: isSmallScreen ? 16 : 24,
                    ),
                    titleTextStyle: TextStyle(
                      fontSize: isSmallScreen ? 14 : 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  calendarStyle: CalendarStyle(
                    defaultTextStyle: TextStyle(
                      fontSize: fontSize,
                    ),
                    weekendTextStyle: TextStyle(
                      fontSize: fontSize,
                      color: Colors.redAccent,
                    ),
                    selectedDecoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    todayDecoration: const BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                    ),
                    outsideDaysVisible: false,
                    cellMargin: EdgeInsets.zero,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}