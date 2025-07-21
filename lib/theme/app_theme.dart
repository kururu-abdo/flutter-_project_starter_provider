import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import 'colors.dart'; // Your defined colors

class AppTheme {
  static ThemeData lightTheme(BuildContext context) {
    if (Platform.isIOS) {
      return ThemeData(
        primaryColor: AppColors.primaryColor,
        // Define other iOS-specific theme properties
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontFamily: 'San Francisco'), // Example iOS font
        ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'San Francisco',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      );
    } else {
      return ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        useMaterial3: true,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontFamily: 'Roboto'), // Example Android font
        ),
        appBarTheme: AppBarTheme(
          titleTextStyle: const TextStyle(
            fontFamily: 'Roboto',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          backgroundColor: AppColors.primaryColor,
        ),
      );
    }
  }
}