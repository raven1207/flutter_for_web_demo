import 'dart:io' show Platform;

// import 'package:ali_flutter/ali_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_project/utils/qw_system_chrome.dart';
// import 'package:flutter_boost/flutter_boost.dart';
// import 'package:qingwan_flutter_builder/utils/qw_auto_orientation.dart';
// import 'package:qingwan_flutter_builder/utils/qw_system_chrome.dart';
// import 'package:qingwan_flutter_builder/service/qw_game_service.dart';

class QWNavigateChannel {
  static const MethodChannel _channel = MethodChannel('com.qingwan.cloudgame/nav');

  static void open(String url) {
    if (url == null || url.isEmpty) {
      return;
    }
    var uri = Uri.parse(url);
    if(Platform.isIOS) {
      String flutterPath = uri.queryParameters['flutter_path'] ?? '';
      if (flutterPath == '/game' || flutterPath == '/scenario') {
        //支持的旋转方向
        url += "&preferred_orientations=" + QWDeviceOrientationMask.landscape.valueOf.toString();
        //初始化页面的旋转方向
        url += "&init_orientation=" + QWDeviceOrientationMask.landscapeLeft.valueOf.toString();
        //禁止手势回退
        url += "&interactive_pop_disabled=" + "1".toString();
      } else if (flutterPath == '/partDetail') {
        url += "&preferred_orientations=" + (QWDeviceOrientationMask.portaitUp.valueOf).toString();
        url += "&init_orientation=" + QWDeviceOrientationMask.portaitUp.valueOf.toString();
      }
    }
    // AliFlutter.singleton.router.open(url);
  }

  static void closeByUniqueId(String id, {Map<String, dynamic> result, Map<String, dynamic> exts}) {
    // AliFlutter.singleton.router.close(id, result: result, exts: exts);
  }

  static void closeCurrent({Map<String, dynamic> result, Map<String, dynamic> exts}) {
    // if(Platform.isIOS) {
    //   BoostContainer bc = FlutterBoost.containerManager.offstage.last;
    //   bool shouldRotateToPortraitUp = true;
    //   if (bc.settings.name == '/partDetail'
    //       && QWGameService.instance.orientationOfPrevBoostContainer == Orientation.landscape) {  //前一个页面是片段详情页且播放器是全屏的，则不转竖屏
    //     shouldRotateToPortraitUp = false;
    //   } else if (bc.settings.name == '/game' || bc.settings.name == '/scenario') {  //前一个页面如果是横屏的情况，则不转竖屏
    //     shouldRotateToPortraitUp = false;
    //   }
    //   if (shouldRotateToPortraitUp) {
    //     QWAutoOrientation.portraitUpModeForIOS();
    //   }
    // }
    // AliFlutter.singleton.router.closeCurrent(result: result, exts: exts);
  }

  static void backHome() {
    int count = 0;
    // do{
    //   count++;
    //   AliFlutter.singleton.router.closeCurrent(exts: {"animated":false});
    // }while((FlutterBoost.containerManager?.onstageContainer?.name == "/home") || (count == 10));
  }}
