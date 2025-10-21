import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import 'package:tafeel_task/core/utils/app_colors.dart';
import 'package:tafeel_task/core/utils/font_styles.dart';
import 'package:tafeel_task/core/shared_widgets/circle_indicator.dart';

class CustomNetworkImage extends StatelessWidget {
  final String imageUrl;
  final BoxFit fit;
  final double? height;
  final double? width;
  final bool isSmall;
  const CustomNetworkImage({
    super.key,
    required this.imageUrl,
    required this.fit,
    this.height,
    this.width,
    this.isSmall = false,
  });

  Future<bool> checkInternet() async {
    bool? result;
    InternetConnection().hasInternetAccess.then((value) => result = value);
    return result!;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: fit,
        placeholder: (context, s) => Container(
          color: AppColors.primaryLight,
          child: Center(child: CustomCircleIndicator(size: 20.sp)),
        ),
        errorWidget: (BuildContext context, String url, dynamic error) {
          return Container(
            color: AppColors.primaryLight,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // CustomIcon(
                  //   icon: AppIcons.gallery,
                  //   size: isSmall ? 20.sp : 50.sp,
                  //   color: AppColors.primary,
                  // ),
                  if (!isSmall)
                    Text(
                      'connection error',
                      style: AppTextStyle.regular(
                        fontColor: AppColors.primaryText,
                        fontSize: 12.sp,
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
