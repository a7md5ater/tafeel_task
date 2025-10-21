import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tafeel_task/config/router/routes.dart';
import 'package:tafeel_task/core/extensions/cubits.dart';
import 'package:tafeel_task/core/shared_widgets/vertical_space.dart';
import 'package:tafeel_task/features/home/presentation/widgets/user_conatiner.dart';
import 'package:tafeel_task/features/user_details/domain/entities/user_entity.dart';

class UsersListView extends StatelessWidget {
  const UsersListView({
    super.key,

    required this.showFooterLoader,
    required this.usersLen,
  });

  final bool showFooterLoader;
  final int usersLen;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: context.homeCubit.scrollController,
      itemBuilder: (context, index) {
        if (showFooterLoader && index == usersLen) {
          return Padding(
            padding: EdgeInsets.only(bottom: 16.h),
            child: Skeletonizer(
              enabled: true,
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
          );
        }
        final isFirst = index == 0;
        final isLastUser = index == usersLen - 1;
        return Padding(
          padding: EdgeInsets.only(
            top: isFirst ? 16.h : 0,
            bottom: isLastUser && !showFooterLoader ? 16.h : 0,
          ),
          child: GestureDetector(
            onTap: () {
              context.pushNamed(
                Routes.userDetails,
                extra:
                    context.homeCubit.state.getUsers.data?.users[index].id
                        .toString() ??
                    '',
              );
            },
            child: UserContainer(
              user: context.homeCubit.state.getUsers.data!.users[index],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => VerticalSpace(40),
      itemCount: usersLen + (showFooterLoader ? 1 : 0),
    );
  }
}
