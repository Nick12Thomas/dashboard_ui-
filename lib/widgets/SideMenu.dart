import 'package:fitness_dashboard_ui/data/SideMenuData.dart';
import 'package:flutter/material.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}
int selectedIndex = 0;
class _SideMenuState extends State<SideMenu> {
  final data = SideMenuData(); // Class-level menu data

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.white, // Set background color to white
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 26),
          // App Logo
          Image.asset(
            'assets/images/avatar.png', // Ensure the logo is placed in assets/images/
            height: 60, // Adjust the size
          ),
          const SizedBox(height: 26),
          const Divider(color: Colors.grey),
          const SizedBox(height: 26), // Space between logo and profile picture

          // User Profile Picture
          const CircleAvatar(
            radius: 40, // Adjust size
            backgroundImage: AssetImage('assets/images/avatar.png'), // Local asset image
            backgroundColor: Colors.white, // Fallback background color
          ),
          const SizedBox(height: 26),
          const Text(
            "Nikhil S Thomas",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),

          const SizedBox(height: 26), // Space between profile picture and menu items
          const Divider(color: Colors.grey),
          const SizedBox(height: 26),
          // Side Menu Items
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: ListView.builder(
                itemCount: data.menu.length,
                itemBuilder: (context, index) => buildMenuEntry(index),
              ),
            ),
          ),

          const Divider(color: Colors.grey), // Separator before settings/logout

          // Settings Option
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 90),
            child: ListTile(
              leading: const Icon(Icons.settings, color: Colors.black),
              title: const Text("Settings", style: TextStyle(fontSize: 16, color: Colors.black)),
              onTap: () {
                // Handle settings tap
              },
            ),
          ),

          // Logout Option
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 90),
            child: ListTile(
              leading: const Icon(Icons.logout, color: Colors.black),
              title: const Text("Logout", style: TextStyle(fontSize: 16, color: Colors.black)),
              onTap: () {
                // Handle logout tap
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenuEntry(int index) {
    bool isSelected = selectedIndex == index; // Check if item is selected

    return ListTile(
      leading: Icon(
        data.menu[index].icon,
        color: isSelected ? Colors.blue : Colors.grey, // Highlight selected icon
      ),
      title: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15), // Padding for text
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.withOpacity(0.2) : Colors.transparent, // Highlight text background
          borderRadius: BorderRadius.circular(10), // Rounded corners for the background
        ),
        child: Text(
          data.menu[index].title,
          style: TextStyle(
            fontSize: 16,
            color: isSelected ? Colors.blue : Colors.black, // Highlight selected text
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal, // Bold text when selected
          ),
        ),
      ),
      onTap: () {
        setState(() {
          selectedIndex = index; // Update selected index
        });
      },
    );
  }
}