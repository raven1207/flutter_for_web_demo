// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qw_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QWDetailModel _$QWDetailModelFromJson(Map json) {
  return QWDetailModel(
    json['api'] as String,
    json['data'] == null
        ? null
        : QWDetailDataModel.fromJson((json['data'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    json['v'] as String,
    json['platform'] as String,
  );
}

Map<String, dynamic> _$QWDetailModelToJson(QWDetailModel instance) =>
    <String, dynamic>{
      'api': instance.api,
      'data': instance.data,
      'v': instance.v,
      'platform': instance.platform,
    };

QWDetailDataModel _$QWDetailDataModelFromJson(Map json) {
  return QWDetailDataModel(
    (json['cardList'] as List)
        ?.map((e) => e == null
            ? null
            : QWDetailDataCardModel.fromJson((e as Map)?.map(
                (k, e) => MapEntry(k as String, e),
              )))
        ?.toList(),
    json['expectedDuration'] as String,
    json['liteLineCardNum'] as String,
    json['liteLineDescription'] as String,
    json['liteLineId'] as String,
    json['liteLineTitle'] as String,
    json['headerUrl'] as String,
    json['playedCountText'] as String,
    json['publishTimeText'] as String,
    json['createUser'] == null
        ? null
        : QWDetailCreatedModel.fromJson((json['createUser'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    json['commentCount'] as String,
  );
}

Map<String, dynamic> _$QWDetailDataModelToJson(QWDetailDataModel instance) =>
    <String, dynamic>{
      'cardList': instance.cardList,
      'createUser': instance.createUser,
      'expectedDuration': instance.expectedDuration,
      'liteLineCardNum': instance.liteLineCardNum,
      'liteLineDescription': instance.liteLineDescription,
      'liteLineId': instance.liteLineId,
      'liteLineTitle': instance.liteLineTitle,
      'headerUrl': instance.headerUrl,
      'playedCountText': instance.playedCountText,
      'publishTimeText': instance.publishTimeText,
      'commentCount': instance.commentCount,
    };

QWOperatingModel _$QWOperatingModelFromJson(Map json) {
  return QWOperatingModel()
    ..showCommentIcon = json['showCommentIcon'] as String
    ..playMinuteShowComment =
        QWOperatingModel._intFromString(json['playMinuteShowComment'] as String)
    ..commentTip = json['commentTip'] as String
    ..commentBtn = json['commentBtn'] as String;
}

Map<String, dynamic> _$QWOperatingModelToJson(QWOperatingModel instance) =>
    <String, dynamic>{
      'showCommentIcon': instance.showCommentIcon,
      'playMinuteShowComment': instance.playMinuteShowComment,
      'commentTip': instance.commentTip,
      'commentBtn': instance.commentBtn,
    };

QWDetailDataCardModel _$QWDetailDataCardModelFromJson(Map json) {
  return QWDetailDataCardModel(
    json['title'] as String,
    json['gaming'] == null
        ? null
        : QWDetailDataGamingModel.fromJson((json['gaming'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    json['description'] as String,
    json['cardType'] as String,
    json['playedCountText'] as String,
    json['hasPlayed'] as String,
    json['lastPlayed'] as String,
    json['isNew'] as String,
    json['video'] == null
        ? null
        : QWDetailDataCardVideoModel.fromJson((json['video'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    json['litePlayId'] as String,
    json['liteLineId'] as String,
    json['tag'] == null
        ? null
        : QWDetailDataCardTagModel.fromJson((json['tag'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    challenge: json['challenge'] == null
        ? null
        : QWDetailChallengeModel.fromJson((json['challenge'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    trackInfo: (json['trackInfo'] as Map)?.map(
      (k, e) => MapEntry(k as String, e),
    ),
  )
    ..waitTime = json['waitTime'] as String
    ..mixUserId = json['mixUserId'] as String
    ..gameSessionId = json['gameSessionId'] as String
    ..kPageAB = json['kPageAB'] as String
    ..kPageName = json['kPageName'] as String
    ..bottonImg = json['bottonImg'] as String
    ..titleImg = json['titleImg'] as String
    ..gamestatus = json['gamestatus'] as String
    ..gamepadkey = json['gamepadkey'] as String
    ..gametime = json['gametime'] as String
    ..isSecondOn =
        QWDetailDataCardModel._intFromString(json['isSecondOn'] as String)
    ..commentCount = json['commentCount'] as String
    ..operating = json['operating'] == null
        ? null
        : QWOperatingModel.fromJson(json['operating'] as Map);
}

Map<String, dynamic> _$QWDetailDataCardModelToJson(
        QWDetailDataCardModel instance) =>
    <String, dynamic>{
      'gaming': instance.gaming,
      'title': instance.title,
      'description': instance.description,
      'cardType': instance.cardType,
      'playedCountText': instance.playedCountText,
      'hasPlayed': instance.hasPlayed,
      'lastPlayed': instance.lastPlayed,
      'isNew': instance.isNew,
      'video': instance.video,
      'litePlayId': instance.litePlayId,
      'liteLineId': instance.liteLineId,
      'challenge': instance.challenge,
      'tag': instance.tag,
      'trackInfo': instance.trackInfo,
      'waitTime': instance.waitTime,
      'mixUserId': instance.mixUserId,
      'gameSessionId': instance.gameSessionId,
      'kPageAB': instance.kPageAB,
      'kPageName': instance.kPageName,
      'bottonImg': instance.bottonImg,
      'titleImg': instance.titleImg,
      'gamestatus': instance.gamestatus,
      'gamepadkey': instance.gamepadkey,
      'gametime': instance.gametime,
      'isSecondOn': instance.isSecondOn,
      'commentCount': instance.commentCount,
      'operating': instance.operating,
    };

QWDetailDataCardVideoModel _$QWDetailDataCardVideoModelFromJson(Map json) {
  return QWDetailDataCardVideoModel(
    (json['videoStreams'] as List)
        ?.map((e) => e == null
            ? null
            : QWDetailDataCardVideoStreamModel.fromJson((e as Map)?.map(
                (k, e) => MapEntry(k as String, e),
              )))
        ?.toList(),
    json['coverUrl'] as String,
    json['duration'] as String,
    json['durationText'] as String,
    json['liteVideoId'] as String,
    json['videoSourceId'] as String,
  )..test_expired = json['test_expired'] as bool;
}

Map<String, dynamic> _$QWDetailDataCardVideoModelToJson(
        QWDetailDataCardVideoModel instance) =>
    <String, dynamic>{
      'videoStreams': instance.videoStreams,
      'coverUrl': instance.coverUrl,
      'duration': instance.duration,
      'durationText': instance.durationText,
      'liteVideoId': instance.liteVideoId,
      'videoSourceId': instance.videoSourceId,
      'test_expired': instance.test_expired,
    };

QWDetailDataCardVideoStreamModel _$QWDetailDataCardVideoStreamModelFromJson(
    Map json) {
  return QWDetailDataCardVideoStreamModel(
    json['height'] as String,
    json['width'] as String,
    json['m3u8Url'] as String,
    json['milliseconds'] as String,
    json['streamType'] as String,
  );
}

Map<String, dynamic> _$QWDetailDataCardVideoStreamModelToJson(
        QWDetailDataCardVideoStreamModel instance) =>
    <String, dynamic>{
      'height': instance.height,
      'width': instance.width,
      'm3u8Url': instance.m3u8Url,
      'milliseconds': instance.milliseconds,
      'streamType': instance.streamType,
    };

QWDetailDataCardTagModel _$QWDetailDataCardTagModelFromJson(Map json) {
  return QWDetailDataCardTagModel(
    json['tagName'] as String,
    json['tagIcon'] as String,
    json['targetUrl'] as String,
  );
}

Map<String, dynamic> _$QWDetailDataCardTagModelToJson(
        QWDetailDataCardTagModel instance) =>
    <String, dynamic>{
      'tagName': instance.tagName,
      'tagIcon': instance.tagIcon,
      'targetUrl': instance.targetUrl,
    };

QWDetailCreatedModel _$QWDetailCreatedModelFromJson(Map json) {
  return QWDetailCreatedModel(
    json['avatar'] as String,
    json['mixUserId'] as String,
    json['nickName'] as String,
  );
}

Map<String, dynamic> _$QWDetailCreatedModelToJson(
        QWDetailCreatedModel instance) =>
    <String, dynamic>{
      'avatar': instance.avatar,
      'mixUserId': instance.mixUserId,
      'nickName': instance.nickName,
    };

QWDetailDataGamingModel _$QWDetailDataGamingModelFromJson(Map json) {
  return QWDetailDataGamingModel(
    paasGameId: json['paasGameId'] as String,
    userLevel:
        QWDetailDataGamingModel._intFromString(json['userLevel'] as String),
    mixGameId: json['mixGameId'] as String,
    paasBizParam: json['paasBizParam'] as String,
    paasControllerId: json['paasControllerId'] as String,
    playType: json['playType'] as String,
  );
}

Map<String, dynamic> _$QWDetailDataGamingModelToJson(
        QWDetailDataGamingModel instance) =>
    <String, dynamic>{
      'paasGameId': instance.paasGameId,
      'userLevel': instance.userLevel,
      'mixGameId': instance.mixGameId,
      'paasBizParam': instance.paasBizParam,
      'paasControllerId': instance.paasControllerId,
      'playType': instance.playType,
    };

QWDetailChallengeModel _$QWDetailChallengeModelFromJson(Map json) {
  return QWDetailChallengeModel(
    json['challengeId'] as String,
    json['challengeTip'] as String,
  );
}

Map<String, dynamic> _$QWDetailChallengeModelToJson(
        QWDetailChallengeModel instance) =>
    <String, dynamic>{
      'challengeId': instance.challengeId,
      'challengeTip': instance.challengeTip,
    };
