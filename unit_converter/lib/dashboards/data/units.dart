import 'package:flutter/material.dart';
import 'package:unit_converter/dashboards/dashboards.dart';
import 'package:unit_converter/router/router.dart';

final List<Unit> kUnits = [
  Unit(
    label: 'Length',
    color: Colors.indigo,
    icon: Icons.straighten,
    routeName: AppRouteState.home,
  ),
  Unit(
    label: 'Area',
    color: Colors.green,
    icon: Icons.aspect_ratio,
    routeName: AppRouteState.home,
  ),
  Unit(
    label: 'Mass',
    color: Colors.redAccent,
    icon: Icons.person,
    routeName: AppRouteState.home,
  ),
  Unit(
    label: 'Temperature',
    color: Colors.red,
    icon: Icons.thermostat,
    routeName: AppRouteState.home,
  ),
  Unit(
    label: 'Speed',
    color: Colors.purple,
    icon: Icons.speed,
    routeName: AppRouteState.home,
  ),
  Unit(
    label: 'Date',
    color: Colors.lightGreen,
    icon: Icons.calendar_month,
    routeName: AppRouteState.dateConverter,
  ),
  Unit(
    label: 'Currency',
    color: Colors.orange,
    icon: Icons.currency_exchange,
    routeName: AppRouteState.currencyConverter,
  ),
];
