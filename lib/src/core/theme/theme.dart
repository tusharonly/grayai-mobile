import 'package:flutter/material.dart';

class AppTheme {
  static const dmSans = 'DMSans';
  static const dmMono = 'DMMono';

  static ThemeData get light => ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.background,
    brightness: Brightness.light,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: dmSans,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: AppColors.background,
      scrolledUnderElevation: 0,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      shape: RoundedSuperellipseBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(36)),
      ),
      backgroundColor: Colors.white,
    ),
  );
}

// D2D2D2 - Logo Color

class AppColors {
  static const Color background = Colors.white;
}
