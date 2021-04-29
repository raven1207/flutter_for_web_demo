// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qw_feedback_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QWFeedbackModel _$QWFeedbackModelFromJson(Map json) {
  return QWFeedbackModel(
    api: json['api'] as String,
    data: json['data'] == null
        ? null
        : QWFeedbackData.fromJson((json['data'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    ret: (json['ret'] as List)?.map((e) => e as String)?.toList(),
    v: json['v'] as String,
  );
}

Map<String, dynamic> _$QWFeedbackModelToJson(QWFeedbackModel instance) =>
    <String, dynamic>{
      'api': instance.api,
      'data': instance.data,
      'ret': instance.ret,
      'v': instance.v,
    };

QWFeedbackData _$QWFeedbackDataFromJson(Map json) {
  return QWFeedbackData(
    data: json['data'] == null
        ? null
        : QWFeedbackTag.fromJson((json['data'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    type: json['type'] as String,
    typeName: json['typeName'] as String,
  );
}

Map<String, dynamic> _$QWFeedbackDataToJson(QWFeedbackData instance) =>
    <String, dynamic>{
      'data': instance.data,
      'type': instance.type,
      'typeName': instance.typeName,
    };

QWFeedbackTag _$QWFeedbackTagFromJson(Map json) {
  return QWFeedbackTag(
    items: (json['items'] as List)
        ?.map((e) => e == null
            ? null
            : QWFeedbackItem.fromJson((e as Map)?.map(
                (k, e) => MapEntry(k as String, e),
              )))
        ?.toList(),
    title: json['title'] as String,
    categoryLabel: json['categoryLabel'] as String,
    contentLabel: json['contentLabel'] as String,
    contentTip: json['contentTip'] as String,
    contactTip: json['contactTip'] as String,
    contactLabel: json['contactLabel'] as String,
  );
}

Map<String, dynamic> _$QWFeedbackTagToJson(QWFeedbackTag instance) =>
    <String, dynamic>{
      'items': instance.items,
      'title': instance.title,
      'categoryLabel': instance.categoryLabel,
      'contentLabel': instance.contentLabel,
      'contentTip': instance.contentTip,
      'contactLabel': instance.contactLabel,
      'contactTip': instance.contactTip,
    };

QWFeedbackItem _$QWFeedbackItemFromJson(Map json) {
  return QWFeedbackItem(
    emotion: json['emotion'] as String,
    text: json['text'] as String,
  );
}

Map<String, dynamic> _$QWFeedbackItemToJson(QWFeedbackItem instance) =>
    <String, dynamic>{
      'emotion': instance.emotion,
      'text': instance.text,
    };
