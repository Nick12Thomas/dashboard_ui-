import 'package:flutter/material.dart';

class AnniversaryCardWidget extends StatelessWidget {
  const AnniversaryCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Today's Anniversaries",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Today’s Anniversary:",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Mark & Lily, Tom & Emma",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 20),

                // Use Wrap instead of Row for avatars
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: const [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('assets/images/avatar.png'),
                    ),
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('assets/images/avatar.png'),
                    ),
                  ],
                ),

                const SizedBox(height: 20),
                const Text(
                  "Total Anniversaries:",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "2 couples today",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 20),

                // Button centered and fills smaller widths
                Center(
                  child: SizedBox(
                    width: constraints.maxWidth < 300
                        ? double.infinity
                        : null, // full width for narrow cards
                    child: ElevatedButton(
                      onPressed: () {
                        print("Send Wishes clicked");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text("Send Wishes"),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}