import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tafeel_task/core/utils/state_status.dart';
import 'package:tafeel_task/features/user_details/domain/entities/user_entity.dart';
import 'package:tafeel_task/features/user_details/domain/usecases/get_user_details_usecase.dart';

part 'user_details_state.dart';

class UserDetailsCubit extends Cubit<UserDetailsState> {
  final GetUserDetailsUsecase _getUserDetailsUsecase;
  UserDetailsCubit({required GetUserDetailsUsecase getUserDetailsUsecase})
    : _getUserDetailsUsecase = getUserDetailsUsecase,
      super(UserDetailsState());

  void getUserDetails({required String id}) async {
    emit(state.copyWith(getUserDetails: StateStatus.loading()));
    final response = await _getUserDetailsUsecase.call(id: id);
    response.fold(
      (failure) => emit(
        state.copyWith(getUserDetails: StateStatus.failure(failure.message)),
      ),
      (entity) {
        print("===========>${entity.fullName}");
        emit(state.copyWith(getUserDetails: StateStatus.success(entity)));
      },
    );
  }
}
