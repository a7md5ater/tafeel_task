import 'package:tafeel_task/features/user_details/data/models/user_data.dart';

class UserEntity {
  final int id;
  final String email;
  final String fullName;
  final String avatar;

  UserEntity({
    required this.id,
    required this.email,
    required this.fullName,
    required this.avatar,
  });
}

extension UserDataMapper on UserData {
  UserEntity toEntity() {
    return UserEntity(
      id: id ?? 0,
      email: email ?? '',
      fullName: '${firstName ?? ''} ${lastName ?? ''}'.trim(),
      avatar: avatar ?? '',
    );
  }
}
