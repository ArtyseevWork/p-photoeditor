
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pphotoeditor/app_settings.dart';
import 'package:pphotoeditor/screens/login/login_page.dart';
import 'package:pphotoeditor/values/colors.dart';

import '../home/home_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.initState();
    startTimer();
  }

  @override
  void dispose() {

    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: clrBlack,
      body: Center(
        child: Image.asset("assets/images/logo.png")
      ),
    );
  }

  void startTimer(){
    _timer = Timer(Delays.splash, () {
      Navigator.pushReplacement(
        context,
        //MaterialPageRoute(builder: (context) => HomePage()),
        MaterialPageRoute(builder: (context) => LoginPage()),

      );
    });
  }
}
