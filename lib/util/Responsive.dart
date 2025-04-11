import 'package:flutter/material.dart';

class ResponsiveDashboardScreen extends StatefulWidget {
  const ResponsiveDashboardScreen({super.key});

  @override
  State<ResponsiveDashboardScreen> createState() => _ResponsiveDashboardScreenState();
}

class _ResponsiveDashboardScreenState extends State<ResponsiveDashboardScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _showSideMenu1 = true;

  void _toggleMenu() {
    setState(() {
      _showSideMenu1 = !_showSideMenu1;
    });
    _scaffoldKey.currentState?.openDrawer();
  }

  Widget get sideMenu1 => Drawer(
    child: ListView(
      children: const [
        DrawerHeader(child: Text('Side Menu 1')),
        ListTile(title: Text('Option 1')),
        ListTile(title: Text('Option 2')),
      ],
    ),
  );

  Widget get sideMenu2 => Drawer(
    child: ListView(
      children: const [
        DrawerHeader(child: Text('Side Menu 2')),
        ListTile(title: Text('Another 1')),
        ListTile(title: Text('Another 2')),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    if (isMobile) {
      // MOBILE LAYOUT
      return Scaffold(
        key: _scaffoldKey,
        drawer: _showSideMenu1 ? sideMenu1 : sideMenu2,
        appBar: AppBar(
          title: const Text("Dashboard"),
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: _toggleMenu,
          ),
        ),
        body: const Center(
          child: Text(
            "Main Data Screen",
            style: TextStyle(fontSize: 24),
          ),
        ),
      );
    } else {
      // TABLET & DESKTOP LAYOUT
      return Scaffold(
        appBar: AppBar(title: const Text("Dashboard")),
        body: Row(
          children: [
            // Static side menu on wide screen
            Container(
              width: 200,
              color: Colors.grey[200],
              child: _showSideMenu1 ? sideMenu1 : sideMenu2,
            ),
            const VerticalDivider(width: 1),
            // Main content
            const Expanded(
              child: Center(
                child: Text(
                  "Main Data Screen",
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}