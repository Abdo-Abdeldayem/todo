import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/pges/Hom_Page/home_page.dart';

void main() async {
  // init the hive
  await Hive.initFlutter();
  //open a box
  var box = await Hive.openBox('mybox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(
          primarySwatch: Colors.teal,
          colorScheme: ColorScheme(
              brightness: Brightness.light,
              primary: Colors.teal,
              onPrimary: Colors.white,
              secondary: Colors.teal[200]!,
              onSecondary: Colors.black,
              error: Colors.red,
              onError: Colors.green,
              surface: Colors.teal,
              onSurface: Colors.black),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.teal,
          )),
    );
  }
}
