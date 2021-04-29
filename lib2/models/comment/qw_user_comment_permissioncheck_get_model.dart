import 'package:json_annotation/json_annotation.dart';
part 'qw_user_comment_permissioncheck_get_model.g.dart';

@JsonSerializable(anyMap: true)
class QWUserCommentPermissionCheckModel {
  @JsonKey(name: "api")
  String api;
  @JsonKey(name: "data")
  QWUserCommentPermissionCheckDataModel data;
  @JsonKey(name: "ret")
  List<String> ret;
  @JsonKey(name: "v")
  String v;

  QWUserCommentPermissionCheckModel({this.api, this.data, this.ret, this.v});

  factory QWUserCommentPermissionCheckModel.fromJson(Map<String, dynamic> json) =>
      _$QWUserCommentPermissionCheckModelFromJson(json);
  Map<String, dynamic> toJson() => _$QWUserCommentPermissionCheckModelToJson(this);
}

@JsonSerializable(anyMap: true)
class QWUserCommentPermissionCheckDataModel {
  final String canComment;
  final QWUserCommentToastModel actionToast;

  QWUserCommentPermissionCheckDataModel(this.canComment, this.actionToast);
  factory QWUserCommentPermissionCheckDataModel.fromJson(Map<String, dynamic> json) =>
      _$QWUserCommentPermissionCheckDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$QWUserCommentPermissionCheckDataModelToJson(this);
}

@JsonSerializable(anyMap: true)
class QWUserCommentToastModel {
  final String title;
  final String bizCode;

  QWUserCommentToastModel(this.title, this.bizCode);
  factory QWUserCommentToastModel.fromJson(Map<String, dynamic> json) =>
      _$QWUserCommentToastModelFromJson(json);
  Map<String, dynamic> toJson() => _$QWUserCommentToastModelToJson(this);
}
