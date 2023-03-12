import 'package:flutter/material.dart';
import 'package:tawi/utils/themes/colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.lightGreen,
      scaffoldBackgroundColor: Colors.white,
      primaryColor: AppColors.GREEN_PRIMARY,
      cardColor: AppColors.GREEN_LIGHT,
      shadowColor: AppColors.GREEN_DARK,
      textTheme: TextTheme(
          displayLarge: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40,
              color: AppColors.GREEN_DARK),
          displayMedium: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: AppColors.GREEN_DARK),
          displaySmall: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: AppColors.GREEN_DARK),
          labelSmall: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 10,
              color: Colors.grey[400])));

  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.teal,
      scaffoldBackgroundColor: AppColors.GREEN_DARK,
      primaryColor: AppColors.GREEN_PRIMARY,
      cardColor: AppColors.GREEN_LIGHT,
      shadowColor: Colors.white,
      textTheme: TextTheme(
          displayLarge: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40,
              color: AppColors.GREEN_LIGHT),
          displayMedium: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: AppColors.GREEN_LIGHT),
          displaySmall: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: AppColors.GREEN_LIGHT),
          labelSmall: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 10,
              color: Colors.grey[200])));
}
