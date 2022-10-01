import 'package:flutter/material.dart';

/// Generate material color swatch for given [Color]
///
/// Expects [Color] argument and returns [MaterialColor]
///
/// **Example:**
///
/// ```dart
/// createMaterialColor(Color(0xFFFF5959))
/// ```
///
/// **Returns:**
///
/// ```dart
/// shade50:  Color (Color(0xffffa4a4))
/// shade100: Color (Color(0xffff9b9b))
/// shade200: Color (Color(0xffff8b8b))
/// shade300: Color (Color(0xffff7a7a))
/// shade400: Color (Color(0xffff6a6a))
/// shade500: Color (Color(0xffff5959))
/// shade600: Color (Color(0xffe55050))
/// shade700: Color (Color(0xffcc4747))
/// shade800: Color (Color(0xffb23e3e))
/// shade900: Color (Color(0xff993535))
/// ```
MaterialColor generateMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }

  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }

  return MaterialColor(color.value, swatch);
}
