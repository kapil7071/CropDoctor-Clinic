import 'dart:async';
import 'package:finalproject/phone.dart';
import 'package:flutter/material.dart';

import 'home.dart';
// import 'package:project3/home.dart';
// import 'package:project3/phone.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Phone()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Image.asset("assets/images/front.png"));
  }
}
