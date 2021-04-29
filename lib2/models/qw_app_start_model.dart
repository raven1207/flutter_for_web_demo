import 'package:json_annotation/json_annotation.dart';

part 'qw_app_start_model.g.dart';

@JsonSerializable(anyMap: true)
class QWAppStartModel {
  String api;
  QWAppStartData data;
  List<String> ret;
  String v;

  QWAppStartModel({this.api, this.data, this.ret, this.v});

  factory QWAppStartModel.fromJson(Map<String, dynamic> json) => _$QWAppStartModelFromJson(json);

  Map toJson() => _$QWAppStartModelToJson(this);
}

@JsonSerializable(anyMap: true)
class QWAppStartData {
  QWAppStartReconnectGame reconnectGame;
  QWAppStartSurvey survey;

  QWAppStartData({this.reconnectGame, this.survey});

  factory QWAppStartData.fromJson(Map<String, dynamic> json) => _$QWAppStartDataFromJson(json);

  Map toJson() => _$QWAppStartDataToJson(this);
}

@JsonSerializable(anyMap: true)
class QWAppStartReconnectGame {
  String gameSession;
  String litePlayId;
  String litePlayTitle;
  QWAppStartGaming gaming;
  QWAppLastGame lastGame;

  QWAppStartReconnectGame({this.gameSession, this.litePlayId, this.gaming, this.lastGame});

  factory QWAppStartReconnectGame.fromJson(Map<String, dynamic> json) => _$QWAppStartReconnectGameFromJson(json);

  Map toJson() => _$QWAppStartReconnectGameToJson(this);
}

@JsonSerializable(anyMap: true)
class QWAppStartGaming {
  String mixGameId;
  String paasGameId;
  String paasControllerId;
  String paasBizParam;
  String userLevel;

  QWAppStartGaming({this.mixGameId, this.paasGameId, this.paasControllerId, this.paasBizParam, this.userLevel});

  factory QWAppStartGaming.fromJson(Map<String, dynamic> json) => _$QWAppStartGamingFromJson(json);

  Map toJson() => _$QWAppStartGamingToJson(this);
}

@JsonSerializable(anyMap: true)
class QWAppLastGame {
  String maxPlayTime;
  String remainTime;
  String gameSession;
  String continueGame;

  QWAppLastGame({this.maxPlayTime, this.remainTime, this.gameSession, this.continueGame});

  factory QWAppLastGame.fromJson(Map<String, dynamic> json) => _$QWAppLastGameFromJson(json);

  Map toJson() => _$QWAppLastGameToJson(this);
}

@JsonSerializable(anyMap: true)
class QWAppStartSurvey {
  String title;
  String subTitle;
  String content;
  String highlight;
  String linkUrl;

  QWAppStartSurvey({this.title, this.subTitle, this.content, this.highlight, this.linkUrl});

  factory QWAppStartSurvey.fromJson(Map<String, dynamic> json) => _$QWAppStartSurveyFromJson(json);

  Map toJson() => _$QWAppStartSurveyToJson(this);
}

