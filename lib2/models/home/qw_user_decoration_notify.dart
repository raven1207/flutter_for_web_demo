import 'package:json_annotation/json_annotation.dart';

part 'qw_user_decoration_notify.g.dart';

@JsonSerializable(anyMap: true)
class QWUserDecorationNotifyPO {
  String decorationPic;
  String decorationTitle;
  QWUserDecorationNotifyToast actionToast;

  QWUserDecorationNotifyPO({
    this.decorationPic,
    this.decorationTitle,
    this.actionToast
  });

  factory QWUserDecorationNotifyPO.fromJson(Map<String, dynamic> json) => _$QWUserDecorationNotifyPOFromJson(json);

  Map<String, dynamic> toJson() => _$QWUserDecorationNotifyPOToJson(this);
}

@JsonSerializable(anyMap: true)
class QWUserDecorationNotifyToast {
  String title;
  String subTitle;
  String bizCode;
  List<QWUserDecorationNotifyButton> buttons;

  QWUserDecorationNotifyToast({
    this.title,
    this.subTitle,
    this.bizCode,
    this.buttons
  });

  factory QWUserDecorationNotifyToast.fromJson(Map<String, dynamic> json) => _$QWUserDecorationNotifyToastFromJson(json);

  Map<String, dynamic> toJson() => _$QWUserDecorationNotifyToastToJson(this);
}

@JsonSerializable(anyMap: true)
class QWUserDecorationNotifyButton {
  String title;

  QWUserDecorationNotifyButton({this.title});

  factory QWUserDecorationNotifyButton.fromJson(Map<String, dynamic> json) => _$QWUserDecorationNotifyButtonFromJson(json);

  Map<String, dynamic> toJson() => _$QWUserDecorationNotifyButtonToJson(this);
}