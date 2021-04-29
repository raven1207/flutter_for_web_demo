import 'package:json_annotation/json_annotation.dart';

part 'qw_setting_model.g.dart';

// 设置页数据
@JsonSerializable(anyMap: true)
class QWSettingModel {
  final String api;
  final QWSettingDataModel data;
  final String v;
  final String platform;

  QWSettingModel(this.api, this.data, this.v, this.platform);

  factory QWSettingModel.fromJson(Map<String, dynamic> json) =>
      _$QWSettingModelFromJson(json);
  Map<String, dynamic> toJson() => _$QWSettingModelToJson(this);
}

// 设置页数据data
@JsonSerializable(anyMap: true)
class QWSettingDataModel {
  final List<QWSettingDataSettingNodeModel> settingNode;
  final QWSettingQuitButtonModel quitButton;

  QWSettingDataModel(
    this.settingNode,
    this.quitButton,
  );

  factory QWSettingDataModel.fromJson(Map<String, dynamic> json) =>
      _$QWSettingDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$QWSettingDataModelToJson(this);
}

// 设置页数据settingNode
@JsonSerializable(anyMap: true)
class QWSettingDataSettingNodeModel {
  final QWSettingDataSettingNodeDataModel data;
  final String cardType;
  final String buttonTitle;

  QWSettingDataSettingNodeModel(this.data, this.cardType, this.buttonTitle);

  factory QWSettingDataSettingNodeModel.fromJson(Map<String, dynamic> json) =>
      _$QWSettingDataSettingNodeModelFromJson(json);
  Map<String, dynamic> toJson() => _$QWSettingDataSettingNodeModelToJson(this);
}

@JsonSerializable(anyMap: true)
class QWSettingDataSettingNodeDataModel {
  final String settingName;
  final String settingLinkUrl;
  final String settingType;

  QWSettingDataSettingNodeDataModel(
      this.settingName, this.settingLinkUrl, this.settingType);

  factory QWSettingDataSettingNodeDataModel.fromJson(
          Map<String, dynamic> json) =>
      _$QWSettingDataSettingNodeDataModelFromJson(json);
  Map<String, dynamic> toJson() =>
      _$QWSettingDataSettingNodeDataModelToJson(this);
}

@JsonSerializable(anyMap: true)
class QWSettingQuitButtonModel {
  final String buttonTitle;

  QWSettingQuitButtonModel(
    this.buttonTitle,
  );

  factory QWSettingQuitButtonModel.fromJson(Map<String, dynamic> json) =>
      _$QWSettingQuitButtonModelFromJson(json);
  Map<String, dynamic> toJson() => _$QWSettingQuitButtonModelToJson(this);
}
