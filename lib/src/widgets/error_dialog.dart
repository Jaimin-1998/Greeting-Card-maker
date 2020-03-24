import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class ErrorDialog {
  static showErrorDialog( BuildContext context,String message,String title) {
    AwesomeDialog(
      dismissOnTouchOutside: false,
      context: context,
      animType: AnimType.TOPSLIDE,
      dialogType: DialogType.ERROR,
      tittle: "title",
      desc: message,
      btnOkIcon: Icons.check_circle,
      btnOkColor: Colors.red,
      btnOkText: "Okay",
      btnOkOnPress: () {},
    ).show();
  }
}
