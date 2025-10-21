part of 'home_cubit.dart';

class HomeState extends Equatable {
  final int page;
  final StateStatus<HomeEntity> getUsers;
  final StateStatus<HomeEntity> loadMoreUsers;

  const HomeState({
    this.page = 1,
    this.getUsers = const StateStatus.initial(),
    this.loadMoreUsers = const StateStatus.initial(),
  });

  HomeState copyWith({
    int? page,
    StateStatus<HomeEntity>? getUsers,
    StateStatus<HomeEntity>? loadMoreUsers,
  }) {
    return HomeState(
      page: page ?? this.page,
      getUsers: getUsers ?? this.getUsers,
      loadMoreUsers: loadMoreUsers ?? this.loadMoreUsers,
    );
  }

  @override
  List<Object> get props => [page, getUsers, loadMoreUsers];
}
