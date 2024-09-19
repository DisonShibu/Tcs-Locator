import 'dart:async';

import 'package:app_template/src/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key key }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {

   Timer _timerControl;
  AnimationController animationController;
  Animation animIconHeight;
  Animation animIconWidth;
  Animation animIconColor;

  void startTimer() {
    _timerControl = Timer.periodic(const Duration(seconds: 3), (timer) {
      _timerControl.cancel();
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
          (route) => false);
    });
  }

  @override
  void didChangeDependencies() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animIconColor = ColorTween(
            begin: Colors.grey, end: Colors.grey)
        .animate(CurvedAnimation(
            parent: animationController, curve: Interval(0.5, 0.6)));
    animIconHeight = Tween<double>(
      end: 40.0,
      begin: 80.0,
    ).animate(CurvedAnimation(
        parent: animationController, curve: Interval(0.5, 0.6)));
    animIconWidth = Tween<double>(end: 40.0, begin: 100.0).animate(
        CurvedAnimation(
            parent: animationController, curve: Interval(0.5, 0.6)));
    animationController.addListener(() {
      setState(() {});
    });
    animationController.forward();
    startTimer();
    
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    animationController.dispose();
    _timerControl.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.dark,
    ));
    return Scaffold(
      backgroundColor: Colors.white,
      body:Center(
        
        
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 200),
          child: Image.asset("assets/images/splash_image.jfif",
          alignment: Alignment.center,
          ),
        ),
        ) ,
    );
  }
}