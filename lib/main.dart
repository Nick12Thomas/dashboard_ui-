import 'package:flutter/material.dart';
import 'package:fitness_dashboard_ui/screens/MainScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white70,
        brightness: Brightness.light,
      ),
      home: const MainScreen(),
    );
  }
}