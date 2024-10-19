import 'package:flutter/material.dart';

// ThemeData lightMode = ThemeData(
//   colorScheme: ColorScheme.light(
//     surface: Colors.grey.shade300,
//     primary: Colors.grey.shade500,
//     secondary: Colors.grey.shade100,
//     tertiary: Colors.white,
//     inversePrimary: Colors.grey.shade700,
//   ),
// );



ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    surface: Colors.grey.shade300,
    primary: Colors.grey.shade500, // AppBar background
    secondary: Colors.grey.shade100,
    tertiary: Colors.white,
    inversePrimary: Colors.grey.shade700, // AppBar text color
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey.shade500,
    titleTextStyle: const TextStyle(
      color: Colors.black, // Text color for AppBar
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),

  cardTheme: CardTheme(
    color: Colors.white, // Card background color
    shadowColor: Colors.grey.shade400, // Card shadow color
    elevation: 4, // Card elevation
    shape: RoundedRectangleBorder( // Card shape
      borderRadius: BorderRadius.circular(10),
    ),
  ),
);