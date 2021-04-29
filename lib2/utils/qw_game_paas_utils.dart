

import 'dart:async';

// import 'package:acg_flutter_channel/acg_flutter_channel.dart';
import 'package:acggame_paassdk_flutter_plugin/acg_game_player.dart';
// import 'package:qingwan_flutter_builder/service/qw_game_service.dart';

class QWGamePaaSUtil {

  static bool isGamePreLoadSuccess(int eventType, String eventCode) {
    bool gameLoadFinish = false;
    if (gameHasScript()) {
      gameLoadFinish = (eventType == 20 && eventCode == '201030');
    } else {
      gameLoadFinish = (eventType == 20 && eventCode == '201020');
    }
    return gameLoadFinish;
  }
  //游戏中正常打断
  static bool isRightGamingInterrupt(String eventCode){
    return eventCode == "2001012" || eventCode == "2001013"
        || eventCode == "701010" || eventCode == "701020";
  }

  static bool isGamePreLoadError(int eventType, String eventCode) {
    bool gameLoadError = false;
    if (eventType == 20) {
      gameLoadError = eventCode == '201021' ||
          eventCode == '201022' ||
          eventCode == '201031' ||
          eventCode == '201032';
    }
    return gameLoadError;
  }

  static bool isGameRestartError(int eventType, String eventCode) {
    bool gameRestartError = false;
    if (eventType == 210) {
      gameRestartError = eventCode == '2101020';
    }
    return gameRestartError;
  }

  static bool isGameAllLoadFinish(int eventType, String eventCode) {
    bool flag = false;
    if (gameHasScript()) {
      flag = (eventType == 270 && eventCode == '2701050');
    } else {
      flag = (eventType == 270 && eventCode == '2701040');
    }
    return flag;
  }

  static bool gameHasScript() {
    // return QWGameService.instance.gameResource != null &&
    //     QWGameService.instance.gameResource.hasScript;
  }

  static Future<String> getGameSession() async {
    Completer<String> completer = Completer();
    String gameSessionId = '';
    GamePlayerController.getGameSession().then((value) {
      gameSessionId = value;
    }).whenComplete(() {
      completer.complete(gameSessionId);
    });
    return completer.future;
  }

  static Future<String> getACGOrangeChannel(String key, String nameSpace, {String defValue}) async {
    Map<String, dynamic> arguments = {
      "namespace": nameSpace,
      "key": key,
      "defaultVal": defValue ?? '1',
    };
    Completer<String> completer = Completer();
    String retValue = '';
    // ACGOrangeChannel.getConfig(arguments).then((value) {
    //   retValue = value;
    // }).whenComplete(() {
    //   completer.complete(retValue);
    // });
    return completer.future;
  }

  static Future<String> getUtdid() async {
    Completer<String> completer = Completer();
    String utdid = '';
    // ACGEnvironmentChannel.config.then((value) {
    //   utdid = value['utdid'] ?? '';
    // }).whenComplete(() {
    //   completer.complete(utdid);
    // });
    return completer.future;
  }
}