import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:tafeel_task/core/utils/app_colors.dart';
import 'package:tafeel_task/core/utils/app_fonts.dart';

class AppTextStyle {
  static TextStyle _getTextStyle({
    required FontWeight fontWeight,
    required Color fontColor,
    required double fontSize,
    double? letterSpacing,
    double? height,
    String? fontFamily,
  }) {
    return TextStyle(
      fontFamily: FontFamily.openSans,
      fontWeight: fontWeight,
      fontSize: fontSize.sp,
      color: fontColor,
      letterSpacing: letterSpacing,
      height: height,
    );
  }

  static TextStyle bold({
    Color? fontColor,
    double? fontSize,
    double? letterSpacing,
    double? height,
    String? fontFamily,
  }) {
    return _getTextStyle(
      fontWeight: FontWeightManager.bold,
      fontFamily: fontFamily,
      fontColor: fontColor ?? AppColors.primaryText,
      fontSize: fontSize ?? 14,
      letterSpacing: letterSpacing,
      height: height,
    );
  }

  static TextStyle semiBold({
    Color? fontColor,
    double? fontSize,
    double? letterSpacing,
    double? height,
    String? fontFamily,
  }) {
    return _getTextStyle(
      fontWeight: FontWeightManager.semiBold,
      fontFamily: fontFamily,
      fontColor: fontColor ?? AppColors.primaryText,
      fontSize: fontSize ?? 14,
      letterSpacing: letterSpacing,
      height: height,
    );
  }

  static TextStyle medium({
    Color? fontColor,
    double? fontSize,
    double? letterSpacing,
    double? height,
    String? fontFamily,
  }) {
    return _getTextStyle(
      fontWeight: FontWeightManager.medium,
      fontFamily: fontFamily,
      fontColor: fontColor ?? AppColors.primaryText,
      fontSize: fontSize ?? 14,
      letterSpacing: letterSpacing,
      height: height,
    );
  }

  static TextStyle regular({
    Color? fontColor,
    double? fontSize,
    double? letterSpacing,
    double? height,
    String? fontFamily,
  }) {
    return _getTextStyle(
      fontWeight: FontWeightManager.regular,
      fontFamily: fontFamily,
      fontColor: fontColor ?? AppColors.primaryText,
      fontSize: fontSize ?? 14,
      letterSpacing: letterSpacing,
      height: height,
    );
  }

  static TextStyle light({
    Color? fontColor,
    double? fontSize,
    double? letterSpacing,
    double? height,
    String? fontFamily,
  }) {
    return _getTextStyle(
      fontWeight: FontWeightManager.light,
      fontFamily: fontFamily,
      fontColor: fontColor ?? AppColors.primaryText,
      fontSize: fontSize ?? 14,
      letterSpacing: letterSpacing,
      height: height,
    );
  }
}
