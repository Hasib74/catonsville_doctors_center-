import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_dimension.dart';

mixin AppThemeType {
  static String ROBOTO = "Roboto";
}

ThemeData appTheme() {
  return ThemeData(
      useMaterial3: false,
      appBarTheme: AppBarTheme(backgroundColor: AppColors.primaryColor),
      fontFamily: AppThemeType.ROBOTO,
      backgroundColor: AppColors.white,
      primaryColor: AppColors.primaryColor,
      secondaryHeaderColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.white,
      dividerColor: AppColors.borderColor,
      dividerTheme: DividerThemeData(color: AppColors.borderColor),

      textTheme: TextTheme(
          bodyText1: TextStyle(
              fontSize: AppDimension.b1,
              letterSpacing: AppDimension.latter_spacing,
              fontWeight: FontWeight.normal,
              color: AppColors.textColor1,
              wordSpacing: AppDimension.word_spacing),
          bodyText2: TextStyle(
              fontSize: AppDimension.b2,
              letterSpacing: AppDimension.latter_spacing,
              fontWeight: FontWeight.bold,
              color: AppColors.textColor2,
              wordSpacing: AppDimension.word_spacing),
          headline1: TextStyle(
              fontSize: AppDimension.h1,
              letterSpacing: AppDimension.latter_spacing,
              fontWeight: FontWeight.normal,
              color: AppColors.textColor1,
              wordSpacing: AppDimension.word_spacing),
          headline2: TextStyle(
              fontSize: AppDimension.h2,
              letterSpacing: AppDimension.latter_spacing,
              fontWeight: FontWeight.bold,
              color: AppColors.textColor1,
              wordSpacing: AppDimension.word_spacing),
          headline3: TextStyle(
              fontSize: AppDimension.h3,
              letterSpacing: AppDimension.latter_spacing,
              fontWeight: FontWeight.bold,
              color: AppColors.textColor1,
              wordSpacing: AppDimension.word_spacing)));
}
