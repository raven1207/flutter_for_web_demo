// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qw_part_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QWPartDetailModel _$QWPartDetailModelFromJson(Map json) {
  return QWPartDetailModel(
    json['api'] as String,
    json['data'] == null
        ? null
        : QWPartDetailDataModel.fromJson((json['data'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    json['v'] as String,
    json['platform'] as String,
  );
}

Map<String, dynamic> _$QWPartDetailModelToJson(QWPartDetailModel instance) =>
    <String, dynamic>{
      'api': instance.api,
      'data': instance.data,
      'v': instance.v,
      'platform': instance.platform,
    };

QWPartDetailDataModel _$QWPartDetailDataModelFromJson(Map json) {
  return QWPartDetailDataModel(
    gaming: json['gaming'] == null
        ? null
        : QWDetailDataGamingModel.fromJson((json['gaming'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    liteLine: (json['liteLine'] as List)
        ?.map((e) => e == null
            ? null
            : QWDetailDataLiteLineModel.fromJson((e as Map)?.map(
                (k, e) => MapEntry(k as String, e),
              )))
        ?.toList(),
    recommend: (json['recommend'] as List)
        ?.map((e) => e == null
            ? null
            : QWDetailDataLiteLineModel.fromJson((e as Map)?.map(
                (k, e) => MapEntry(k as String, e),
              )))
        ?.toList(),
    creater: json['creater'] == null
        ? null
        : QWDetailCreatedModel.fromJson((json['creater'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    operating: json['operating'] == null
        ? null
        : QWOperatingModel.fromJson(json['operating'] as Map),
    publishTimeText: json['publishTimeText'] as String,
    hasPlayed: json['hasPlayed'] as String,
    lastPlayed: json['lastPlayed'] as String,
    title: json['title'] as String,
    desc: json['desc'] as String,
    playedCountText: json['playedCountText'] as String,
    video: json['video'] == null
        ? null
        : QWDetailDataCardVideoModel.fromJson((json['video'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    liteLineTitle: json['liteLineTitle'] as String,
    recommendTitle: json['recommendTitle'] as String,
    cardType: json['cardType'] as String,
    commentCount: json['commentCount'] as String,
    challenge: json['challenge'] == null
        ? null
        : QWChallengeDetailModel.fromJson((json['challenge'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
  );
}

Map<String, dynamic> _$QWPartDetailDataModelToJson(
        QWPartDetailDataModel instance) =>
    <String, dynamic>{
      'gaming': instance.gaming,
      'liteLine': instance.liteLine,
      'recommend': instance.recommend,
      'video': instance.video,
      'creater': instance.creater,
      'publishTimeText': instance.publishTimeText,
      'hasPlayed': instance.hasPlayed,
      'lastPlayed': instance.lastPlayed,
      'title': instance.title,
      'desc': instance.desc,
      'playedCountText': instance.playedCountText,
      'liteLineTitle': instance.liteLineTitle,
      'recommendTitle': instance.recommendTitle,
      'cardType': instance.cardType,
      'commentCount': instance.commentCount,
      'operating': instance.operating,
      'challenge': instance.challenge,
    };

QWDetailDataLiteLineModel _$QWDetailDataLiteLineModelFromJson(Map json) {
  return QWDetailDataLiteLineModel(
    json['type'] as String,
    json['data'] == null
        ? null
        : QWDetailDataLiteLineDataModel.fromJson((json['data'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
  );
}

Map<String, dynamic> _$QWDetailDataLiteLineModelToJson(
        QWDetailDataLiteLineModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'data': instance.data,
    };

QWDetailDataLiteLineDataModel _$QWDetailDataLiteLineDataModelFromJson(
    Map json) {
  return QWDetailDataLiteLineDataModel(
    json['gaming'] == null
        ? null
        : QWDetailDataGamingModel.fromJson((json['gaming'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    json['litePlayId'] as String,
    json['playedCountText'] as String,
    json['liteLineId'] as String,
    json['video'] == null
        ? null
        : QWDetailDataCardVideoModel.fromJson((json['video'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    json['title'] as String,
    json['activityUrl'] as String,
  );
}

Map<String, dynamic> _$QWDetailDataLiteLineDataModelToJson(
        QWDetailDataLiteLineDataModel instance) =>
    <String, dynamic>{
      'gaming': instance.gaming,
      'litePlayId': instance.litePlayId,
      'playedCountText': instance.playedCountText,
      'liteLineId': instance.liteLineId,
      'video': instance.video,
      'title': instance.title,
      'activityUrl': instance.activityUrl,
    };

QWChallengeQueryModel _$QWChallengeQueryModelFromJson(Map json) {
  return QWChallengeQueryModel(
    json['api'] as String,
    json['data'] == null
        ? null
        : QWChallengeDataModel.fromJson((json['data'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    json['v'] as String,
    json['platform'] as String,
  );
}

Map<String, dynamic> _$QWChallengeQueryModelToJson(
        QWChallengeQueryModel instance) =>
    <String, dynamic>{
      'api': instance.api,
      'data': instance.data,
      'v': instance.v,
      'platform': instance.platform,
    };

QWChallengeDataModel _$QWChallengeDataModelFromJson(Map json) {
  return QWChallengeDataModel(
    challenge: json['challenge'] == null
        ? null
        : QWChallengeDetailModel.fromJson((json['challenge'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    rank: json['rank'] == null
        ? null
        : QWChallengeRankModel.fromJson((json['rank'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
  );
}

Map<String, dynamic> _$QWChallengeDataModelToJson(
        QWChallengeDataModel instance) =>
    <String, dynamic>{
      'challenge': instance.challenge,
      'rank': instance.rank,
    };

QWChallengeDetailModel _$QWChallengeDetailModelFromJson(Map json) {
  return QWChallengeDetailModel(
    challengeId: json['challengeId'] as String,
    title: json['title'] as String,
    linkUrl: json['linkUrl'] as String,
    linkTitle: json['linkTitle'] as String,
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$QWChallengeDetailModelToJson(
        QWChallengeDetailModel instance) =>
    <String, dynamic>{
      'challengeId': instance.challengeId,
      'title': instance.title,
      'description': instance.description,
      'linkUrl': instance.linkUrl,
      'linkTitle': instance.linkTitle,
    };

QWChallengeRankModel _$QWChallengeRankModelFromJson(Map json) {
  return QWChallengeRankModel(
    rankId: json['rankId'] as String,
    backgroundUrl: json['backgroundUrl'] as String,
    rankLimit: json['rankLimit'] as String,
    currentUserRankItem: json['currentUserRankItem'] == null
        ? null
        : UserRankItemModel.fromJson((json['currentUserRankItem'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    rankItems: (json['rankItems'] as List)
        ?.map((e) => e == null
            ? null
            : UserRankItemModel.fromJson((e as Map)?.map(
                (k, e) => MapEntry(k as String, e),
              )))
        ?.toList(),
  );
}

Map<String, dynamic> _$QWChallengeRankModelToJson(
        QWChallengeRankModel instance) =>
    <String, dynamic>{
      'rankId': instance.rankId,
      'backgroundUrl': instance.backgroundUrl,
      'rankLimit': instance.rankLimit,
      'currentUserRankItem': instance.currentUserRankItem,
      'rankItems': instance.rankItems,
    };

QWDetailTabBarModel _$QWDetailTabBarModelFromJson(Map json) {
  return QWDetailTabBarModel(
    title: json['title'] as String,
    type: json['type'] as String,
  );
}

Map<String, dynamic> _$QWDetailTabBarModelToJson(
        QWDetailTabBarModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'type': instance.type,
    };

UserRankItemModel _$UserRankItemModelFromJson(Map json) {
  return UserRankItemModel(
    rankItemId: json['rankItemId'] as String,
    rankText: json['rankText'] as String,
    userRank: json['userRank'] as String,
    user: json['user'] == null
        ? null
        : UserModel.fromJson((json['user'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
	rankTip: json['rankTip'] as String,
  );
}

Map<String, dynamic> _$UserRankItemModelToJson(UserRankItemModel instance) =>
    <String, dynamic>{
      'rankItemId': instance.rankItemId,
      'rankText': instance.rankText,
      'userRank': instance.userRank,
      'user': instance.user,
	  'rankTip': instance.rankTip,
    };

UserModel _$UserModelFromJson(Map json) {
  return UserModel(
    json['mixUserId'] as String,
    json['nickName'] as String,
    json['avatar'] as String,
    (json['userDecorations'] as List)
        ?.map((e) => e == null
            ? null
            : UserDecorationsModel.fromJson((e as Map)?.map(
                (k, e) => MapEntry(k as String, e),
              )))
        ?.toList(),
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'mixUserId': instance.mixUserId,
      'nickName': instance.nickName,
      'avatar': instance.avatar,
      'userDecorations': instance.userDecorations,
    };

UserDecorationsModel _$UserDecorationsModelFromJson(Map json) {
  return UserDecorationsModel(
    json['decorationType'] as String,
    json['decorationPic'] as String,
  );
}

Map<String, dynamic> _$UserDecorationsModelToJson(
        UserDecorationsModel instance) =>
    <String, dynamic>{
      'decorationType': instance.decorationType,
      'decorationPic': instance.decorationPic,
    };
