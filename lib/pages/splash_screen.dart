import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();

    Timer(
      Duration(seconds: 4),
      () => Navigator.pushReplacementNamed(context, 'home')
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Bienvenido', style: TextStyle(fontSize: 30, color: Colors.green, fontWeight: FontWeight.bold),),
          SpinKitRipple(color: Colors.green,)
        ],
      ),
    );
  }
}