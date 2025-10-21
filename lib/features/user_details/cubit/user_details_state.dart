part of 'user_details_cubit.dart';

class UserDetailsState extends Equatable {
  final StateStatus<UserEntity> getUserDetails;

  const UserDetailsState({this.getUserDetails = const StateStatus.initial()});

  UserDetailsState copyWith({StateStatus<UserEntity>? getUserDetails}) {
    return UserDetailsState(
      getUserDetails: getUserDetails ?? this.getUserDetails,
    );
  }

  @override
  List<Object> get props => [getUserDetails];
}
