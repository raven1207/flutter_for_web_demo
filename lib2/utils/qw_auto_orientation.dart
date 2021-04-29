import 'dart:io' show Platform;

import 'package:auto_orientation/auto_orientation.dart';
import 'package:flutter/services.dart';

class QWAutoOrientation {
  static const MethodChannel _iosChannel = const MethodChannel('com.alibaba.cloudgame/auto_orientation');
  ////////////////////////////////////////////////////////////////////////////
  /// 视频播放窗口临时转屏，iOS用这两个接口
  static landscapeRightModeForIOS() async {
    try {
      await _iosChannel.invokeMethod('setLandscapeRight');
    } on MissingPluginException catch (_) {
      return;
    }
  }

  static portraitUpModeForIOS() async {
    try {
      await _iosChannel.invokeMethod('setPortraitUp');
    } on MissingPluginException catch (_) {
      return;
    }
  }

  ////////////////////////////////////////////////////////////////////////////
  /// 页面的横竖屏初始状态用如下接口
  static landscapeLeftMode() async {
    if (Platform.isIOS) {
      AutoOrientation.landscapeLeftMode();
    } else {
      SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    }
  }

  // rotate the device to landscape right mode
  static landscapeRightMode() async {
    if (Platform.isIOS) {
      AutoOrientation.landscapeRightMode();
    } else {
      SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight]);
    }
  }

  // rotate the device to portrait up mode
  static portraitUpMode() async {
    if (Platform.isIOS) {
      AutoOrientation.portraitUpMode();
    } else {
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    }
  }

  // rotate the device to portrait down mode
  static portraitDownMode() async {
    if (Platform.isIOS) {
      AutoOrientation.portraitDownMode();
    } else {
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown]);
    }
  }

  // rotate the device to portrait auto mode
  static portraitAutoMode() async {
    if (Platform.isIOS) {
      AutoOrientation.portraitAutoMode();
    } else {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }
  }

  // rotate the device to landscape auto mode
  static landscapeAutoMode() async {
    if (Platform.isIOS) {
      AutoOrientation.landscapeAutoMode();
    } else {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
      ]);
    }
  }

  // rotate the device to landscape auto mode
  static fullAutoMode() async {
    if (Platform.isIOS) {
      AutoOrientation.fullAutoMode();
    } else {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }
  }
}
