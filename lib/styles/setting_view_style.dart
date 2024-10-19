import 'package:flutter/material.dart';

class SettingViewStyle {
  static double margin = 20.0;
  static double padding = 20.0;
  static double boxRadius = 10.0;

  static TextStyle textStyle(context) => TextStyle(
      fontWeight: FontWeight.bold,
      color: Theme.of(context).colorScheme.inversePrimary);
}
