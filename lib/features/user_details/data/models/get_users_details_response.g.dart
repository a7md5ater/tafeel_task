// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_users_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUsersDetailsResponse _$GetUsersDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    GetUsersDetailsResponse(
      data: json['data'] == null
          ? null
          : UserData.fromJson(json['data'] as Map<String, dynamic>),
      support: json['support'] == null
          ? null
          : Support.fromJson(json['support'] as Map<String, dynamic>),
      meta: json['_meta'] == null
          ? null
          : Meta.fromJson(json['_meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetUsersDetailsResponseToJson(
        GetUsersDetailsResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'support': instance.support,
      '_meta': instance.meta,
    };
