import 'package:flutter/material.dart';
import 'package:mega_tune/shared/extensions.dart';

import 'app_colors.dart';

TextTheme dartTextTheme(BuildContext context) => TextTheme(
      displayLarge: TextStyle(
        fontFamily: 'Roboto',
        color: AppColors.white,
        fontSize: 48.0.sp(context),
      ),
      displayMedium: TextStyle(
        fontFamily: 'Roboto',
        color: AppColors.white,
        fontSize: 34.0.sp(context),
      ),
      displaySmall: TextStyle(
        fontFamily: 'Roboto',
        color: AppColors.white,
        fontSize: 24.0.sp(context),
        fontWeight: FontWeight.w600,
      ),
      titleLarge: TextStyle(
        fontFamily: 'Roboto',
        color: AppColors.white,
        fontSize: 30.0.sp(context),
        fontWeight: FontWeight.w600,
      ),
      titleMedium: TextStyle(
        fontFamily: 'Roboto',
        color: AppColors.white,
        fontSize: 20.0.sp(context),
        fontWeight: FontWeight.w600,
      ),
      titleSmall: TextStyle(
        fontFamily: 'Roboto',
        color: AppColors.white,
        fontSize: 18.0.sp(context),
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'Roboto',
        color: AppColors.white,
        fontSize: 16.0.sp(context),
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Roboto',
        color: AppColors.white,
        fontSize: 14.0.sp(context),
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Roboto',
        color: AppColors.white,
        fontSize: 12.0.sp(context),
        fontWeight: FontWeight.w400,
      ),
      labelSmall: TextStyle(
        fontFamily: 'Roboto',
        color: AppColors.white,
        fontSize: 10.0.sp(context),
        fontWeight: FontWeight.w400,
      ),
    );
