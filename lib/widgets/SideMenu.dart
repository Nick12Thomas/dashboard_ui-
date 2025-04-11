import 'package:fitness_dashboard_ui/data/SideMenuData.dart';
import 'package:flutter/material.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

int selectedIndex = 0;

class _SideMenuState extends State<SideMenu> {
  final data = SideMenuData();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;

        return Container(
          width: isMobile ? 220 : 300,
          padding: const EdgeInsets.all(16.0),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 26),
              // App Logo
              Image.asset(
                'assets/images/avatar.png',
                height: 60,
              ),
              const SizedBox(height: 26),
              const Divider(color: Colors.grey),
              const SizedBox(height: 26),

              const CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/images/avatar.png'),
                backgroundColor: Colors.white,
              ),
              const SizedBox(height: 16),
              const Text(
                "Nikhil S Thomas",
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              const SizedBox(height: 26),
              const Divider(color: Colors.grey),
              const SizedBox(height: 16),

              // Menu Items
              Expanded(
                child: ListView.builder(
                  itemCount: data.menu.length,
                  itemBuilder: (context, index) => buildMenuEntry(index),
                ),
              ),

              const Divider(color: Colors.grey),
              const SizedBox(height: 8),

              buildSimpleTile(icon: Icons.settings, title: "Settings"),
              buildSimpleTile(icon: Icons.logout, title: "Logout"),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

  Widget buildMenuEntry(int index) {
    bool isSelected = selectedIndex == index;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
        leading: Icon(
          data.menu[index].icon,
          color: isSelected ? Colors.blue : Colors.grey,
        ),
        title: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
            color: isSelected ? Colors.blue.withOpacity(0.15) : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Flexible(
                child: Text(
                  data.menu[index].title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 16,
                    color: isSelected ? Colors.blue : Colors.black,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }

  Widget buildSimpleTile({required IconData icon, required String title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4),
      child: ListTile(
        leading: Icon(icon, color: Colors.black),
        title: Text(
          title,
          style: const TextStyle(fontSize: 16, color: Colors.black),
          overflow: TextOverflow.ellipsis,
        ),
        onTap: () {
          // Handle action
        },
      ),
    );
  }
}