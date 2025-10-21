import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tafeel_task/features/user_details/data/models/user_data.dart';

part 'get_users_response.g.dart';

@JsonSerializable()
class GetUsersResponse extends Equatable {
  final int? page;
  @JsonKey(name: 'per_page')
  final int? perPage;
  final int? total;
  @JsonKey(name: 'total_pages')
  final int? totalPages;
  final List<UserData>? data;
  final Support? support;
  @JsonKey(name: '_meta')
  final Meta? meta;

  const GetUsersResponse({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
    this.support,
    this.meta,
  });

  factory GetUsersResponse.fromJson(Map<String, dynamic> json) {
    return _$GetUsersResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetUsersResponseToJson(this);

  GetUsersResponse copyWith({
    int? page,
    int? perPage,
    int? total,
    int? totalPages,
    List<UserData>? data,
    Support? support,
    Meta? meta,
  }) {
    return GetUsersResponse(
      page: page ?? this.page,
      perPage: perPage ?? this.perPage,
      total: total ?? this.total,
      totalPages: totalPages ?? this.totalPages,
      data: data ?? this.data,
      support: support ?? this.support,
      meta: meta ?? this.meta,
    );
  }

  @override
  List<Object?> get props {
    return [page, perPage, total, totalPages, data, support, meta];
  }
}

@JsonSerializable()
class Meta extends Equatable {
  @JsonKey(name: 'powered_by')
  final String? poweredBy;
  @JsonKey(name: 'upgrade_url')
  final String? upgradeUrl;
  @JsonKey(name: 'docs_url')
  final String? docsUrl;
  @JsonKey(name: 'template_gallery')
  final String? templateGallery;
  final String? message;
  final List<String>? features;
  @JsonKey(name: 'upgrade_cta')
  final String? upgradeCta;

  const Meta({
    this.poweredBy,
    this.upgradeUrl,
    this.docsUrl,
    this.templateGallery,
    this.message,
    this.features,
    this.upgradeCta,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);

  Meta copyWith({
    String? poweredBy,
    String? upgradeUrl,
    String? docsUrl,
    String? templateGallery,
    String? message,
    List<String>? features,
    String? upgradeCta,
  }) {
    return Meta(
      poweredBy: poweredBy ?? this.poweredBy,
      upgradeUrl: upgradeUrl ?? this.upgradeUrl,
      docsUrl: docsUrl ?? this.docsUrl,
      templateGallery: templateGallery ?? this.templateGallery,
      message: message ?? this.message,
      features: features ?? this.features,
      upgradeCta: upgradeCta ?? this.upgradeCta,
    );
  }

  @override
  List<Object?> get props {
    return [
      poweredBy,
      upgradeUrl,
      docsUrl,
      templateGallery,
      message,
      features,
      upgradeCta,
    ];
  }
}

@JsonSerializable()
class Support extends Equatable {
  final String? url;
  final String? text;

  const Support({this.url, this.text});

  factory Support.fromJson(Map<String, dynamic> json) {
    return _$SupportFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SupportToJson(this);

  Support copyWith({String? url, String? text}) {
    return Support(url: url ?? this.url, text: text ?? this.text);
  }

  @override
  List<Object?> get props => [url, text];
}
