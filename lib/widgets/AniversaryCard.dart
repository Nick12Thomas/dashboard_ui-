import 'package:flutter/material.dart';

class AnniversaryCardWidget extends StatelessWidget {
  const AnniversaryCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Rounded corners
      ),
      margin: const EdgeInsets.all(16), // Margin around the card
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title for the Anniversary card
              const Text(
                "Today's Anniversaries",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              // Today's Anniversary
              const Text(
                "Today’s Anniversary:",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const Text(
                "Mark & Lily, Tom & Emma",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 20), // Space between sections

              // Avatars of the couples
              const Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/images/avatar.png'),
                  ),
                  SizedBox(width: 10),
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/images/avatar.png'),
                  ),
                ],
              ),
              const SizedBox(height: 20), // Space between sections

              // Total Anniversaries today
              const Text(
                "Total Anniversaries:",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const Text(
                "2 couples today",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 20), // Space between sections

              // Button to send anniversary wishes
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    print("Send Wishes clicked");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // Button color
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text("Send Wishes"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}