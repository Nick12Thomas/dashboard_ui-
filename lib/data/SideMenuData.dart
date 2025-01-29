import 'package:fitness_dashboard_ui/model/MenuModel.dart';
import 'package:flutter/material.dart';

class SideMenuData {
  final menu =  const <menuModel>[
    menuModel(icon: Icons.home, title: 'Home'),
    menuModel(icon: Icons.person, title: 'Employees'),
    menuModel(icon: Icons.list, title: 'Attendance'),
    menuModel(icon: Icons.calendar_month, title: 'Summary'),
    menuModel(icon: Icons.info, title: 'Information'),
  ];
}