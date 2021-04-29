// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qw_detail_queue_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QWDetailQueueModel _$QWDetailQueueModelFromJson(Map json) {
  return QWDetailQueueModel(
    json['api'] as String,
    json['data'] == null
        ? null
        : QWDetailQueueDataModel.fromJson((json['data'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    json['v'] as String,
    json['platform'] as String,
  );
}

Map<String, dynamic> _$QWDetailQueueModelToJson(QWDetailQueueModel instance) =>
    <String, dynamic>{
      'api': instance.api,
      'data': instance.data,
      'v': instance.v,
      'platform': instance.platform,
    };

QWDetailQueueDataModel _$QWDetailQueueDataModelFromJson(Map json) {
  return QWDetailQueueDataModel(
    json['waitingBefore'] as String,
    json['waitingTime'] as String,
  );
}

Map<String, dynamic> _$QWDetailQueueDataModelToJson(
        QWDetailQueueDataModel instance) =>
    <String, dynamic>{
      'waitingBefore': instance.waitingBefore,
      'waitingTime': instance.waitingTime,
    };
