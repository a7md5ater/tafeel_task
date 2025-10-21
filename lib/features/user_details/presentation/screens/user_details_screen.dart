import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tafeel_task/core/extensions/cubits.dart';
import 'package:tafeel_task/core/shared_widgets/app_bar.dart';
import 'package:tafeel_task/core/shared_widgets/error_widget.dart';
import 'package:tafeel_task/features/home/presentation/widgets/user_conatiner.dart';
import 'package:tafeel_task/features/user_details/cubit/user_details_cubit.dart';
import 'package:tafeel_task/features/user_details/domain/entities/user_entity.dart';

class UserDetailsScreen extends StatefulWidget {
  final String id;
  const UserDetailsScreen({super.key, required this.id});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  @override
  void initState() {
    context.userDetailsCubit.getUserDetails(id: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'User Details'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: BlocBuilder<UserDetailsCubit, UserDetailsState>(
            builder: (context, state) {
              if (state.getUserDetails.isLoading) {
                return Padding(
                  padding: EdgeInsets.only(top: 16.h),
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
              } else if (state.getUserDetails.isFailure ||
                  state.getUserDetails.data == null) {
                return CustomErrorWidget(
                  message: state.getUserDetails.error ?? 'Something went wrong',
                  onRetryPressed: () =>
                      context.userDetailsCubit.getUserDetails(id: widget.id),
                );
              }
              return Center(
                child: UserContainer(
                  user: state.getUserDetails.data!,
                  showId: true,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
