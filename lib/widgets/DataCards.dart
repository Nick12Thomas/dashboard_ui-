import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity, // Ensure full width
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Add margin for spacing
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // Rounded corners
        ),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: const LinearGradient(
              colors: [Colors.purple, Colors.pink], // Purple gradient colors
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
            children: [
              // Use Expanded to evenly distribute space
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Evenly distribute content
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text 1
                    const Text(
                      "Top Rated Project",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                    ),

                    // Text 2
                    const Text(
                      "Trending project and high rating Project created by team",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                    ),

                    // Button aligned to bottom left
                    ElevatedButton(
                      onPressed: () {
                        print("Learn More clicked");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, // Button color
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text("Learn More"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}