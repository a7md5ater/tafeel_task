import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:tafeel_task/core/utils/app_colors.dart';
import 'package:tafeel_task/core/utils/font_styles.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      primarySwatch: AppColors.generateMaterialColor(AppColors.primary),
      scaffoldBackgroundColor: AppColors.white,
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.primary,
        selectionColor: AppColors.primaryLight,
        selectionHandleColor: AppColors.primary,
      ),
      // color
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        elevation: 0,
        // shape: RoundedRectangleBorder(),
      ),
      iconTheme: const IconThemeData(color: AppColors.primaryText),

      // textTheme: TextTheme(
      //   displayLarge: AppTextStyle.bold(fontColor: AppColors.primary),
      //   displayMedium: AppTextStyle.semiBold(fontColor: AppColors.primaryText),
      //   bodyLarge: AppTextStyle.medium(fontColor: AppColors.text80),
      //   bodyMedium: AppTextStyle.regular(fontColor: AppColors.textBody),
      // ),
      appBarTheme: AppBarTheme(
        iconTheme: const IconThemeData(color: AppColors.primary),
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
          statusBarColor: AppColors.white,
        ),
        titleTextStyle: AppTextStyle.bold(
          fontSize: 18,
          fontColor: AppColors.primaryText,
        ),
        actionsIconTheme: const IconThemeData(color: Colors.white),
      ),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        backgroundColor: AppColors.white,
        elevation: 1,
        type: BottomNavigationBarType.shifting,
        selectedLabelStyle: AppTextStyle.regular(fontSize: 12),
        unselectedLabelStyle: AppTextStyle.regular(fontSize: 12),
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.lightGreyText,
      ),

      ///card
      cardTheme: CardThemeData(
        elevation: 0,
        color: Colors.transparent,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.sp),
        ),
      ),

      /// elevated button
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.sp),
          ),
          minimumSize: Size(double.infinity, 50.h),
        ),
      ),
      dialogTheme: const DialogThemeData(
        backgroundColor: AppColors.white,
        surfaceTintColor: Colors.transparent,
      ),

      /// text button
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: AppColors.primary),
      ),

      /// input decoration
      // inputDecorationTheme: InputDecorationTheme(
      //   hintStyle: AppTextStyle.regular(fontColor: AppColors.lightGreyText),
      //   fillColor: AppColors.white,
      //   filled: true,
      //   contentPadding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
      //   errorStyle: AppTextStyle.regular(
      //     fontColor: Colors.red,
      //     fontSize: 12.sp,
      //   ),
      // focusedErrorBorder: OutlineInputBorder(
      //   borderRadius: BorderRadius.circular(12.sp),
      //   borderSide: const BorderSide(color: AppColors.primary),
      // ),
      // errorBorder: OutlineInputBorder(
      //   borderRadius: BorderRadius.circular(12.sp),
      //   borderSide: const BorderSide(color: AppColors.primary),
      // ),
      // enabledBorder: OutlineInputBorder(
      //   borderRadius: BorderRadius.circular(12.sp),
      //   borderSide: const BorderSide(color: AppColors.primary),
      // ),
      // focusedBorder: OutlineInputBorder(
      //   borderRadius: BorderRadius.circular(12.sp),
      //   borderSide: const BorderSide(color: AppColors.primary),
      // ),
      // ),
    );
  }
}
