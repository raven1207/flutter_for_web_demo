// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qw_home_tab_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QWHomeTabData _$QWHomeTabDataFromJson(Map json) {
  return QWHomeTabData(
    tabs: (json['tabs'] as List)
        ?.map((e) => e == null
            ? null
            : QWHomeTabModel.fromJson((e as Map)?.map(
                (k, e) => MapEntry(k as String, e),
              )))
        ?.toList(),
  );
}

Map<String, dynamic> _$QWHomeTabDataToJson(QWHomeTabData instance) =>
    <String, dynamic>{
      'tabs': instance.tabs,
    };

QWHomeTabModel _$QWHomeTabModelFromJson(Map json) {
  return QWHomeTabModel(
    activeIcon: json['activeIcon'] as String,
    bizData: json['bizData'] as String,
    icon: json['icon'] as String,
    name: json['name'] as String,
    selected: json['selected'] as String,
    tabDataMode: json['tabDataMode'] as String,
    track: json['track'] == null
        ? null
        : QWHomeTabTrack.fromJson((json['track'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
  );
}

Map<String, dynamic> _$QWHomeTabModelToJson(QWHomeTabModel instance) =>
    <String, dynamic>{
      'activeIcon': instance.activeIcon,
      'bizData': instance.bizData,
      'icon': instance.icon,
      'name': instance.name,
      'selected': instance.selected,
      'tabDataMode': instance.tabDataMode,
      'track': instance.track,
    };

QWHomeTabTrack _$QWHomeTabTrackFromJson(Map json) {
  return QWHomeTabTrack(
    spm: json['spm'] as String,
    eventName: json['eventName'] as String,
    pageName: json['pageName'] as String,
  );
}

Map<String, dynamic> _$QWHomeTabTrackToJson(QWHomeTabTrack instance) =>
    <String, dynamic>{
      'spm': instance.spm,
      'eventName': instance.eventName,
      'pageName': instance.pageName,
    };

QWHomeBannerModel _$QWHomeBannerModelFromJson(Map json) {
  return QWHomeBannerModel(
    picUrl: json['picUrl'] as String,
    name: json['name'] as String,
    link: json['link'] as String,
    linkType: json['linkType'] as String,
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$QWHomeBannerModelToJson(QWHomeBannerModel instance) =>
    <String, dynamic>{
      'picUrl': instance.picUrl,
      'name': instance.name,
      'link': instance.link,
      'linkType': instance.linkType,
      'id': instance.id,
    };
