import 'package:tafeel_task/features/home/data/models/get_users_response.dart';
import 'package:tafeel_task/features/user_details/domain/entities/user_entity.dart';

class HomeEntity {
  final int pageNum;
  final int pageSize;
  final int total;
  final bool hasMorePages;
  final List<UserEntity> users;

  HomeEntity({
    required this.pageNum,
    required this.pageSize,
    required this.total,
    required this.hasMorePages,
    required this.users,
  });

  HomeEntity copyWith({
    int? pageNum,
    int? pageSize,
    int? total,
    bool? hasMorePages,
    List<UserEntity>? users,
  }) {
    return HomeEntity(
      pageNum: pageNum ?? this.pageNum,
      pageSize: pageSize ?? this.pageSize,
      total: total ?? this.total,
      hasMorePages: hasMorePages ?? this.hasMorePages,
      users: users ?? this.users,
    );
  }
}

extension GetUsersResponseMapper on GetUsersResponse {
  HomeEntity toEntity() {
    final currentPage = page ?? 1;
    final totalPagesCount = totalPages ?? 1;

    return HomeEntity(
      pageNum: currentPage,
      pageSize: perPage ?? 0,
      total: total ?? 0,
      hasMorePages: currentPage < totalPagesCount,
      users: data?.map((user) => user.toEntity()).toList() ?? [],
    );
  }
}
