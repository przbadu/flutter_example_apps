import 'package:flutter/material.dart';
import 'package:unit_converter/dashboards/dashboards.dart';

final List<Unit> kUnits = [
  Unit(
    label: 'Length',
    color: Colors.indigo,
    icon: Icons.straighten,
    id: 1,
  ),
  Unit(
    label: 'Area',
    color: Colors.green,
    icon: Icons.aspect_ratio,
    id: 2,
  ),
  Unit(
    label: 'Mass',
    color: Colors.redAccent,
    icon: Icons.person,
    id: 3,
  ),
  Unit(
    label: 'Temperature',
    color: Colors.red,
    icon: Icons.thermostat,
    id: 4,
  ),
  Unit(
    label: 'Speed',
    color: Colors.purple,
    icon: Icons.speed,
    id: 5,
  ),
  Unit(
    label: 'Date',
    color: Colors.lightGreen,
    icon: Icons.calendar_month,
    id: 6,
  ),
  Unit(
    label: 'Currency',
    color: Colors.orange,
    icon: Icons.currency_exchange,
    id: 7,
  ),
];
