// theme/typography.dart
import 'package:flutter/material.dart';
import 'package:flutter_template_provider/theme/colors.dart';

class AppTypography {
  static const TextStyle headlineLarge = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  );
  static const TextStyle bodyMedium = TextStyle(
    fontSize: 16,
    color: AppColors.textColor,
  );
  // Define other text styles
  static TextTheme textTheme = const TextTheme(
    headlineLarge: headlineLarge,
    bodyMedium: bodyMedium,
    // Assign default styles to other text theme properties
  );
}