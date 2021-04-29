import 'dart:io';

// import 'package:acg_flutter_channel/acg_flutter_channel.dart';
import 'package:device_info/device_info.dart';

class QWDeviceManager {
  //
  factory QWDeviceManager() => _getInstance();

  static QWDeviceManager get instance => _getInstance();
  static QWDeviceManager _instance;

  ///
  bool _isFPSOptimizationEnbaled = true;
  bool _isLowDevice = false;
  int _deviceScore = -1;
  String utdid = '';
  AndroidDeviceInfo _androidInfo;

  QWDeviceManager._internal() {
    ///获取UTDID
    // ACGEnvironmentChannel.config.then((value) {
    //   utdid = value['utdid'] ?? '';
    // }).whenComplete(() {
    //   print("_getGamePadView >> utdid" + utdid);
    //   // 初始化
    //   Map<String, dynamic> arguments = {
    //     "namespace": 'qw_tech_ab_config',
    //     "key": 'isFPSOptimizationEnbaled',
    //     "defaultVal": '1',
    //   };
    //   ACGOrangeChannel.getConfig(arguments).then((value) {
    //     print("QWOrangeManager >> getConfig:" + value);
    //     _isFPSOptimizationEnbaled = value == '1';
    //   });
    // });

    ///获取设备等级
    // ACGEnvironmentChannel.isLowDevice.then((value) {
    //   print('ChannelDevice >> isLowDevice=$value');
    //   _isLowDevice = value;
    // });
    updateDeviceScore();

    // deviceInfo.androidInfo
    //     .then((value) => () {
    //           AndroidDeviceInfo androidInfo = value;
    //           print('ChannelDevice ${androidInfo.model}'); // e.g. "Moto G (4)"
    //         })
    //     .catchError((e) {
    //   if (e is PlatformException) {
    //     String errorMsg = e.message ?? '';
    //     if (errorMsg.isNotEmpty) {
    //       ///
    //     }
    //   }
    // });

    ///获取设备评分
    // ACGEnvironmentChannel.getDeviceScore.then((value) {
    //   print('ChannelDevice >> getDeviceScore=$value');
    //   //:https://yuque.antfin-inc.com/mf171760/sa4is0/gp2pvb
    //   _deviceScore = value;
    //   _isLowDevice = value > 0 && value < 60;
    // });
  }

  ///如果已经有设备评分，直接返回
  void updateDeviceScore() async {
    if (Platform.isAndroid) {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      _androidInfo = await deviceInfo.androidInfo;
      print('QWDeviceOSInfo on ${_androidInfo.version.sdkInt}'); // e.g. "Moto G (4)"
      _isLowDevice = (_androidInfo?.version?.sdkInt ?? 26) < 26; //api 26=8.0
    }
  }
  //   if (_deviceScore == -1) {
  //     ACGEnvironmentChannel.getDeviceScore.then((value) {
  //       print('ChannelDevice >> getDeviceScore=$value');
  //       //:https://yuque.antfin-inc.com/mf171760/sa4is0/gp2pvb
  //       _deviceScore = value;
  //       _isLowDevice = value > 0 && value < 60;
  //     });
  //   }
  // }

  ///fps优化是否开启
  bool isOptFPSEnabled() {
    return _isFPSOptimizationEnbaled;
  }

  ///是否是低端机
  bool isLowDevice() {
    return _isLowDevice;
  }

  ///获取机型
  String get deviceMode => _androidInfo?.model;


  static QWDeviceManager _getInstance() {
    if (_instance == null) {
      _instance = new QWDeviceManager._internal();
    }
    return _instance;
  }
}
