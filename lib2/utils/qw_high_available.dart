// import 'package:acg_flutter_channel/acg_flutter_channel.dart';
import 'package:apm_uploader/apm_uploader.dart';
import 'package:high_available/high_avail.dart';
import 'package:flutter/foundation.dart';
// import 'package:flutter_boost/flutter_boost.dart';
import 'package:flutter/material.dart';

class QWFlutterBinding extends WidgetsFlutterBinding with PerformanceFlutterBinding{}

class QWHighAvailable {
  static void initConfig() {
    /// debug 环境 DoKit中会初始化 PerformanceFlutterBinding
    if (!kDebugMode) {
      QWFlutterBinding();
    }
    Performance().init(
      config: PerformanceConfig(
        extendUploader: <BaseUploader>[
          ///实例化Uploader,可以自行定制Uploader
          QWApmUploader(),
        ],
      ),
    );
    initObserver();
  }

  static void pushEvent(dynamic error, dynamic stackTrace) {
    try {
    //   ACGLogChannel.tlog('[flutter exception]', 'info: ${error.toString()}, stackTrace: ${stackTrace.toString()}');
    } catch (e){
    }
    if (!bool.fromEnvironment("dart.vm.product")) {
      if(error is FlutterErrorDetails){
        FlutterError.presentError(error);
      }
    }
    Performance().pushEvent(ExceptionEvent(
      info: error.toString(),
      stackTrace: stackTrace.toString(),
      type: 'FLUTTER_EXCEPTION',
    ));
  }

  static void initObserver() {
    // FlutterBoost.singleton.addContainerObserver(
    //     ((ContainerOperation operation, BoostContainerSettings settings) {
    //       if (operation == ContainerOperation.Remove) {
    //         Performance().pushEvent(RouterEvent(
    //           RouterEventType.remove,
    //           pageInfoData: PageInfoData(
    //               pageName: settings.name,
    //               uniqueId: settings.uniqueId),
    //         ));
    //       } else if (operation == ContainerOperation.Pop) {
    //         Performance().pushEvent(RouterEvent(
    //           RouterEventType.pop,
    //         ));
    //       } else if (operation == ContainerOperation.Push) {
    //         Performance().pushEvent(RouterEvent(
    //           RouterEventType.push,
    //           pageInfoData: PageInfoData(
    //               pageName: settings.name,
    //               uniqueId: settings.uniqueId),
    //         ));
    //       }
    //     }));

    // FlutterBoost.singleton.addBoostContainerLifeCycleObserver(
    //         (ContainerLifeCycle state, BoostContainerSettings settings) {
    //       if (state == ContainerLifeCycle.Disappear) {
    //         Performance().pushEvent(AppStatusEvent(AppStatusEventType.disappear));
    //       }
    //     });
  }
}

class QWApmUploader extends ApmUploader {
  @override
  void upload(BaseUploadData data) {
    super.upload(data);
    try {
      if (data is PageTimeLineUploadData) {
        if (data.timeLine != null) {
          int firstPaintTime = data.timeLine['fp']?.time;
          int firstContentfulTime = data.timeLine['fcp']?.time;
          int interactTime = data.timeLine['tti']?.time;
          if (interactTime != null) {
            // ACGLogChannel.tlog('CGHome', 'QWApmUploader interactTime=$interactTime name=' + data.pageInfoData.pageName);
            sendMonitorEvent(interactTime, data.pageInfoData.pageName);
          }
        }
      }
    } catch (e) {
      print('--zkh5 QWApmUploader error');
    }
  }

  void sendMonitorEvent(int interactTime, String pageName) {
    // ACGMonitorChannel.commit({
    //   "module": "qingwan_home",
    //   "monitorPoint": "page_load",
    //   "dimensions": {"name": 'pageload', "stage": pageName, "code": '0', "time": interactTime}
    // });
  }
}
