import 'dart:async';
import 'package:UTS/login.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  startTime() async {
    var duration = new Duration(seconds: 3);
    return new Timer(duration, navPage);
  }

  void navPage(){
    Navigator.of(context).pushReplacementNamed(HalamanLogin.id);
  }

  void initState(){
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.amber,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/img/spoon.png',
              width: size.width/1.5,
            ),
          ),
        ],
      ),
    );
  }
}
