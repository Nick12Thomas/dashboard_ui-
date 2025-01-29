import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarCardWidget extends StatelessWidget {
  const CalendarCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Rounded corners
      ),
      margin: const EdgeInsets.all(26), // Margin around the card
      child: Padding(
        padding: const EdgeInsets.all(26.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            // TableCalendar widget
            TableCalendar(
              focusedDay: DateTime.now(),
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              calendarFormat: CalendarFormat.month,
              headerStyle: const HeaderStyle(
                formatButtonVisible: false, // Hide format button
                titleCentered: true, // Center the title
                leftChevronIcon: Icon(Icons.arrow_left, color: Colors.blue),
                rightChevronIcon: Icon(Icons.arrow_right, color: Colors.blue),
              ),
              calendarStyle: const CalendarStyle(
                selectedDecoration: BoxDecoration(
                  color: Colors.blue, // Selected day color
                  shape: BoxShape.circle,
                ),
                todayDecoration: BoxDecoration(
                  color: Colors.orange, // Today day color
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
