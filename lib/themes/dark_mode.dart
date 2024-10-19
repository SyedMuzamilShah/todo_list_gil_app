import 'package:flutter/material.dart';

// ThemeData darkMode = ThemeData(
//   colorScheme: ColorScheme.dark(
//     surface: const Color.fromARGB(255, 20, 20, 20),
//     primary: const Color.fromARGB(255, 122, 122, 122),
//     secondary: const Color.fromARGB(255, 30, 30, 30),
//     tertiary: const Color.fromARGB(255, 47, 47, 47),
//     inversePrimary: Colors.grey.shade300,
//   ),
// );


ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.dark(
    surface: const Color.fromARGB(255, 20, 20, 20),
    primary: const Color.fromARGB(255, 122, 122, 122), // AppBar background
    secondary: const Color.fromARGB(255, 30, 30, 30),
    tertiary: const Color.fromARGB(255, 47, 47, 47),
    inversePrimary: Colors.grey.shade300, // AppBar text color
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: const Color.fromARGB(255, 122, 122, 122),
    titleTextStyle: TextStyle(
      color: Colors.grey.shade300, // Text color for AppBar
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),

  cardTheme: CardTheme(
    color: const Color.fromARGB(255, 30, 30, 30), // Card background color
    shadowColor: Colors.grey.shade800, // Card shadow color
    elevation: 4, // Card elevation
    shape: RoundedRectangleBorder( // Card shape
      borderRadius: BorderRadius.circular(10),
    ),
  ),
);