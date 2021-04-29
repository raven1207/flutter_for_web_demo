import 'package:json_annotation/json_annotation.dart';
part 'qw_history_model.g.dart';

@JsonSerializable(anyMap: true)
class QWHistoryPageModel {
  final String api;
  final QWHistoryPageDataModel data;
  final String v;
  final String platform;

  QWHistoryPageModel(this.api, this.data, this.v, this.platform);

  factory QWHistoryPageModel.fromJson(Map<String, dynamic> json) =>
      _$QWHistoryPageModelFromJson(json);
  Map<String, dynamic> toJson() => _$QWHistoryPageModelToJson(this);
}

@JsonSerializable(anyMap: true)
class QWHistoryPageDataModel {
  final List<QWHistoryDataListModel> litePlayUserPlayHistoryNodes;
  final String userHistoryCount;
  final String hasMoreUserHistory;

  QWHistoryPageDataModel(this.litePlayUserPlayHistoryNodes,
      this.userHistoryCount, this.hasMoreUserHistory);

  factory QWHistoryPageDataModel.fromJson(Map<String, dynamic> json) =>
      _$QWHistoryPageDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$QWHistoryPageDataModelToJson(this);
}

@JsonSerializable(anyMap: true)
class QWHistoryDataListModel {
  final String type;
  final QWHistoryDataListDataModel data;

  QWHistoryDataListModel(this.type, this.data);

  factory QWHistoryDataListModel.fromJson(Map<String, dynamic> json) =>
      _$QWHistoryDataListModelFromJson(json);
  Map<String, dynamic> toJson() => _$QWHistoryDataListModelToJson(this);
}

@JsonSerializable(anyMap: true)
class QWHistoryDataListDataModel {
  final String coverLinkUrl;
  final String coverTags;
  final String coverTitle;
  final String coverPicture;
  final String reportTime;
  final String gameId;
  final String liteLineId;
  final String litePlayId;
  final String liteVideoId;

  QWHistoryDataListDataModel(
      this.coverLinkUrl,
      this.coverTags,
      this.coverTitle,
      this.coverPicture,
      this.reportTime,
      this.gameId,
      this.liteLineId,
      this.litePlayId,
      this.liteVideoId);

  factory QWHistoryDataListDataModel.fromJson(Map<String, dynamic> json) =>
      _$QWHistoryDataListDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$QWHistoryDataListDataModelToJson(this);
}
