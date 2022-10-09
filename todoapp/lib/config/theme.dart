import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todoapp/helpers/helpers.dart';

final kLightTheme = ThemeData(
  primarySwatch: generateMaterialColor(const Color(0xFFFF5959)),
  scaffoldBackgroundColor: const Color(0xFFF4F6FD),
  appBarTheme: const AppBarTheme().copyWith(
    elevation: 0,
  ),
  colorScheme: const ColorScheme.light().copyWith(
    primary: const Color(0xFFFF5959),
    secondary: Colors.amberAccent,
    onSecondary: Colors.white,
  ),
  fontFamily: 'Roboto',
);

final kDarkTheme = ThemeData(
  primarySwatch: generateMaterialColor(const Color(0xFFFF5959)),
  scaffoldBackgroundColor: const Color(0xff1C1D21),
  brightness: Brightness.dark,
  cardColor: const Color(0xff292B34),
  appBarTheme: const AppBarTheme().copyWith(
    backgroundColor: Colors.transparent,
    elevation: 0,
  ),
  colorScheme: const ColorScheme.dark().copyWith(
    primary: const Color(0xFFFF5959),
    secondary: Colors.amberAccent,
    onSecondary: Colors.white,
  ),
  // fontFamily: 'Roboto',
);

CalendarStyle kCalendarTheme(BuildContext context) {
  final theme = Theme.of(context);

  return CalendarStyle(
    isTodayHighlighted: false,
    todayTextStyle: TextStyle(color: theme.primaryColor),
    selectedDecoration: BoxDecoration(
      color: theme.primaryColor,
      shape: BoxShape.circle,
    ),
    selectedTextStyle: const TextStyle(color: Colors.white),
  );
}
