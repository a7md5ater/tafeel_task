import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tafeel_task/core/shared_widgets/icon.dart';
import 'package:tafeel_task/core/utils/app_colors.dart';
import 'package:tafeel_task/core/utils/app_icons.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({super.key, required this.avatar});

  final String avatar;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 52.sp,
      height: 52.sp,
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.1),
        shape: BoxShape.circle,
        image: avatar.isNotEmpty
            ? DecorationImage(image: CachedNetworkImageProvider(avatar))
            : null,
      ),
      alignment: Alignment.center,
      child: avatar.isNotEmpty
          ? null
          : const CustomIcon(icon: AppIcons.user, color: AppColors.primary),
    );
  }
}
