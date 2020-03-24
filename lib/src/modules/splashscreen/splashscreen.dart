import 'dart:async';

import 'package:flutter/material.dart';
import 'package:invitationcard_maker/src/utils/navigator_helper/navigation_helper.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      NavigatorHelper.navigatetohomePage(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.withOpacity(0.5),
      body: Center(
        child: Text(
          'Splash Screen',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 35.8,
          ),
        ),
      ),
    );
  }
}
