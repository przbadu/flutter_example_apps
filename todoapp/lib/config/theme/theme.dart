import 'package:flutter/material.dart';
import 'package:todoapp/helpers/helpers.dart';

final kLightTheme = ThemeData(
  primarySwatch: generateMaterialColor(const Color(0xFFFF5959)),
  scaffoldBackgroundColor: const Color(0xFFF4F6FD),
  colorScheme: const ColorScheme.light().copyWith(
    primary: const Color(0xFFFF5959),
    secondary: const Color(0xFFFF5959),
    onSecondary: Colors.white,
  ),
  fontFamily: 'Roboto',
);

final kDarkTheme = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: const AppBarTheme().copyWith(
    backgroundColor: Colors.transparent,
    elevation: 0,
  ),
  colorScheme: const ColorScheme.dark().copyWith(
    secondary: const Color(0xFFFF5959),
    onSecondary: Colors.white,
  ),
  // fontFamily: 'Roboto',
);
