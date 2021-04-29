import 'package:flutter/cupertino.dart';
// import 'package:qingwan_flutter_builder/utils/qw_device_manager.dart';

enum QWFpsPriority { High, Low }

class QWFpsUtils {
  ///需要分拆的Widget挂载在这里
  static List<GlobalKey> toRefreshList = [];
  static Map<GlobalKey, bool> dirtyStatusOfKey = {};
  static bool isUpdatingAuroPlayer = false;

  static bool canRefresh(GlobalKey globalKey) {
    // if (!QWDeviceManager.instance.isLowDevice()) {
    //   return true;
    // }
    print(
        'hp_build isRefreshed--->in: globalKey=${globalKey.hashCode}, dirtyStatusOfKey.LEN=${dirtyStatusOfKey.length}');
    bool canRefresh = dirtyStatusOfKey[globalKey];
    print(
        'hp_build isRefreshed--->out: globalKey=${globalKey.hashCode}, canRefresh=$canRefresh..dirtyStatusOfKey.LEN=${dirtyStatusOfKey.length}');
    if (canRefresh != null && canRefresh) {
      toRefreshList.remove(globalKey);
      dirtyStatusOfKey.remove(globalKey);

      ///刷新完毕，触发下一个
      _triggerNextFrame();
      return true;
    } else {
      ///展示色图, 随后会有addKeyToList调用
      return false;
    }
  }

  ///刚添加时，isDirty=false
  static void addKeyToList(GlobalKey globalKey) {
    if (toRefreshList.contains(globalKey)) {
      toRefreshList.remove(globalKey);
      dirtyStatusOfKey.remove(globalKey);
    }

    ///重新添加
    toRefreshList.add(globalKey);
    dirtyStatusOfKey.putIfAbsent(globalKey, () => false);
    print('hp_build addWidget: globalKey=${globalKey.hashCode}, isDirty=false');
    _triggerNextFrame();
  }

  static bool _hasCallback = false;
  static void _triggerNextFrame() {
    if (toRefreshList.length == 0) {
      print('hp_build _triggerNextFrame: toRefreshList. isEmpty. return.!!!');
      return;
    }
    if (_hasCallback) {
      return;
    }
    _hasCallback = true;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _hasCallback = false;
      if (toRefreshList.length == 0) {
        print('hp_build _triggerNextFrame: toRefreshList.len=0');
        return;
      }

      GlobalKey globalKey = toRefreshList.elementAt(0);
      if (globalKey == null) {
        print('hp_build _triggerNextFrame 异常1111');
        toRefreshList.remove(globalKey);
        dirtyStatusOfKey.remove(globalKey);
        _triggerNextFrame();
        return;
      }
      // bool canRefresh = dirtyStatusOfKey[globalKey];
      // if (canRefresh) {
      //   (globalKey.currentContext as StatefulElement).markNeedsBuild();
      //   print('hp_build _triggerNextFrame addPost >> 已经处理过了. ${globalKey.hashCode}');
      //   _triggerNextFrame();
      //   return;
      // }

      if (globalKey.currentState == null) {
        print('hp_build _triggerNextFrame 异常2222');
        toRefreshList.remove(globalKey);
        dirtyStatusOfKey.remove(globalKey);
        _triggerNextFrame();
        return;
      }

      if (!globalKey.currentState.mounted) {
        print('hp_build _triggerNextFrame mounted=false');
        toRefreshList.remove(globalKey);
        dirtyStatusOfKey.remove(globalKey);
        _triggerNextFrame();
        return;
      }

      if (QWFpsUtils.isUpdatingAuroPlayer) {
        print('hp_build _triggerNextFrame 正在刷播放器，跳过');
        _triggerNextFrame();
        return;
      }
      dirtyStatusOfKey[globalKey] = true;
      (globalKey.currentContext as StatefulElement).markNeedsBuild();
      print('hp_build _triggerNextFrame addPost: =${globalKey.hashCode}, 下一个调用应该是isrefreshed');
      _triggerNextFrame();
    });
    WidgetsBinding.instance.scheduleFrame();
  }
}
