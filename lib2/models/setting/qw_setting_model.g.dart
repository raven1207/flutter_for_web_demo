// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qw_setting_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QWSettingModel _$QWSettingModelFromJson(Map json) {
  return QWSettingModel(
    json['api'] as String,
    json['data'] == null
        ? null
        : QWSettingDataModel.fromJson((json['data'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    json['v'] as String,
    json['platform'] as String,
  );
}

Map<String, dynamic> _$QWSettingModelToJson(QWSettingModel instance) =>
    <String, dynamic>{
      'api': instance.api,
      'data': instance.data,
      'v': instance.v,
      'platform': instance.platform,
    };

QWSettingDataModel _$QWSettingDataModelFromJson(Map json) {
  return QWSettingDataModel(
    (json['settingNode'] as List)
        ?.map((e) => e == null
            ? null
            : QWSettingDataSettingNodeModel.fromJson((e as Map)?.map(
                (k, e) => MapEntry(k as String, e),
              )))
        ?.toList(),
    json['quitButton'] == null
        ? null
        : QWSettingQuitButtonModel.fromJson((json['quitButton'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
  );
}

Map<String, dynamic> _$QWSettingDataModelToJson(QWSettingDataModel instance) =>
    <String, dynamic>{
      'settingNode': instance.settingNode,
      'quitButton': instance.quitButton,
    };

QWSettingDataSettingNodeModel _$QWSettingDataSettingNodeModelFromJson(
    Map json) {
  return QWSettingDataSettingNodeModel(
    json['data'] == null
        ? null
        : QWSettingDataSettingNodeDataModel.fromJson((json['data'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    json['cardType'] as String,
    json['buttonTitle'] as String,
  );
}

Map<String, dynamic> _$QWSettingDataSettingNodeModelToJson(
        QWSettingDataSettingNodeModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'cardType': instance.cardType,
      'buttonTitle': instance.buttonTitle,
    };

QWSettingDataSettingNodeDataModel _$QWSettingDataSettingNodeDataModelFromJson(
    Map json) {
  return QWSettingDataSettingNodeDataModel(
    json['settingName'] as String,
    json['settingLinkUrl'] as String,
    json['settingType'] as String,
  );
}

Map<String, dynamic> _$QWSettingDataSettingNodeDataModelToJson(
        QWSettingDataSettingNodeDataModel instance) =>
    <String, dynamic>{
      'settingName': instance.settingName,
      'settingLinkUrl': instance.settingLinkUrl,
      'settingType': instance.settingType,
    };

QWSettingQuitButtonModel _$QWSettingQuitButtonModelFromJson(Map json) {
  return QWSettingQuitButtonModel(
    json['buttonTitle'] as String,
  );
}

Map<String, dynamic> _$QWSettingQuitButtonModelToJson(
        QWSettingQuitButtonModel instance) =>
    <String, dynamic>{
      'buttonTitle': instance.buttonTitle,
    };
