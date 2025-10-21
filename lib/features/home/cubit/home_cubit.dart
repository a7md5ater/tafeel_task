import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tafeel_task/core/utils/state_status.dart';
import 'package:tafeel_task/features/home/domain/entities/home_entity.dart';
import 'package:tafeel_task/features/home/domain/usecases/get_users_usecase.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetUsersUsecase _getUsersUsecase;
  HomeCubit({required GetUsersUsecase getUsersUsecase})
    : _getUsersUsecase = getUsersUsecase,
      super(HomeState()) {
    getUsers();
    initScrollController();
  }

  void getUsers() async {
    emit(state.copyWith(getUsers: StateStatus.loading()));
    final response = await _getUsersUsecase.call(page: state.page.toString());
    response.fold(
      (failure) {
        emit(state.copyWith(getUsers: StateStatus.failure(failure.message)));
      },
      (entity) {
        emit(state.copyWith(getUsers: StateStatus.success(entity)));
      },
    );
  }

  final ScrollController scrollController = ScrollController();

  void initScrollController() {
    scrollController.addListener(loadMore);
  }

  void loadMore() async {
    final position = scrollController.position;
    final threshold = 100.h;
    if (position.extentAfter < threshold &&
        state.getUsers.data?.hasMorePages == true &&
        !state.loadMoreUsers.isLoading) {
      emit(state.copyWith(loadMoreUsers: StateStatus.loading()));
      // await Future.delayed(Duration(seconds: 4));
      final nexPage = state.page + 1;
      final response = await _getUsersUsecase.call(page: nexPage.toString());
      response.fold(
        (failure) {
          emit(
            state.copyWith(loadMoreUsers: StateStatus.failure(failure.message)),
          );
        },
        (entity) {
          final updatedEntity = entity.copyWith(
            pageNum: nexPage,
            users: [...state.getUsers.data?.users ?? [], ...entity.users],
          );
          emit(
            state.copyWith(
              page: nexPage,
              getUsers: StateStatus.success(updatedEntity),
              loadMoreUsers: StateStatus.success(updatedEntity),
            ),
          );
        },
      );
    }
  }

  @override
  Future<void> close() {
    scrollController.dispose();
    return super.close();
  }
}
