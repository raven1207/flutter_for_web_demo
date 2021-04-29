import 'package:json_annotation/json_annotation.dart';
import 'package:new_project/models/detail/qw_detail_model.dart';
// import 'package:qingwan_flutter_builder/models/detail/qw_detail_model.dart';

part 'qw_part_detail_model.g.dart';

@JsonSerializable(anyMap: true)
class QWPartDetailModel {
  final String api;
  final QWPartDetailDataModel data;
  final String v;
  final String platform;

  QWPartDetailModel(this.api, this.data, this.v, this.platform);

  factory QWPartDetailModel.fromJson(Map<String, dynamic> json) =>
      _$QWPartDetailModelFromJson(json);
  Map<String, dynamic> toJson() => _$QWPartDetailModelToJson(this);
}

// 详情页数据data
@JsonSerializable(anyMap: true)
class QWPartDetailDataModel {
  final QWDetailDataGamingModel gaming;
  final List<QWDetailDataLiteLineModel> liteLine;
  final List<QWDetailDataLiteLineModel> recommend;
  // final QWDetailLiteLineInfoModel liteLineInfo;
  final QWDetailDataCardVideoModel video;
  final QWDetailCreatedModel creater;
  final String publishTimeText;
  final String hasPlayed;
  final String lastPlayed;
  final String title;
  final String desc;
  final String playedCountText;
  final String liteLineTitle;
  final String recommendTitle;
  final String cardType;
  final String commentCount;
  final QWOperatingModel operating;
//   挑战赛
  final QWChallengeDetailModel challenge;

  QWPartDetailDataModel({
    this.gaming,
    this.liteLine,
    this.recommend,
    this.creater,
    this.operating,
    // this.liteLineInfo,
    this.publishTimeText,
    this.hasPlayed,
    this.lastPlayed,
    this.title,
    this.desc,
    this.playedCountText,
    this.video,
    this.liteLineTitle,
    this.recommendTitle,
    this.cardType,
    this.commentCount,
    this.challenge,
  });

  factory QWPartDetailDataModel.fromJson(Map<String, dynamic> json) =>
      _$QWPartDetailDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$QWPartDetailDataModelToJson(this);
}

// 详情页卡片数据data 合集模块、推荐模块
@JsonSerializable(anyMap: true)
class QWDetailDataLiteLineModel {
  final String type;
  final QWDetailDataLiteLineDataModel data;

  QWDetailDataLiteLineModel(
    this.type,
    this.data,
  );

  factory QWDetailDataLiteLineModel.fromJson(Map<String, dynamic> json) =>
      _$QWDetailDataLiteLineModelFromJson(json);
  Map<String, dynamic> toJson() => _$QWDetailDataLiteLineModelToJson(this);
}

// 片段段数据 合集模块、推荐模块
@JsonSerializable(anyMap: true)
class QWDetailDataLiteLineDataModel {
  final QWDetailDataGamingModel gaming;
  final String litePlayId;
  final String playedCountText;
  final String liteLineId;
  final QWDetailDataCardVideoModel video;
  final String title;
  final String activityUrl;

  QWDetailDataLiteLineDataModel(
      this.gaming,
      this.litePlayId,
      this.playedCountText,
      this.liteLineId,
      this.video,
      this.title,
      this.activityUrl);

  factory QWDetailDataLiteLineDataModel.fromJson(Map<String, dynamic> json) =>
      _$QWDetailDataLiteLineDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$QWDetailDataLiteLineDataModelToJson(this);
}

// 挑战赛数据列表查询
@JsonSerializable(anyMap: true)
class QWChallengeQueryModel {
  final String api;
  final QWChallengeDataModel data;
  final String v;
  final String platform;

  QWChallengeQueryModel(this.api, this.data, this.v, this.platform);

  factory QWChallengeQueryModel.fromJson(Map<String, dynamic> json) =>
      _$QWChallengeQueryModelFromJson(json);
  Map<String, dynamic> toJson() => _$QWChallengeQueryModelToJson(this);
}

// 挑战赛数据data
@JsonSerializable(anyMap: true)
class QWChallengeDataModel {
   QWChallengeDetailModel challenge;
   QWChallengeRankModel rank;

  QWChallengeDataModel({
    this.challenge,
    this.rank,
  });

  factory QWChallengeDataModel.fromJson(Map<String, dynamic> json) =>
      _$QWChallengeDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$QWChallengeDataModelToJson(this);
}

// 挑战赛数据map:challenge
@JsonSerializable(anyMap: true)
class QWChallengeDetailModel {
  final String challengeId;
  final String title;
  final String description;
  final String linkUrl;
  final String linkTitle;

  QWChallengeDetailModel(
      {this.challengeId,
      this.title,
      this.linkUrl,
      this.linkTitle,
      this.description});

  factory QWChallengeDetailModel.fromJson(Map<String, dynamic> json) =>
      _$QWChallengeDetailModelFromJson(json);
  Map<String, dynamic> toJson() => _$QWChallengeDetailModelToJson(this);
}

// 挑战赛数据map:rank
@JsonSerializable(anyMap: true)
class QWChallengeRankModel {
  final String rankId;
  final String backgroundUrl;
  final String rankLimit;
  final UserRankItemModel currentUserRankItem;
  final List<UserRankItemModel> rankItems;

  QWChallengeRankModel(
      {this.rankId,
      this.backgroundUrl,
      this.rankLimit,
      this.currentUserRankItem,
      this.rankItems});

  factory QWChallengeRankModel.fromJson(Map<String, dynamic> json) =>
      _$QWChallengeRankModelFromJson(json);
  Map<String, dynamic> toJson() => _$QWChallengeRankModelToJson(this);
}

@JsonSerializable(anyMap: true)
class QWDetailTabBarModel {
  final String title;
  final String type;

  QWDetailTabBarModel({this.title, this.type});

  factory QWDetailTabBarModel.fromJson(Map<String, dynamic> json) =>
      _$QWDetailTabBarModelFromJson(json);
  Map<String, dynamic> toJson() => _$QWDetailTabBarModelToJson(this);
}

// 挑战赛数据map:currentUserRankItem
@JsonSerializable(anyMap: true)
class UserRankItemModel {
  final String rankItemId;
  final String rankText;
  final String userRank;
  final UserModel user;
  final String rankTip;

  UserRankItemModel({this.rankItemId, this.rankText, this.userRank, this.user,this.rankTip});

  factory UserRankItemModel.fromJson(Map<String, dynamic> json) =>
      _$UserRankItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserRankItemModelToJson(this);
}

// 挑战赛数据user
@JsonSerializable(anyMap: true)
class UserModel {
  final String mixUserId;
  final String nickName;
  final String avatar;
  final List<UserDecorationsModel> userDecorations;

  UserModel(
    this.mixUserId,
    this.nickName,
    this.avatar,
    this.userDecorations,
  );

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

// 挑战赛数据UserDecorationsModel
@JsonSerializable(anyMap: true)
class UserDecorationsModel {
  final String decorationType;
  final String decorationPic;

  UserDecorationsModel(
    this.decorationType,
    this.decorationPic,
  );

  factory UserDecorationsModel.fromJson(Map<String, dynamic> json) =>
      _$UserDecorationsModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserDecorationsModelToJson(this);
}
