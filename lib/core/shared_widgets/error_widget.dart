import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:tafeel_task/core/utils/app_colors.dart';
import 'package:tafeel_task/core/utils/font_styles.dart';
import 'package:tafeel_task/core/shared_widgets/vertical_space.dart';

class CustomErrorWidget extends StatelessWidget {
  final String message;
  final VoidCallback? onRetryPressed;

  const CustomErrorWidget({
    super.key,
    required this.message,
    this.onRetryPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error, size: 120.sp, color: AppColors.primaryLight),
          const VerticalSpace(10),
          Text(
            message,
            style: AppTextStyle.regular(
              fontSize: 16,
              fontColor: AppColors.greyText,
            ),
            textAlign: TextAlign.center,
          ),
          if (onRetryPressed != null) ...[
            const VerticalSpace(10),
            IconButton(
              onPressed: onRetryPressed,
              icon: Icon(Icons.refresh, size: 24.sp, color: AppColors.primary),
            ),
          ],
        ],
      ),
    );
  }
}
