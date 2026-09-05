import 'package:flutter/material.dart';
import 'package:news_app/utils/AppColors.dart';
import 'package:news_app/utils/AppStyles.dart';

class AppTheme {
  static final ThemeData lightMode = ThemeData(
primaryColor: AppColors.white,
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: AppColors.black),
      centerTitle: true,
      titleTextStyle: AppStyles.medium24black,
      backgroundColor: AppColors.white,
    ),
    tabBarTheme: TabBarThemeData(indicatorColor: AppColors.black),
    indicatorColor: AppColors.black,
    textTheme: TextTheme(
      labelLarge: AppStyles.semibold24black,
      titleLarge: AppStyles.bold16black,
      titleMedium: AppStyles.medium24black,
      titleSmall: AppStyles.medium14black,
    ),
  );
  static final ThemeData darkMode = ThemeData(
    primaryColor: AppColors.white,
    scaffoldBackgroundColor: AppColors.black,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: Colors.white),
      centerTitle: true,
      titleTextStyle: AppStyles.medium24white,
      backgroundColor: AppColors.black,
    ),

    tabBarTheme: TabBarThemeData(indicatorColor: AppColors.white),
    indicatorColor: AppColors.white,
    textTheme: TextTheme(
      labelLarge: AppStyles.semibold24black,
      titleLarge: AppStyles.bold16white,
      titleMedium: AppStyles.medium24white,
      titleSmall: AppStyles.medium14white,
    ),
  );
}
