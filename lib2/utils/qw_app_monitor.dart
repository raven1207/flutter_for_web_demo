// import 'package:acg_flutter_channel/acg_flutter_channel.dart';
// import 'package:qingwan_flutter_builder/main.dart';
// import 'package:qingwan_flutter_builder/page/home/qw_main_page.dart';

///记录是否已经注册
Map<String, bool> hasRegister = {};

///注册module 、 monitorPoint
_registerMonitorPointer(String module, String monitorPointer) {
  if (hasRegister[module + monitorPointer] != null) {
    return;
  }
  hasRegister[module + monitorPointer] = true;
  Map<String, dynamic> arguments = {
    "module": module, //"qingwanGame",
    "monitorPoint": monitorPointer, //"startGame",
    "dimensions": [
      "pageName",
      "videoId",
      "streamType",
      "load_time",
      "code",
    ],
  };
//   ACGMonitorChannel.register(arguments);
}

///上报monitor对应的维度
reportPlayTime(String module, String monitorPointer, Map<String, String> basicInfo) {
  print("CGFlutter:appMonitor,  reportVideoPlayTime basicInfo=$basicInfo");
  _registerMonitorPointer(
    module,
    monitorPointer,
  );
  Map<String, String> commonMap = basicInfo;
  // commonMap.remove("gamestatus");
//   ACGMonitorChannel.commit({
//     "module": module, //"qingwanGame",
//     "monitorPoint": monitorPointer, //"playTime",
//     "dimensions": {
//       ...commonMap,
//     }
//   });
}

// 统计页面耗时
void doFirstPageMonitor(String stage) {
  // 统计耗时
//   if (QWMainPage.pageEndTime == null) {
//     print("doFirstPageMonitor:, time=" + DateTime.now().toString() + ",stage=" + stage);
//     if (stage == null) {
//       stage = "unknown";
//     }
//     if (QWMainPage.hasCache) {
//       stage = "cache_" + stage;
//     }

//     QWMainPage.pageEndTime = DateTime.now();
//     Map<String, dynamic> arguments = {
//       'mainStartTime': QWMainScreen.mainScreenBeginTime?.millisecondsSinceEpoch.toString() ?? "-1",
//       'mainEndTime': QWMainScreen.mainScreenEndTime?.millisecondsSinceEpoch.toString() ?? "-1",
//       'homeStartTime': QWMainPage.pageStartTime?.millisecondsSinceEpoch.toString() ?? "-1",
//       'homeEndTime': QWMainPage.pageEndTime?.millisecondsSinceEpoch.toString() ?? "-1",
//       'mainPageStartTime': QWMainPage.mainPageStartTime?.millisecondsSinceEpoch.toString() ?? "-1",
//       'mainPageEndTime': QWMainPage.mainPageEndTime?.millisecondsSinceEpoch.toString() ?? "-1",
//       'stage': stage ?? "unknown",
//       'extraMonitorInfo': QWMainPage.extraMonitorInfo ?? "unknown",
//     };
//     ACGMonitorChannel.syncData(arguments);
//   }
}
