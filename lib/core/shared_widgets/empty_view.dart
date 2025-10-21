import 'package:flutter/material.dart';
import 'package:tafeel_task/core/shared_widgets/icon.dart';
import 'package:tafeel_task/core/shared_widgets/vertical_space.dart';
import 'package:tafeel_task/core/utils/app_colors.dart';
import 'package:tafeel_task/core/utils/app_icons.dart';
import 'package:tafeel_task/core/utils/font_styles.dart';

class CustomEmptyView extends StatelessWidget {
  final String text;

  const CustomEmptyView({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const CustomIcon(icon: AppIcons.box, size: 80),
            const VerticalSpace(24),
            Text(
              text,
              style: AppTextStyle.bold(
                fontColor: AppColors.greyText,
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
