import 'package:flutter/material.dart';
import 'package:todo/pges/Hom_Page/home_page.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scal;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    _scal = Tween<double>(begin: 0.5, end: 1.0).animate(_controller);
    _controller.forward().whenComplete(() {
      Future.delayed(Duration(seconds: 1), () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomePage()));
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  // void navigateToHome() async {
  //   await Future.delayed(Duration(seconds: 3));
  //   Navigator.of(context)
  //       .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ScaleTransition(
        scale: _scal,
        child: Image.asset('assets/icon_todo.png'),
      )),
    );
  }
}
