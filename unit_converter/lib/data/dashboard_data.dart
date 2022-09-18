import 'package:flutter/material.dart';

class DashboardData {
  final String label;
  final IconData icon;
  final Color color;
  final int id;

  DashboardData({
    required this.label,
    required this.icon,
    required this.color,
    required this.id,
  });
}

final List<DashboardData> kDashboardData = [
  DashboardData(
    label: 'Length',
    color: Colors.indigo,
    icon: Icons.straighten,
    id: 1,
  ),
  DashboardData(
    label: 'Area',
    color: Colors.green,
    icon: Icons.aspect_ratio,
    id: 2,
  ),
  DashboardData(
    label: 'Mass',
    color: Colors.redAccent,
    icon: Icons.person,
    id: 3,
  ),
  DashboardData(
    label: 'Temperature',
    color: Colors.red,
    icon: Icons.thermostat,
    id: 4,
  ),
  DashboardData(
    label: 'Speed',
    color: Colors.purple,
    icon: Icons.speed,
    id: 5,
  ),
  DashboardData(
    label: 'Date',
    color: Colors.lightGreen,
    icon: Icons.calendar_month,
    id: 6,
  ),
  DashboardData(
    label: 'Currency',
    color: Colors.orange,
    icon: Icons.currency_exchange,
    id: 7,
  ),
];
