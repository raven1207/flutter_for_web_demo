import 'package:json_annotation/json_annotation.dart'; 

part 'qw_feedback_model.g.dart';

@JsonSerializable(anyMap: true)
class QWFeedbackModel {
  @JsonKey(name: "api")
  String api;
  @JsonKey(name: "data")
  QWFeedbackData data;
  @JsonKey(name: "ret")
  List<String> ret;
  @JsonKey(name: "v")
  String v;

  QWFeedbackModel({this.api, this.data, this.ret, this.v});

  factory QWFeedbackModel.fromJson(Map<String, dynamic> json) => _$QWFeedbackModelFromJson(json);

  Map toJson() => _$QWFeedbackModelToJson(this);
}

@JsonSerializable(anyMap: true)
class QWFeedbackData {
  @JsonKey(name: "data")
  QWFeedbackTag data;
  @JsonKey(name: "type")
  String type;
  @JsonKey(name: "typeName")
  String typeName;

  QWFeedbackData({this.data, this.type, this.typeName});

  factory QWFeedbackData.fromJson(Map<String, dynamic> json) => _$QWFeedbackDataFromJson(json);

  Map toJson() => _$QWFeedbackDataToJson(this);
}

@JsonSerializable(anyMap: true)
class QWFeedbackTag {
  @JsonKey(name: "items")
  List<QWFeedbackItem> items;
  @JsonKey(name: "title")
  String title;
  @JsonKey(name: "categoryLabel")
  String categoryLabel;
  @JsonKey(name: "contentLabel")
  String contentLabel;
  @JsonKey(name: "contentTip")
  String contentTip;
  @JsonKey(name: "contactLabel")
  String contactLabel;
  @JsonKey(name: "contactTip")
  String contactTip;

  QWFeedbackTag({
    this.items,
    this.title,
    this.categoryLabel,
    this.contentLabel,
    this.contentTip,
    this.contactTip,
    this.contactLabel});

  factory QWFeedbackTag.fromJson(Map<String, dynamic> json) => _$QWFeedbackTagFromJson(json);

  Map toJson() => _$QWFeedbackTagToJson(this);
}

@JsonSerializable(anyMap: true)
class QWFeedbackItem {
  @JsonKey(name: "emotion")
  String emotion;
  @JsonKey(name: "text")
  String text;

  QWFeedbackItem({this.emotion, this.text});

  factory QWFeedbackItem.fromJson(Map<String, dynamic> json) => _$QWFeedbackItemFromJson(json);

  Map toJson() => _$QWFeedbackItemToJson(this);
}

