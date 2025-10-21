import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tafeel_task/features/home/data/models/get_users_response.dart';
import 'package:tafeel_task/features/user_details/data/models/user_data.dart';

part 'get_users_details_response.g.dart';

@JsonSerializable()
class GetUsersDetailsResponse extends Equatable {
  final UserData? data;
  final Support? support;
  @JsonKey(name: '_meta')
  final Meta? meta;

  const GetUsersDetailsResponse({this.data, this.support, this.meta});

  factory GetUsersDetailsResponse.fromJson(Map<String, dynamic> json) {
    return _$GetUsersDetailsResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetUsersDetailsResponseToJson(this);

  GetUsersDetailsResponse copyWith({
    UserData? data,
    Support? support,
    Meta? meta,
  }) {
    return GetUsersDetailsResponse(
      data: data ?? this.data,
      support: support ?? this.support,
      meta: meta ?? this.meta,
    );
  }

  @override
  List<Object?> get props {
    return [data, support, meta];
  }
}
