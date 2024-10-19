import 'package:flutter/material.dart';

class TaskAddViewStyle {
  static double sideBorder = 20.0;
  static double spaceing = 15.0;

  static TextStyle textStyle(context) => TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
    color: Theme.of(context).colorScheme.inversePrimary);
}