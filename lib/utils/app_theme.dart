import 'package:flutter/material.dart';
import 'app_colors.dart';


class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryLight,
    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.whiteColor,
      elevation: 0,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 0),
  );
}
