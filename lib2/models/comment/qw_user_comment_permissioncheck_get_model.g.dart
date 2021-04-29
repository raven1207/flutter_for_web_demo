// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qw_user_comment_permissioncheck_get_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QWUserCommentPermissionCheckModel _$QWUserCommentPermissionCheckModelFromJson(
    Map json) {
  return QWUserCommentPermissionCheckModel(
    api: json['api'] as String,
    data: json['data'] == null
        ? null
        : QWUserCommentPermissionCheckDataModel.fromJson(
            (json['data'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    ret: (json['ret'] as List)?.map((e) => e as String)?.toList(),
    v: json['v'] as String,
  );
}

Map<String, dynamic> _$QWUserCommentPermissionCheckModelToJson(
        QWUserCommentPermissionCheckModel instance) =>
    <String, dynamic>{
      'api': instance.api,
      'data': instance.data,
      'ret': instance.ret,
      'v': instance.v,
    };

QWUserCommentPermissionCheckDataModel
    _$QWUserCommentPermissionCheckDataModelFromJson(Map json) {
  return QWUserCommentPermissionCheckDataModel(
    json['canComment'] as String,
    json['actionToast'] == null
        ? null
        : QWUserCommentToastModel.fromJson((json['actionToast'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
  );
}

Map<String, dynamic> _$QWUserCommentPermissionCheckDataModelToJson(
        QWUserCommentPermissionCheckDataModel instance) =>
    <String, dynamic>{
      'canComment': instance.canComment,
      'actionToast': instance.actionToast,
    };

QWUserCommentToastModel _$QWUserCommentToastModelFromJson(Map json) {
  return QWUserCommentToastModel(
    json['title'] as String,
    json['bizCode'] as String,
  );
}

Map<String, dynamic> _$QWUserCommentToastModelToJson(
        QWUserCommentToastModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'bizCode': instance.bizCode,
    };
