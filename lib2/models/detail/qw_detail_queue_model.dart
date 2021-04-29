// 详情页数据模型
import 'package:json_annotation/json_annotation.dart';
part 'qw_detail_queue_model.g.dart';

@JsonSerializable(anyMap: true)
class QWDetailQueueModel {
  final String api;
  final QWDetailQueueDataModel data;
  final String v;
  final String platform;

  QWDetailQueueModel(this.api, this.data, this.v, this.platform);

  factory QWDetailQueueModel.fromJson(Map<String, dynamic> json) => _$QWDetailQueueModelFromJson(json);
  Map<String, dynamic> toJson() => _$QWDetailQueueModelToJson(this);
}

@JsonSerializable(anyMap: true)
class QWDetailQueueDataModel {
  final String waitingBefore;
  final String waitingTime;

  QWDetailQueueDataModel(
    this.waitingBefore,
    this.waitingTime,
  );

  factory QWDetailQueueDataModel.fromJson(Map<String, dynamic> json) => _$QWDetailQueueDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$QWDetailQueueDataModelToJson(this);

}
