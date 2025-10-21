import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tafeel_task/core/shared_widgets/icon.dart';
import 'package:tafeel_task/core/utils/app_icons.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool hasBackButton;
  const CustomAppBar({
    super.key,
    required this.title,
    this.hasBackButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        maxLines: 3,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(
          context,
        ).appBarTheme.titleTextStyle!.copyWith(fontSize: 18.sp),
      ),
      leadingWidth: hasBackButton ? 58.w : null,
      leading: hasBackButton
          ? Padding(
              padding: EdgeInsetsDirectional.only(start: 12.w),
              child: GestureDetector(
                onTap: () => context.pop(),
                child: Container(
                  width: 40.w,
                  height: 40.h,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Color(0xffF3F4F6),
                    shape: BoxShape.circle,
                  ),
                  child: const CustomIcon(icon: AppIcons.back, size: 18),
                ),
              ),
            )
          : null,
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70.h);
}
