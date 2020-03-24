import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invitationcard_maker/src/modules/category/birthday.dart';
import 'package:invitationcard_maker/src/modules/home/homescreen.dart';
import 'package:invitationcard_maker/src/modules/home/invitation.dart';
import 'package:invitationcard_maker/src/modules/splashscreen/splashscreen.dart';

class NavigatorHelper {
  static void navigatoclose(BuildContext context) {
    Navigator.pop(context);
  }

  static void navigatetosplashScreen(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SplashScreen()));
  }

  static void navigatetohomePage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  static void navigatetoinvitation(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
  }
  static void navigatetocategorypage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => BirthdayCategory()));
  }
}