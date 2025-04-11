import 'package:flutter/material.dart';

class ResponsiveLayout extends StatefulWidget {
  final Widget sideMenu1;
  final Widget sideMenu2;
  final Widget dashboard;

  const ResponsiveLayout({
    super.key,
    required this.sideMenu1,
    required this.sideMenu2,
    required this.dashboard,
  });

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 600;

  @override
  Widget build(BuildContext context) {
    final bool mobile = isMobile(context);

    return Scaffold(
      key: _scaffoldKey,
      appBar: mobile
          ? AppBar(
        title: const Text('Dashboard'),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
        ),
      )
          : null,
      drawer: mobile
          ? Drawer(
        child: ListView(
          children: [
            const DrawerHeader(child: Text('Menu')),
            widget.sideMenu1,
            const Divider(),
            widget.sideMenu2,
          ],
        ),
      )
          : null,
      body: mobile
          ? widget.dashboard
          : Row(
        children: [
          // Side Menus on larger screens
          Expanded(flex: 1, child: widget.sideMenu1),
          Expanded(flex: 1, child: widget.sideMenu2),
          Expanded(flex: 4, child: widget.dashboard),
        ],
      ),
    );
  }
}