import 'package:flutter/foundation.dart';
// import 'package:qingwan_flutter_builder/components/play/qw_player_scene.dart';

const String flexStart = 'flex-start';

const String flexCenter = 'center';

const String flexEnd = 'flex-end';

const String column = 'column';

const String row = 'row';

const String flexSpaceBetween = 'space-between';

//回调
typedef GameInfoCallback = void Function(Map<String, dynamic> gameInfo);
typedef MapCallback = void Function(Map<String, dynamic> gameInfo);

const String COMMENTEVENTTOTAL = 'COMMENTEVENTTOTAL';
int CommentIsCall = 0;

class QWGlobal {
  QWGlobal() {}

  static bool isLogEnabled = kDebugMode;
}
enum QWSceneSingleOptionType {
  upLeft, //左上
  downLeft, //左下
  upRight, //右上
  downRight //右下
}