import 'package:json_annotation/json_annotation.dart';

part 'qw_avatar_model.g.dart';

// 个人头像页
@JsonSerializable(anyMap: true)
class QWAvatarModel {
  final String api;
  final QWUserAvatarFrameListData data;
  final String v;
  final String platform;

  QWAvatarModel(this.api, this.data, this.v, this.platform);

  factory QWAvatarModel.fromJson(Map<String, dynamic> json) =>
      _$QWAvatarModelFromJson(json);
  Map<String, dynamic> toJson() => _$QWAvatarModelToJson(this);
}

// 个人头像页数据 QWAvatarDataModel
@JsonSerializable(anyMap: true)
class QWUserAvatarFrameListData {
  final List<UserAvatarFrameNode> userAvatarFrameNodes;
  @JsonKey(fromJson: _intFromString)
  final int userAvatarFrameCount;
  @JsonKey(fromJson: _boolFromString, defaultValue: false)
  final bool hasMoreAvatarFrame;

  QWUserAvatarFrameListData({
    this.userAvatarFrameNodes,
    this.userAvatarFrameCount,
    this.hasMoreAvatarFrame});

  static int _intFromString(String target) {
    return int.tryParse(target ?? '0') ?? 0;
  }

  static bool _boolFromString(String target) =>
      (!(target == null || target == '') && target == 'false' ? false : true);

  factory QWUserAvatarFrameListData.fromJson(Map<String, dynamic> json) =>
      _$QWUserAvatarFrameListDataFromJson(json);
  Map<String, dynamic> toJson() => _$QWUserAvatarFrameListDataToJson(this);
}

// 个人头像页数据 QWAvatarDecorationModel
@JsonSerializable(anyMap: true)
class UserAvatarFrameNode {
  @JsonKey(fromJson: _intFromString)
  final int decorationId;
  final String decorationPic;
  final String decorationTitle;
  final String decorationSubTitle;
  // 1:可用 -1:过期
  @JsonKey(fromJson: _intFromString)
  final int status;
  @JsonKey(fromJson: _boolFromString, defaultValue: false)
  bool used;

  UserAvatarFrameNode({
    this.decorationId,
    this.decorationPic,
    this.decorationTitle,
    this.decorationSubTitle,
    this.status,
    this.used,
  });

  static int _intFromString(String target) {
    return int.tryParse(target ?? '0') ?? 0;
  }

  static bool _boolFromString(String target) =>
      (!(target == null || target == '') && target == 'false' ? false : true);

  factory UserAvatarFrameNode.fromJson(Map<String, dynamic> json) =>
      _$UserAvatarFrameNodeFromJson(json);
  Map<String, dynamic> toJson() => _$UserAvatarFrameNodeToJson(this);
}