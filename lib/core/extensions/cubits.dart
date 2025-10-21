import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tafeel_task/features/home/cubit/home_cubit.dart';
import 'package:tafeel_task/features/user_details/cubit/user_details_cubit.dart';

extension CubitExt on BuildContext {
  HomeCubit get homeCubit => read<HomeCubit>();
  UserDetailsCubit get userDetailsCubit => read<UserDetailsCubit>();
}
