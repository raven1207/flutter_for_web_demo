// import 'package:acg_flutter_channel/acg_flutter_channel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

class ReceivedNotification {
  ReceivedNotification({
    @required this.id,
    @required this.title,
    @required this.body,
    @required this.payload,
  });

  final int id;
  final String title;
  final String body;
  final String payload;
}

class QWNotifications {
  static void showNotification(
      String payLoad,
      String title,
      {
        int id = 0,
        String subTitle,
        String androidIconAssetName = '@drawable/ic_launcher_cloudgame',
        String channelId = 'default',
        String channelName = 'default',
        Importance importance = Importance.max,
        Priority priority = Priority.max,
      }) async {
    debugPrint('notification start');
    init(androidIconAssetName);
    AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
        channelId, channelName, 'default',
        // channelAction: AndroidNotificationChannelAction.update,
        // visibility: NotificationVisibility.public,
        importance: importance, priority: priority, ticker: 'ticker',
    );
    NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(id, title, subTitle, platformChannelSpecifics, payload: payLoad);
  }
  static bool isInit = false;
  static void init(String androidIconAssetName) async{
    if(isInit) {
      return;
    }
    isInit = true;
    // var initializationSettingsAndroid = new AndroidInitializationSettings(androidIconAssetName);
    // var initializationSettingsIOS = new IOSInitializationSettings();
    // InitializationSettings initializationSettings = InitializationSettings(
    //   android: initializationSettingsAndroid,
    //   iOS: initializationSettingsIOS,
    // );
    // flutterLocalNotificationsPlugin.initialize(initializationSettings, onSelectNotification: (String payload) async {
    //   if (payload != null) {
    //     debugPrint('notification payload: $payload');
    //   }
    //
    // });

    AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings(androidIconAssetName);
    /// Note: permissions aren't requested here just to demonstrate that can be
    /// done later
    final IOSInitializationSettings initializationSettingsIOS =
    IOSInitializationSettings(
        requestAlertPermission: false,
        requestBadgePermission: false,
        requestSoundPermission: false,
        onDidReceiveLocalNotification:
            (int id, String title, String body, String payload) async {
              _configureDidReceiveLocalNotificationSubject(id, title, body, payload);
        });

    final InitializationSettings initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsIOS,
        );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String payload) async {
          _configureSelectNotificationSubject(payload);
        });
  }

  static void _configureSelectNotificationSubject(String payload) {
    debugPrint('notification payload: $payload');
    // ACGEnvironmentChannel.getMoveToFront.then((value) {
    // });
  }

  static _configureDidReceiveLocalNotificationSubject(int id, String title, String body, String payload) async {
    debugPrint('notification payload: $payload');
  }

}
