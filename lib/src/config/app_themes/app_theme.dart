import 'package:flutter/material.dart';

import '../app_colors/app_colors.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: AppColors.appBarBackground,
      ),
      backgroundColor: AppColors.pageBackground,
      scaffoldBackgroundColor: AppColors.pageBackground,
    );
  }
}