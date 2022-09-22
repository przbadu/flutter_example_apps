import 'package:flutter/cupertino.dart';
import 'package:unit_converter/router/router.dart';

class Unit {
  final String label;
  final IconData icon;
  final Color color;
  final AppRouteState routeName;

  Unit({
    required this.label,
    required this.icon,
    required this.color,
    required this.routeName,
  });
}
