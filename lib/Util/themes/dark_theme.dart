import 'package:flutter/material.dart';

ThemeData dark_Theme = ThemeData(
  primarySwatch: Colors.teal,
  colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: Colors.teal,
      onPrimary: Colors.white,
      secondary: Colors.teal[400]!,
      onSecondary: Colors.white30,
      error: Colors.red,
      onError: Colors.green,
      surface: Colors.black,
      onSurface: Colors.white),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.teal,
  ),
);
