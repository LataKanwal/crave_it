import 'dart:async';
import 'package:crave_it/screens/location_access_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen ({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),() {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context)=> LocationAccessScreen(),
        ));
    }
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xFFF7FCFD),
      body: Center(
         child: Image.asset("assets/images/logo.png", scale: 3),
      ),
    );
  }
}
