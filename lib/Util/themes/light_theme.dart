import 'package:flutter/material.dart';

ThemeData light_Theme = ThemeData(
  primarySwatch: Colors.teal,
  colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: Colors.teal,
      onPrimary: Colors.white,
      secondary: Colors.teal[200]!,
      onSecondary: Colors.black,
      error: Colors.red,
      onError: Colors.green,
      surface: Colors.teal[200]!,
      onSurface: Colors.black),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.teal,
  ),
);
