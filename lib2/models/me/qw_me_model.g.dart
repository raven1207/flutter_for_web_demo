// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qw_me_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QWMePageModel _$QWMePageModelFromJson(Map json) {
  return QWMePageModel(
    json['api'] as String,
    json['data'] == null
        ? null
        : QWMePageDataModel.fromJson((json['data'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    json['v'] as String,
    json['platform'] as String,
  );
}

Map<String, dynamic> _$QWMePageModelToJson(QWMePageModel instance) =>
    <String, dynamic>{
      'api': instance.api,
      'data': instance.data,
      'v': instance.v,
      'platform': instance.platform,
    };

QWMePageDataModel _$QWMePageDataModelFromJson(Map json) {
  return QWMePageDataModel(
    json['userInfoNode'] == null
        ? null
        : QWMePageUserInfoNode.fromJson((json['userInfoNode'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    json['userPlayHistoryFeedNode'] == null
        ? null
        : QWMePageUserPlayHistoryFeedNode.fromJson(
            (json['userPlayHistoryFeedNode'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    json['qqInfoNode'] == null
        ? null
        : QWMePageQQInfoNode.fromJson((json['qqInfoNode'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    json['placeholderNode'] == null
        ? null
        : QWMePagePlaceHolderNode.fromJson(
            (json['placeholderNode'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
  );
}

Map<String, dynamic> _$QWMePageDataModelToJson(QWMePageDataModel instance) =>
    <String, dynamic>{
      'userInfoNode': instance.userInfoNode,
      'userPlayHistoryFeedNode': instance.userPlayHistoryFeedNode,
      'qqInfoNode': instance.qqInfoNode,
      'placeholderNode': instance.placeholderNode,
    };

QWMePageUserInfoNode _$QWMePageUserInfoNodeFromJson(Map json) {
  return QWMePageUserInfoNode(
    json['type'] as String,
    json['typeName'] as String,
    json['data'] == null
        ? null
        : QWMePageUserInfoModel.fromJson((json['data'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
  );
}

Map<String, dynamic> _$QWMePageUserInfoNodeToJson(
        QWMePageUserInfoNode instance) =>
    <String, dynamic>{
      'type': instance.type,
      'typeName': instance.typeName,
      'data': instance.model,
    };

QWMePageUserInfoModel _$QWMePageUserInfoModelFromJson(Map json) {
  return QWMePageUserInfoModel(
    json['mixUserId'] as String,
    json['userNick'] as String,
    json['userAvatar'] as String ??
        'http://gw.alicdn.com/mt/TB1OZpT2xv1gK0jSZFFXXb0sXXa-180-180.png',
    QWMePageUserInfoModel._intFromString(
        json['userTotalLitePlayTimes'] as String),
    QWMePageUserInfoModel._intFromString(
        json['userConsumedLitePlayTimes'] as String),
    QWMePageUserInfoModel._intFromString(
        json['userRemainedLitePlayTimes'] as String),
    (json['userDecorations'] as List)
        ?.map((e) => e == null
            ? null
            : QWMePageUserDecorationsModel.fromJson((e as Map)?.map(
                (k, e) => MapEntry(k as String, e),
              )))
        ?.toList(),
  );
}

Map<String, dynamic> _$QWMePageUserInfoModelToJson(
        QWMePageUserInfoModel instance) =>
    <String, dynamic>{
      'mixUserId': instance.mixUserId,
      'userNick': instance.userNick,
      'userAvatar': instance.userAvatar,
      'userTotalLitePlayTimes': instance.userTotalLitePlayTimes,
      'userConsumedLitePlayTimes': instance.userConsumedLitePlayTimes,
      'userRemainedLitePlayTimes': instance.userRemainedLitePlayTimes,
      'userDecorations': instance.userDecorations,
    };

QWMePageUserPlayHistoryFeedNode _$QWMePageUserPlayHistoryFeedNodeFromJson(
    Map json) {
  return QWMePageUserPlayHistoryFeedNode(
    json['type'] as String,
    json['typeName'] as String,
    json['data'] == null
        ? null
        : QWMePageUserPlayHistoryFeedModel.fromJson((json['data'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
  );
}

Map<String, dynamic> _$QWMePageUserPlayHistoryFeedNodeToJson(
        QWMePageUserPlayHistoryFeedNode instance) =>
    <String, dynamic>{
      'type': instance.type,
      'typeName': instance.typeName,
      'data': instance.model,
    };

QWMePageUserPlayHistoryFeedModel _$QWMePageUserPlayHistoryFeedModelFromJson(
    Map json) {
  return QWMePageUserPlayHistoryFeedModel(
    json['userPlayHistoryTitle'] as String,
    json['hasMoreUserHistory'] as String,
    (json['litePlayUserPlayHistoryNodes'] as List)
        ?.map((e) => e == null
            ? null
            : QWMePageUserPlayHistoryData.fromJson((e as Map)?.map(
                (k, e) => MapEntry(k as String, e),
              )))
        ?.toList(),
  );
}

Map<String, dynamic> _$QWMePageUserPlayHistoryFeedModelToJson(
        QWMePageUserPlayHistoryFeedModel instance) =>
    <String, dynamic>{
      'userPlayHistoryTitle': instance.userPlayHistoryTitle,
      'hasMoreUserHistory': instance.hasMoreUserHistory,
      'litePlayUserPlayHistoryNodes': instance.userPlayHistoryFeedList,
    };

QWMePageUserPlayHistoryData _$QWMePageUserPlayHistoryDataFromJson(Map json) {
  return QWMePageUserPlayHistoryData(
    json['type'] as String,
    json['typeName'] as String,
    json['data'] == null
        ? null
        : QWMePageUserPlayHistoryModel.fromJson((json['data'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
  );
}

Map<String, dynamic> _$QWMePageUserPlayHistoryDataToJson(
        QWMePageUserPlayHistoryData instance) =>
    <String, dynamic>{
      'type': instance.type,
      'typeName': instance.typeName,
      'data': instance.model,
    };

QWMePageUserPlayHistoryModel _$QWMePageUserPlayHistoryModelFromJson(Map json) {
  return QWMePageUserPlayHistoryModel(
    json['coverTitle'] as String,
    json['coverPicture'] as String,
    json['coverTags'] as String,
    json['coverLinkUrl'] as String,
    json['gameId'] as String,
    json['liteLineId'] as String,
    json['litePlayId'] as String,
    json['liteVideoId'] as String,
  );
}

Map<String, dynamic> _$QWMePageUserPlayHistoryModelToJson(
        QWMePageUserPlayHistoryModel instance) =>
    <String, dynamic>{
      'coverTitle': instance.coverTitle,
      'coverPicture': instance.coverPicture,
      'coverTags': instance.coverTags,
      'coverLinkUrl': instance.coverLinkUrl,
      'gameId': instance.gameId,
      'liteLineId': instance.liteLineId,
      'litePlayId': instance.litePlayId,
      'liteVideoId': instance.liteVideoId,
    };

QWMePagePlaceHolderNode _$QWMePagePlaceHolderNodeFromJson(Map json) {
  return QWMePagePlaceHolderNode(
    json['type'] as String,
    json['typeName'] as String,
    json['data'] == null
        ? null
        : QWMePagePlaceHolderModel.fromJson((json['data'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
  );
}

Map<String, dynamic> _$QWMePagePlaceHolderNodeToJson(
        QWMePagePlaceHolderNode instance) =>
    <String, dynamic>{
      'type': instance.type,
      'typeName': instance.typeName,
      'data': instance.model,
    };

QWMePagePlaceHolderModel _$QWMePagePlaceHolderModelFromJson(Map json) {
  return QWMePagePlaceHolderModel(
    json['holderTitle'] as String,
    json['holderPicture'] as String,
  );
}

Map<String, dynamic> _$QWMePagePlaceHolderModelToJson(
        QWMePagePlaceHolderModel instance) =>
    <String, dynamic>{
      'holderTitle': instance.holderTitle,
      'holderPicture': instance.holderPicture,
    };

QWMePageQQInfoNode _$QWMePageQQInfoNodeFromJson(Map json) {
  return QWMePageQQInfoNode(
    json['type'] as String,
    json['typeName'] as String,
    json['data'] == null
        ? null
        : QWMePageQQInfoModel.fromJson((json['data'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
  );
}

Map<String, dynamic> _$QWMePageQQInfoNodeToJson(QWMePageQQInfoNode instance) =>
    <String, dynamic>{
      'type': instance.type,
      'typeName': instance.typeName,
      'data': instance.model,
    };

QWMePageQQInfoModel _$QWMePageQQInfoModelFromJson(Map json) {
  return QWMePageQQInfoModel(
    json['title'] as String,
    json['subTitle'] as String,
    json['joinButton'] == null
        ? null
        : QWMePageActionButtonModel.fromJson((json['joinButton'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
  );
}

Map<String, dynamic> _$QWMePageQQInfoModelToJson(
        QWMePageQQInfoModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subTitle': instance.subTitle,
      'joinButton': instance.joinButton,
    };

QWMePageActionButtonModel _$QWMePageActionButtonModelFromJson(Map json) {
  return QWMePageActionButtonModel(
    json['buttonTitle'] as String,
    json['buttonLink'] as String,
  );
}

Map<String, dynamic> _$QWMePageActionButtonModelToJson(
        QWMePageActionButtonModel instance) =>
    <String, dynamic>{
      'buttonTitle': instance.buttonTitle,
      'buttonLink': instance.buttonLink,
    };

QWMePageUserDecorationsModel _$QWMePageUserDecorationsModelFromJson(Map json) {
  return QWMePageUserDecorationsModel(
    json['decorationType'] as String,
    json['decorationPic'] as String,
  );
}

Map<String, dynamic> _$QWMePageUserDecorationsModelToJson(
        QWMePageUserDecorationsModel instance) =>
    <String, dynamic>{
      'decorationType': instance.decorationType,
      'decorationPic': instance.decorationPic,
    };
