import 'package:flutter/material.dart';

ThemeData dark_Theme = ThemeData(
  primarySwatch: Colors.teal,
  colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: Colors.black,
      onPrimary: Colors.white,
      secondary: Colors.black45,
      onSecondary: Colors.white30,
      error: Colors.red,
      onError: Colors.green,
      surface: Colors.black87,
      onSurface: Colors.white),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.black,
  ),
);
