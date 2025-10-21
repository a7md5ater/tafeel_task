import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:tafeel_task/core/utils/app_colors.dart';
import 'package:tafeel_task/core/utils/font_styles.dart';
import 'package:tafeel_task/core/shared_widgets/circle_indicator.dart';
import 'package:tafeel_task/core/shared_widgets/icon.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final Color? fillColor;
  final Color? textColor;
  final double? textSize;
  final bool setShadow;
  final bool loadingCondition;
  final bool regularText;
  final String? icon;
  final double? iconSize;
  final double? iconPadding;
  final double? borderRadius;
  final Color? borderColor;
  final double? width;
  final double? height;
  final bool isDisabled;

  const CustomButton({
    super.key,
    required this.text,
    this.fillColor,
    this.textColor,
    this.textSize,
    this.setShadow = false,
    this.loadingCondition = false,
    this.regularText = false,
    this.icon,
    this.iconSize,
    this.iconPadding,
    this.borderRadius,
    this.borderColor,
    required this.onPressed,
    this.width,
    this.height,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: isDisabled
          ? null
          : loadingCondition
          ? () {}
          : onPressed,

      style: ElevatedButton.styleFrom(
        disabledBackgroundColor: AppColors.primaryLight,
        disabledForegroundColor: AppColors.disabledText,
        minimumSize: Size(width ?? double.infinity, height ?? 54.h),
        backgroundColor: fillColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
          side: borderColor != null
              ? BorderSide(color: borderColor!)
              : BorderSide.none,
        ),
      ),
      icon: icon != null && !loadingCondition
          ? Padding(
              padding: EdgeInsets.symmetric(horizontal: iconPadding ?? 4.w),
              child: CustomIcon(
                icon: icon!,
                color: textColor ?? AppColors.white,
                size: iconSize ?? 16,
              ),
            )
          : null,

      label: loadingCondition
          ? CustomCircleIndicator(
              color: textColor ?? AppColors.white,
              size: 20.sp,
            )
          : Text(
              text,
              style: AppTextStyle.semiBold(
                fontColor: textColor ?? AppColors.white,
                fontSize: textSize ?? 19,
              ),
              textAlign: TextAlign.center,
            ),
    );
  }
}
