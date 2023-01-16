import 'package:coffe_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import '../extensions/color_extension.dart';

class AppTheme{
  static ThemeData get lightTheme => ThemeData(
    brightness: Brightness.light,
    primarySwatch: AppColors.brown_500.toMaterialColor(),
    backgroundColor: AppColors.brown_100,
    scaffoldBackgroundColor: AppColors.brown_100,
    splashColor: AppColors.brown_500.withOpacity(0.5),
    highlightColor: AppColors.brown_500.withOpacity(0.4),
    focusColor: AppColors.brown_500.withOpacity(0.4),
    hoverColor: AppColors.brown_500.withOpacity(0.4),
    fontFamily: 'Gabriela',
  );
}