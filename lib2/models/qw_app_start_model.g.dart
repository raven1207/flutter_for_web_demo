// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qw_app_start_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QWAppStartModel _$QWAppStartModelFromJson(Map json) {
  return QWAppStartModel(
    api: json['api'] as String,
    data: json['data'] == null
        ? null
        : QWAppStartData.fromJson((json['data'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    ret: (json['ret'] as List)?.map((e) => e as String)?.toList(),
    v: json['v'] as String,
  );
}

Map<String, dynamic> _$QWAppStartModelToJson(QWAppStartModel instance) =>
    <String, dynamic>{
      'api': instance.api,
      'data': instance.data,
      'ret': instance.ret,
      'v': instance.v,
    };

QWAppStartData _$QWAppStartDataFromJson(Map json) {
  return QWAppStartData(
    reconnectGame: json['reconnectGame'] == null
        ? null
        : QWAppStartReconnectGame.fromJson((json['reconnectGame'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    survey: json['survey'] == null
        ? null
        : QWAppStartSurvey.fromJson((json['survey'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
  );
}

Map<String, dynamic> _$QWAppStartDataToJson(QWAppStartData instance) =>
    <String, dynamic>{
      'reconnectGame': instance.reconnectGame,
      'survey': instance.survey,
    };

QWAppStartReconnectGame _$QWAppStartReconnectGameFromJson(Map json) {
  return QWAppStartReconnectGame(
    gameSession: json['gameSession'] as String,
    litePlayId: json['litePlayId'] as String,
    gaming: json['gaming'] == null
        ? null
        : QWAppStartGaming.fromJson((json['gaming'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    lastGame: json['lastGame'] == null
        ? null
        : QWAppLastGame.fromJson((json['lastGame'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
  )..litePlayTitle = json['litePlayTitle'] as String;
}

Map<String, dynamic> _$QWAppStartReconnectGameToJson(
        QWAppStartReconnectGame instance) =>
    <String, dynamic>{
      'gameSession': instance.gameSession,
      'litePlayId': instance.litePlayId,
      'litePlayTitle': instance.litePlayTitle,
      'gaming': instance.gaming,
      'lastGame': instance.lastGame,
    };

QWAppStartGaming _$QWAppStartGamingFromJson(Map json) {
  return QWAppStartGaming(
    mixGameId: json['mixGameId'] as String,
    paasGameId: json['paasGameId'] as String,
    paasControllerId: json['paasControllerId'] as String,
    paasBizParam: json['paasBizParam'] as String,
    userLevel: json['userLevel'] as String,
  );
}

Map<String, dynamic> _$QWAppStartGamingToJson(QWAppStartGaming instance) =>
    <String, dynamic>{
      'mixGameId': instance.mixGameId,
      'paasGameId': instance.paasGameId,
      'paasControllerId': instance.paasControllerId,
      'paasBizParam': instance.paasBizParam,
      'userLevel': instance.userLevel,
    };

QWAppLastGame _$QWAppLastGameFromJson(Map json) {
  return QWAppLastGame(
    maxPlayTime: json['maxPlayTime'] as String,
    remainTime: json['remainTime'] as String,
    gameSession: json['gameSession'] as String,
    continueGame: json['continueGame'] as String,
  );
}

Map<String, dynamic> _$QWAppLastGameToJson(QWAppLastGame instance) =>
    <String, dynamic>{
      'maxPlayTime': instance.maxPlayTime,
      'remainTime': instance.remainTime,
      'gameSession': instance.gameSession,
      'continueGame': instance.continueGame,
    };

QWAppStartSurvey _$QWAppStartSurveyFromJson(Map json) {
  return QWAppStartSurvey(
    title: json['title'] as String,
    subTitle: json['subTitle'] as String,
    content: json['content'] as String,
    highlight: json['highlight'] as String,
    linkUrl: json['linkUrl'] as String,
  );
}

Map<String, dynamic> _$QWAppStartSurveyToJson(QWAppStartSurvey instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subTitle': instance.subTitle,
      'content': instance.content,
      'highlight': instance.highlight,
      'linkUrl': instance.linkUrl,
    };
