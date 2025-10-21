import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tafeel_task/core/extensions/cubits.dart';
import 'package:tafeel_task/core/shared_widgets/app_bar.dart';
import 'package:tafeel_task/core/shared_widgets/error_widget.dart';
import 'package:tafeel_task/features/home/cubit/home_cubit.dart';
import 'package:tafeel_task/features/home/presentation/widgets/home_loading_view.dart';
import 'package:tafeel_task/features/home/presentation/widgets/users_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Available Users', hasBackButton: false),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state.getUsers.isLoading) {
                return HomeLoadingView();
              } else if (state.getUsers.isFailure) {
                return CustomErrorWidget(
                  message: state.getUsers.error ?? 'Something went wrong',
                  onRetryPressed: () => context.homeCubit.getUsers(),
                );
              } else if (state.getUsers.data?.users.isEmpty ?? true) {
                return CustomErrorWidget(
                  message: 'There are no users available',
                );
              }
              final usersLen = state.getUsers.data!.users.length;
              final showFooterLoader = state.loadMoreUsers.isLoading;
              return UsersListView(
                showFooterLoader: showFooterLoader,
                usersLen: usersLen,
              );
            },
          ),
        ),
      ),
    );
  }
}
