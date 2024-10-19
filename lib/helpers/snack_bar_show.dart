import 'package:flutter/material.dart';

class Dialogs {
  static void showSnakBar(
      {required BuildContext context, required String message, Color? color}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Center(
          child: Text(
        message,
        style: const TextStyle(fontSize: 17),
      )),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 2),
      backgroundColor: color ?? Theme.of(context).bannerTheme.backgroundColor,
    ));
  }
}
