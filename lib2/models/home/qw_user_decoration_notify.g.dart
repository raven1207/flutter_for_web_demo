// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qw_user_decoration_notify.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QWUserDecorationNotifyPO _$QWUserDecorationNotifyPOFromJson(Map json) {
  return QWUserDecorationNotifyPO(
    decorationPic: json['decorationPic'] as String,
    decorationTitle: json['decorationTitle'] as String,
    actionToast: json['actionToast'] == null
        ? null
        : QWUserDecorationNotifyToast.fromJson(
            (json['actionToast'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
  );
}

Map<String, dynamic> _$QWUserDecorationNotifyPOToJson(
        QWUserDecorationNotifyPO instance) =>
    <String, dynamic>{
      'decorationPic': instance.decorationPic,
      'decorationTitle': instance.decorationTitle,
      'actionToast': instance.actionToast,
    };

QWUserDecorationNotifyToast _$QWUserDecorationNotifyToastFromJson(Map json) {
  return QWUserDecorationNotifyToast(
    title: json['title'] as String,
    subTitle: json['subTitle'] as String,
    bizCode: json['bizCode'] as String,
    buttons: (json['buttons'] as List)
        ?.map((e) => e == null
            ? null
            : QWUserDecorationNotifyButton.fromJson((e as Map)?.map(
                (k, e) => MapEntry(k as String, e),
              )))
        ?.toList(),
  );
}

Map<String, dynamic> _$QWUserDecorationNotifyToastToJson(
        QWUserDecorationNotifyToast instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subTitle': instance.subTitle,
      'bizCode': instance.bizCode,
      'buttons': instance.buttons,
    };

QWUserDecorationNotifyButton _$QWUserDecorationNotifyButtonFromJson(Map json) {
  return QWUserDecorationNotifyButton(
    title: json['title'] as String,
  );
}

Map<String, dynamic> _$QWUserDecorationNotifyButtonToJson(
        QWUserDecorationNotifyButton instance) =>
    <String, dynamic>{
      'title': instance.title,
    };
