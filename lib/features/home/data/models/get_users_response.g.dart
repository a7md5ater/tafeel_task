// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_users_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUsersResponse _$GetUsersResponseFromJson(Map<String, dynamic> json) =>
    GetUsersResponse(
      page: (json['page'] as num?)?.toInt(),
      perPage: (json['per_page'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toInt(),
      totalPages: (json['total_pages'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => UserData.fromJson(e as Map<String, dynamic>))
          .toList(),
      support: json['support'] == null
          ? null
          : Support.fromJson(json['support'] as Map<String, dynamic>),
      meta: json['_meta'] == null
          ? null
          : Meta.fromJson(json['_meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetUsersResponseToJson(GetUsersResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'per_page': instance.perPage,
      'total': instance.total,
      'total_pages': instance.totalPages,
      'data': instance.data,
      'support': instance.support,
      '_meta': instance.meta,
    };

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
      poweredBy: json['powered_by'] as String?,
      upgradeUrl: json['upgrade_url'] as String?,
      docsUrl: json['docs_url'] as String?,
      templateGallery: json['template_gallery'] as String?,
      message: json['message'] as String?,
      features: (json['features'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      upgradeCta: json['upgrade_cta'] as String?,
    );

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'powered_by': instance.poweredBy,
      'upgrade_url': instance.upgradeUrl,
      'docs_url': instance.docsUrl,
      'template_gallery': instance.templateGallery,
      'message': instance.message,
      'features': instance.features,
      'upgrade_cta': instance.upgradeCta,
    };

Support _$SupportFromJson(Map<String, dynamic> json) => Support(
      url: json['url'] as String?,
      text: json['text'] as String?,
    );

Map<String, dynamic> _$SupportToJson(Support instance) => <String, dynamic>{
      'url': instance.url,
      'text': instance.text,
    };
