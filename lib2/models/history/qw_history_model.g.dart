// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qw_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QWHistoryPageModel _$QWHistoryPageModelFromJson(Map json) {
  return QWHistoryPageModel(
    json['api'] as String,
    json['data'] == null
        ? null
        : QWHistoryPageDataModel.fromJson((json['data'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    json['v'] as String,
    json['platform'] as String,
  );
}

Map<String, dynamic> _$QWHistoryPageModelToJson(QWHistoryPageModel instance) =>
    <String, dynamic>{
      'api': instance.api,
      'data': instance.data,
      'v': instance.v,
      'platform': instance.platform,
    };

QWHistoryPageDataModel _$QWHistoryPageDataModelFromJson(Map json) {
  return QWHistoryPageDataModel(
    (json['litePlayUserPlayHistoryNodes'] as List)
        ?.map((e) => e == null
            ? null
            : QWHistoryDataListModel.fromJson((e as Map)?.map(
                (k, e) => MapEntry(k as String, e),
              )))
        ?.toList(),
    json['userHistoryCount'] as String,
    json['hasMoreUserHistory'] as String,
  );
}

Map<String, dynamic> _$QWHistoryPageDataModelToJson(
        QWHistoryPageDataModel instance) =>
    <String, dynamic>{
      'litePlayUserPlayHistoryNodes': instance.litePlayUserPlayHistoryNodes,
      'userHistoryCount': instance.userHistoryCount,
      'hasMoreUserHistory': instance.hasMoreUserHistory,
    };

QWHistoryDataListModel _$QWHistoryDataListModelFromJson(Map json) {
  return QWHistoryDataListModel(
    json['type'] as String,
    json['data'] == null
        ? null
        : QWHistoryDataListDataModel.fromJson((json['data'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
  );
}

Map<String, dynamic> _$QWHistoryDataListModelToJson(
        QWHistoryDataListModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'data': instance.data,
    };

QWHistoryDataListDataModel _$QWHistoryDataListDataModelFromJson(Map json) {
  return QWHistoryDataListDataModel(
    json['coverLinkUrl'] as String,
    json['coverTags'] as String,
    json['coverTitle'] as String,
    json['coverPicture'] as String,
    json['reportTime'] as String,
    json['gameId'] as String,
    json['liteLineId'] as String,
    json['litePlayId'] as String,
    json['liteVideoId'] as String,
  );
}

Map<String, dynamic> _$QWHistoryDataListDataModelToJson(
        QWHistoryDataListDataModel instance) =>
    <String, dynamic>{
      'coverLinkUrl': instance.coverLinkUrl,
      'coverTags': instance.coverTags,
      'coverTitle': instance.coverTitle,
      'coverPicture': instance.coverPicture,
      'reportTime': instance.reportTime,
      'gameId': instance.gameId,
      'liteLineId': instance.liteLineId,
      'litePlayId': instance.litePlayId,
      'liteVideoId': instance.liteVideoId,
    };
