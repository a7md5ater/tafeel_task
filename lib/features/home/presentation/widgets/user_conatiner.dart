import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tafeel_task/core/shared_widgets/horizontal_space.dart';
import 'package:tafeel_task/core/shared_widgets/icon.dart';
import 'package:tafeel_task/core/shared_widgets/vertical_space.dart';
import 'package:tafeel_task/core/utils/app_colors.dart';
import 'package:tafeel_task/core/utils/app_icons.dart';
import 'package:tafeel_task/core/utils/font_styles.dart';
import 'package:tafeel_task/features/home/presentation/widgets/user_avatar.dart';
import 'package:tafeel_task/features/user_details/domain/entities/user_entity.dart';

class UserContainer extends StatelessWidget {
  final UserEntity user;
  final bool isLoading;
  final bool showId;
  const UserContainer({
    super.key,
    required this.user,
    this.isLoading = false,
    this.showId = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: isLoading ? AppColors.lightGrey : AppColors.grey,
          width: 1.sp,
        ),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: isLoading
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isLoading)
              Icon(Icons.people, size: 24.h)
            else
              UserAvatar(avatar: user.avatar),
            HorizontalSpace(15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.fullName,
                    style: AppTextStyle.semiBold(fontSize: 16),
                  ),
                  if (showId) ...[
                    VerticalSpace(4),
                    Text(
                      "User ID: ${user.id}",
                      style: AppTextStyle.regular(fontSize: 16),
                    ),
                  ],
                  VerticalSpace(4),
                  Text(user.email, style: AppTextStyle.regular(fontSize: 16)),
                ],
              ),
            ),
            HorizontalSpace(8),
            if (isLoading)
              Icon(Icons.arrow_forward_ios, size: 24.h)
            else if (!showId)
              Align(
                alignment: Alignment.center,
                child: CustomIcon(icon: AppIcons.forwardIOS),
              ),
          ],
        ),
      ),
    );
  }
}
