// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qw_avatar_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QWAvatarModel _$QWAvatarModelFromJson(Map json) {
  return QWAvatarModel(
    json['api'] as String,
    json['data'] == null
        ? null
        : QWUserAvatarFrameListData.fromJson((json['data'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    json['v'] as String,
    json['platform'] as String,
  );
}

Map<String, dynamic> _$QWAvatarModelToJson(QWAvatarModel instance) =>
    <String, dynamic>{
      'api': instance.api,
      'data': instance.data,
      'v': instance.v,
      'platform': instance.platform,
    };

QWUserAvatarFrameListData _$QWUserAvatarFrameListDataFromJson(Map json) {
  return QWUserAvatarFrameListData(
    userAvatarFrameNodes: (json['userAvatarFrameNodes'] as List)
        ?.map((e) => e == null
            ? null
            : UserAvatarFrameNode.fromJson((e as Map)?.map(
                (k, e) => MapEntry(k as String, e),
              )))
        ?.toList(),
    userAvatarFrameCount: QWUserAvatarFrameListData._intFromString(
        json['userAvatarFrameCount'] as String),
    hasMoreAvatarFrame: QWUserAvatarFrameListData._boolFromString(
            json['hasMoreAvatarFrame'] as String) ??
        false,
  );
}

Map<String, dynamic> _$QWUserAvatarFrameListDataToJson(
        QWUserAvatarFrameListData instance) =>
    <String, dynamic>{
      'userAvatarFrameNodes': instance.userAvatarFrameNodes,
      'userAvatarFrameCount': instance.userAvatarFrameCount,
      'hasMoreAvatarFrame': instance.hasMoreAvatarFrame,
    };

UserAvatarFrameNode _$UserAvatarFrameNodeFromJson(Map json) {
  return UserAvatarFrameNode(
    decorationId:
        UserAvatarFrameNode._intFromString(json['decorationId'] as String),
    decorationPic: json['decorationPic'] as String,
    decorationTitle: json['decorationTitle'] as String,
    decorationSubTitle: json['decorationSubTitle'] as String,
    status: UserAvatarFrameNode._intFromString(json['status'] as String),
    used: UserAvatarFrameNode._boolFromString(json['used'] as String) ?? false,
  );
}

Map<String, dynamic> _$UserAvatarFrameNodeToJson(
        UserAvatarFrameNode instance) =>
    <String, dynamic>{
      'decorationId': instance.decorationId,
      'decorationPic': instance.decorationPic,
      'decorationTitle': instance.decorationTitle,
      'decorationSubTitle': instance.decorationSubTitle,
      'status': instance.status,
      'used': instance.used,
    };
