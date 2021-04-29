import 'package:json_annotation/json_annotation.dart'; 

part 'qw_home_tab_data.g.dart';

@JsonSerializable(anyMap: true)
class QWHomeTabData {
  List<QWHomeTabModel> tabs;

  QWHomeTabData({this.tabs});

  factory QWHomeTabData.fromJson(Map<String, dynamic> json) => _$QWHomeTabDataFromJson(json);

  Map<String, dynamic> toJson() => _$QWHomeTabDataToJson(this);
}

@JsonSerializable(anyMap: true)
class QWHomeTabModel {
  String activeIcon;
  String bizData;
  String icon;
  String name;
  String selected;
  String tabDataMode;
  QWHomeTabTrack track;

  QWHomeTabModel({this.activeIcon, this.bizData, this.icon, this.name, this.selected, this.tabDataMode, this.track});

  factory QWHomeTabModel.fromJson(Map<String, dynamic> json) => _$QWHomeTabModelFromJson(json);

  Map<String, dynamic> toJson() => _$QWHomeTabModelToJson(this);
}

@JsonSerializable(anyMap: true)
class QWHomeTabTrack {
  String spm;
  String eventName;
  String pageName;

  QWHomeTabTrack({this.spm, this.eventName, this.pageName});

  factory QWHomeTabTrack.fromJson(Map<String, dynamic> json) => _$QWHomeTabTrackFromJson(json);

  Map<String, dynamic> toJson() => _$QWHomeTabTrackToJson(this);
}

@JsonSerializable(anyMap: true)
class QWHomeBannerModel {
  String picUrl;
  String name;
  String link;
  String linkType;
  String id;

  QWHomeBannerModel({this.picUrl, this.name, this.link, this.linkType, this.id});

  factory QWHomeBannerModel.fromJson(Map<String, dynamic> json) => _$QWHomeBannerModelFromJson(json);

  Map<String, dynamic> toJson() => _$QWHomeBannerModelToJson(this);
}
