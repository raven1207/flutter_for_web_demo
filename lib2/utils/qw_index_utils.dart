// import 'package:acg_flutter_channel/acg_flutter_channel.dart';
import 'package:flutter/services.dart';

String formatComment(String commentCount){
  if(commentCount == '0' || commentCount == null || commentCount == ''){
    return "评论";
  } else {
    int count = int.parse(commentCount);
    return formatNumber(count);
  }
}

String formatNumber(int num) {
  if (num == null) return '0';

  if (num >= 10E7) {
    // 1亿 1.2亿 12.4亿
    return '${(num / 10E7).toStringAsFixed(1)}亿';
  } else if (num >= 10E3) {
    // 1.20万 1.23万 12.34万 100万 100.03万 1,234万
    return '${(num / 10E3).toStringAsFixed(1)}万';
  }
  return '$num';
}

Future<Null> resetAppbarLightStyle() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
}

String getPublishTime(int timestamp) {
  return new DateTime.fromMillisecondsSinceEpoch(timestamp).toString();
}

//秒
int formatTime(duration) {
  int m = int.parse(duration ?? "0");
  var _time = (m / 60);
  return _time.toInt();
}

//毫秒
int formatWaitTime(duration) {
  double m = (int.tryParse(duration ?? "0") ?? 0) / 1000;
  var _time = (m / 60);
  return _time.toInt();
}

//将每个字符串之间插入零宽空格
String breakWord(String word) {
  if (word == null || word.isEmpty) {
    return word;
  }
  String breakWord = ' ';
  word.runes.forEach((element) {
    breakWord += String.fromCharCode(element);
    breakWord += '\u200B';
  });
  return breakWord;
}

//时间戳
int currentTimeMillis() {
  return DateTime.now().millisecondsSinceEpoch;
}

//埋点注册监测
void registerLoadingMonitor(isLoading, module, monitorPoint) {
  if (isLoading) {
    return;
  }
  isLoading = true;
  Map<String, dynamic> arguments = {
    "module": "qingwanDetail",
    "monitorPoint": "pageLoad",
    "dimensions": [
      "title",
      "time",
    ],
  };
//   ACGMonitorChannel.register(arguments);
}
