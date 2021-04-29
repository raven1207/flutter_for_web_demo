import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
part 'qw_me_model.g.dart';

const DEFAULT_AVATAR_URL =
    'http://gw.alicdn.com/mt/TB1OZpT2xv1gK0jSZFFXXb0sXXa-180-180.png';

@JsonSerializable(anyMap: true)
class QWMePageModel {
  final String api;
  final QWMePageDataModel data;
  final String v;
  final String platform;

  QWMePageModel(this.api, this.data, this.v, this.platform);

  factory QWMePageModel.fromJson(Map<String, dynamic> json) =>
      _$QWMePageModelFromJson(json);
  Map<String, dynamic> toJson() => _$QWMePageModelToJson(this);
}

@JsonSerializable(anyMap: true)
class QWMePageDataModel {
  final QWMePageUserInfoNode userInfoNode;
  final QWMePageUserPlayHistoryFeedNode userPlayHistoryFeedNode;
  final QWMePageQQInfoNode qqInfoNode;
  final QWMePagePlaceHolderNode placeholderNode;

  QWMePageDataModel(this.userInfoNode, this.userPlayHistoryFeedNode,
      this.qqInfoNode, this.placeholderNode);

  factory QWMePageDataModel.fromJson(Map<String, dynamic> json) =>
      _$QWMePageDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$QWMePageDataModelToJson(this);
}

@JsonSerializable(anyMap: true)
class QWMePageUserInfoNode {
  final String type;
  final String typeName;
  @JsonKey(name: 'data')
  QWMePageUserInfoModel model = QWMePageUserInfoModel.getDefaultModel();
  QWMePageUserInfoNode(this.type, this.typeName, this.model);

  factory QWMePageUserInfoNode.fromJson(Map<String, dynamic> json) =>
      _$QWMePageUserInfoNodeFromJson(json);
  Map<String, dynamic> toJson() => _$QWMePageUserInfoNodeToJson(this);

  factory QWMePageUserInfoNode.getDefaultNode() {
    return QWMePageUserInfoNode(
      "", // type
      "", // typeName
      QWMePageUserInfoModel.getDefaultModel(),
    );
  }
}

@JsonSerializable(anyMap: true)
class QWMePageUserInfoModel {
  final String mixUserId;
  String userNick;
  @JsonKey(defaultValue: DEFAULT_AVATAR_URL)
  String userAvatar;
  @JsonKey(fromJson: _intFromString)
  int userTotalLitePlayTimes;
  @JsonKey(fromJson: _intFromString)
  int userConsumedLitePlayTimes;
  @JsonKey(fromJson: _intFromString)
  int userRemainedLitePlayTimes;
  List<QWMePageUserDecorationsModel> userDecorations;

  QWMePageUserInfoModel(
      this.mixUserId,
      this.userNick,
      this.userAvatar,
      this.userTotalLitePlayTimes,
      this.userConsumedLitePlayTimes,
      this.userRemainedLitePlayTimes,
      this.userDecorations);

  factory QWMePageUserInfoModel.fromJson(Map<String, dynamic> json) =>
      _$QWMePageUserInfoModelFromJson(json);
  Map<String, dynamic> toJson() => _$QWMePageUserInfoModelToJson(this);

  static int _intFromString(String target) {
    return int.tryParse(target ?? '0') ?? 0;
  }

  factory QWMePageUserInfoModel.getDefaultModel() {
    return QWMePageUserInfoModel(
      "", // mixUserId
      "点击登录", // userNick
      DEFAULT_AVATAR_URL, // userAvatar
      0,
      0,
      0,
      []
    );
  }
}

@JsonSerializable(anyMap: true)
class QWMePageUserPlayHistoryFeedNode {
  final String type;
  final String typeName;
  @JsonKey(name: 'data')
  final QWMePageUserPlayHistoryFeedModel model;
  QWMePageUserPlayHistoryFeedNode(this.type, this.typeName, this.model);

  factory QWMePageUserPlayHistoryFeedNode.fromJson(Map<String, dynamic> json) =>
      _$QWMePageUserPlayHistoryFeedNodeFromJson(json);
  Map<String, dynamic> toJson() =>
      _$QWMePageUserPlayHistoryFeedNodeToJson(this);
}

@JsonSerializable(anyMap: true)
class QWMePageUserPlayHistoryFeedModel {
  final String userPlayHistoryTitle;
  final String hasMoreUserHistory;
  @JsonKey(name: 'litePlayUserPlayHistoryNodes')
  final List<QWMePageUserPlayHistoryData> userPlayHistoryFeedList;
  QWMePageUserPlayHistoryFeedModel(this.userPlayHistoryTitle,
      this.hasMoreUserHistory, this.userPlayHistoryFeedList);

  factory QWMePageUserPlayHistoryFeedModel.fromJson(
          Map<String, dynamic> json) =>
      _$QWMePageUserPlayHistoryFeedModelFromJson(json);
  Map<String, dynamic> toJson() =>
      _$QWMePageUserPlayHistoryFeedModelToJson(this);
}

@JsonSerializable(anyMap: true)
class QWMePageUserPlayHistoryData {
  final String type;
  final String typeName;
  @JsonKey(name: 'data')
  final QWMePageUserPlayHistoryModel model;
  QWMePageUserPlayHistoryData(this.type, this.typeName, this.model);

  factory QWMePageUserPlayHistoryData.fromJson(Map<String, dynamic> json) =>
      _$QWMePageUserPlayHistoryDataFromJson(json);
  Map<String, dynamic> toJson() => _$QWMePageUserPlayHistoryDataToJson(this);
}

@JsonSerializable(anyMap: true)
class QWMePageUserPlayHistoryModel {
  final String coverTitle;
  final String coverPicture;
  final String coverTags;
  final String coverLinkUrl;
  final String gameId;
  final String liteLineId;
  final String litePlayId;
  final String liteVideoId;
  QWMePageUserPlayHistoryModel(
      this.coverTitle,
      this.coverPicture,
      this.coverTags,
      this.coverLinkUrl,
      this.gameId,
      this.liteLineId,
      this.litePlayId,
      this.liteVideoId);

  factory QWMePageUserPlayHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$QWMePageUserPlayHistoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$QWMePageUserPlayHistoryModelToJson(this);
}

@JsonSerializable(anyMap: true)
class QWMePagePlaceHolderNode {
  final String type;
  final String typeName;
  @JsonKey(name: 'data')
  final QWMePagePlaceHolderModel model;
  QWMePagePlaceHolderNode(this.type, this.typeName, this.model);

  factory QWMePagePlaceHolderNode.fromJson(Map<String, dynamic> json) =>
      _$QWMePagePlaceHolderNodeFromJson(json);
  Map<String, dynamic> toJson() => _$QWMePagePlaceHolderNodeToJson(this);
}

@JsonSerializable(anyMap: true)
class QWMePagePlaceHolderModel {
  final String holderTitle;
  final String holderPicture;
  QWMePagePlaceHolderModel(this.holderTitle, this.holderPicture);

  factory QWMePagePlaceHolderModel.fromJson(Map<String, dynamic> json) =>
      _$QWMePagePlaceHolderModelFromJson(json);
  Map<String, dynamic> toJson() => _$QWMePagePlaceHolderModelToJson(this);
}

@JsonSerializable(anyMap: true)
class QWMePageQQInfoNode {
  final String type;
  final String typeName;
  @JsonKey(name: 'data')
  final QWMePageQQInfoModel model;
  QWMePageQQInfoNode(this.type, this.typeName, this.model);

  factory QWMePageQQInfoNode.fromJson(Map<String, dynamic> json) =>
      _$QWMePageQQInfoNodeFromJson(json);
  Map<String, dynamic> toJson() => _$QWMePageQQInfoNodeToJson(this);
}

@JsonSerializable(anyMap: true)
class QWMePageQQInfoModel {
  final String title;
  final String subTitle;
  final QWMePageActionButtonModel joinButton;

  QWMePageQQInfoModel(this.title, this.subTitle, this.joinButton);

  factory QWMePageQQInfoModel.fromJson(Map<String, dynamic> json) =>
      _$QWMePageQQInfoModelFromJson(json);
  Map<String, dynamic> toJson() => _$QWMePageQQInfoModelToJson(this);
}

@JsonSerializable(anyMap: true)
class QWMePageActionButtonModel {
  final String buttonTitle;
  final String buttonLink;

  QWMePageActionButtonModel(this.buttonTitle, this.buttonLink);

  factory QWMePageActionButtonModel.fromJson(Map<String, dynamic> json) =>
      _$QWMePageActionButtonModelFromJson(json);
  Map<String, dynamic> toJson() => _$QWMePageActionButtonModelToJson(this);
}

@JsonSerializable(anyMap: true)
class QWMePageUserDecorationsModel {
  final String decorationType;
  final String decorationPic;

  QWMePageUserDecorationsModel(this.decorationType, this.decorationPic);

  factory QWMePageUserDecorationsModel.fromJson(Map<String, dynamic> json) =>
      _$QWMePageUserDecorationsModelFromJson(json);
  Map<String, dynamic> toJson() => _$QWMePageUserDecorationsModelToJson(this);
}
