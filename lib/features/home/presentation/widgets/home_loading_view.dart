import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tafeel_task/core/shared_widgets/vertical_space.dart';
import 'package:tafeel_task/features/home/presentation/widgets/user_conatiner.dart';
import 'package:tafeel_task/features/user_details/domain/entities/user_entity.dart';

class HomeLoadingView extends StatelessWidget {
  const HomeLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: ListView.separated(
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(
            top: index == 0 ? 16.h : 0,
            bottom: index == 2 ? 16.h : 0,
          ),
          child: UserContainer(
            user: UserEntity(
              id: 0,
              email: 'ahmed@gmail.com',
              fullName: 'Ahmed Khater',
              avatar: '',
            ),
            isLoading: true,
          ),
        ),
        separatorBuilder: (context, index) => VerticalSpace(24),
        itemCount: 3,
      ),
    );
  }
}
