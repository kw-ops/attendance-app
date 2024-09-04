//import 'package:attendance/const/colors.dart';
import 'dart:async';

import 'package:attendance/const/constants.dart';
import 'package:attendance/const/funcs.dart';
import 'package:attendance/views/startupscr/welcome.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    Timer(
        const Duration(milliseconds: 2500),
        (() => Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) {
                return WelcomeScreen();
              },
            ))));
  }

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: appColors.red,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              knust,
              height: Dimensions().pSH(160),
              width: Dimensions().pSW(110),
            ),
            createSpace(size, 20, 'vertical'),
            Image.asset(
              aim,
              height: Dimensions().pSH(140),
              width: Dimensions().pSW(280),
            )
          ],
        ),
      ),
    );
  }
}
