import 'dart:async';
import 'dart:io';

// import 'package:acg_flutter_channel/acg_flutter_channel.dart';
// import 'package:acg_flutter_component/acg_flutter_component.dart';
// import 'package:acggame_paassdk_flutter_plugin/acg_game_player.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_boost/flutter_boost.dart';
// import 'package:qingwan_flutter_builder/channel/qw_nav_channel.dart';
import 'package:acg_flutter_theme/acg_flutter_theme.dart';
// import 'package:qingwan_flutter_builder/components/home/qw_avatar_decoration_alert.dart';
// import 'package:qingwan_flutter_builder/constants/qw_modal_btn_color.dart';
// import 'package:qingwan_flutter_builder/models/home/qw_user_decoration_notify.dart';
// import 'package:qingwan_flutter_builder/models/qw_app_start_model.dart';
// import 'package:qingwan_flutter_builder/service/qw_game_service.dart';
// import 'package:qingwan_flutter_builder/service/qw_user_info.dart';
// import 'package:qingwan_flutter_builder/utils/qw_safemap.dart';
// import 'package:qingwan_flutter_builder/utils/qw_utils.dart';
// import 'package:qingwan_flutter_builder/service/qw_app_start_check.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _QWResearchAlertHasShow = '_QWResearchAlertHasShow';
const String _QWAgreementAlertHasShow = '_QWResearchAlertHasShow';
const String _QWLastConnectGameSession = '_QWLastConnectGameSession';
const int MAX_RETRY_COUNT = 3;

// ignore: avoid_classes_with_only_static_members
class QWAppLaunchUtil {
  /////////////////////////////////////////////////////////////////////////////
  /// Public
  static int retryCount = 0;

  static allLaunchEventCheck() {
    /// 启动协议弹窗检测
    _agreementAlertCheck();
    /// 登录状态下的启动检查
    _userLoginCheck((flag) {
      if (flag) {
        /// 启动问卷调查/游戏重连检测
        _sendStartCheckAPI();
        /// 用户获取头像框提醒 接口检查
        _sendUserDecorationAPICheck();
      }
    });
  }

  /////////////////////////////////////////////////////////////////////////////
  /// Private

  /// 登录状态检查
  static _userLoginCheck(Function(bool flag) callBack) {
    // 判断当前是否登录
    print("appStartEventCheck begin");
    // ACGUserChannel.fetchUser().then((user) {
    //   print("appStartEventCheck fetchUser end");
    //   if (user?.userId?.isNotEmpty ?? false) {
    //     print("appStartEventCheck is Login, retryCount=" +
    //         retryCount.toString());
    //     callBack(true);
    //   } else {
    //     // 如果检查的时候登录信息未获取到，可能是用户信息未初始化完成
    //     // 偶现问题，这里尝试 delay 几次来触发
    //     ++retryCount;
    //     if (retryCount > MAX_RETRY_COUNT) {
    //       callBack(false);
    //       print("appStartEventCheck is not Login, retryCount=" +
    //           retryCount.toString());
    //       return;
    //     }
    //     print("appStartEventCheck userId isEmpty, retryCount=" +
    //         retryCount.toString());
    //     Future.delayed(Duration(milliseconds: 1000), () {
    //       print("Future.delayed retryCount=" + retryCount.toString());
    //       _userLoginCheck(callBack);
    //     });
    //   }
    // });
  }

  /// 问卷调查和游戏重连检测接口
  static void _sendStartCheckAPI() async {
    // 检查有没有展示过
    _checkResearchAlertHasShow().then((hasSurveyShow) {
    //   appStartCheckAPI({'hasSurvey': hasSurveyShow}).then((value) {
    //     try {
    //       QWAppStartData data = QWAppStartModel.fromJson(value).data;
    //       if (data == null) {
    //         return;
    //       }
    //       // 存在重连的游戏
    //       QWAppLastGame lastGame = data.reconnectGame?.lastGame;
    //       if (lastGame != null) {
    //         String gameSession = lastGame.gameSession ?? '';
    //         int remainTime = lastGame.remainTime?.qw_toInt();
    //         bool continueGame = (lastGame.continueGame ?? '').qw_toBool();
    //         if (gameSession.isNotEmpty && continueGame && remainTime > 60 * 2) {
    //           _getLastConnectGameSession().then((last) {
    //             if (last != gameSession) {
    //               _reconnectPlayGameAlert(data.reconnectGame);
    //             }
    //           });
    //         }
    //       }
    //       // 存在问卷调查
    //       else if ((data.survey?.linkUrl ?? '').isNotEmpty) {
    //         if (hasSurveyShow == false) {
    //           _researchAlertShow(data.survey);
    //         }
    //       }
    //     } catch (e) {
    //       print(e.toString());
    //     }
    //   });
    }).catchError((err) {
        print('mtop.liteplay.liteplayapp.start===err=$err');
    });
  }

  /// 回到游戏弹窗
//   static _reconnectPlayGameAlert(QWAppStartReconnectGame game) {
//     BuildContext context =
//         FlutterBoost.containerManager.onstageContainer?.context;
//     if (context == null) {
//       Future.delayed(Duration(milliseconds: 300)).then((value) {
//         _reconnectPlayGameAlert(game);
//       });
//       return;
//     }

//     String matchString = game.litePlayTitle ?? '';
//     QWAlertDialog().showWithMatchText(
//       bgColor: ThemeSkinColors.of(context).data.bgColor2,
//       context: context,
//       title: '正在玩 $matchString\n是否回到游戏?',
//       titleMatchText: [
//         QWMatchText(
//             matchString: matchString,
//             style: TextStyle(
//                 fontSize: 15,
//                 fontFamily: 'PingFangSC-Regular',
//                 color: ThemeSkinColors.of(context).data.brandColorLevel0))
//       ],
//       content: null,
//       action1: QWAlertAction(
//           title: '不玩了',
//           // type: QWAlertActionType.normal,
//           type: QWAlertActionType.custom,
//           styleColor: getModalBtnColor(context, 'l'),
//           onTap: () {
//             if(game != null && game.gaming != null){
//               QWGameService.instance.stopGaming('重返战场 放弃', game?.gaming?.paasGameId);
//             }
//             _addLastConnectGameSession(game?.gameSession ?? '');
//           }),
//       action2: QWAlertAction(
//           title: '继续玩',
//           // type: QWAlertActionType.destructive,
//           type: QWAlertActionType.custom,
//           styleColor: getModalBtnColor(context, 'r'),
//           onTap: () {
//             ACGUserChannel.fetchUser().then((user) {
//               if (user?.userId?.isNotEmpty ?? false) {
//                 QWGameServiceStartModel startModel = QWGameServiceStartModel();
//                 startModel.userId = user.userId;
//                 startModel.mixGameId = game.gaming.mixGameId;
//                 startModel.tenantBizParam = game.gaming.paasBizParam;
//                 startModel.controllerIds = [game.gaming.paasControllerId];
//                 startModel.paasGameId = game.gaming.paasGameId;
//                 startModel.gameSessionId = game.gameSession;
//                 startModel.litePlayId = game.litePlayId;
//                 QWGameService.instance.startGame(startModel, from:"重返战场");
//               }
//             });
//           }),
//     );
//   }

  /// 调研弹窗
//   static _researchAlertShow(QWAppStartSurvey survey) {
//     BuildContext context =
//         FlutterBoost.containerManager.onstageContainer?.context;
//     if (context == null) {
//       Future.delayed(Duration(milliseconds: 300)).then((value) {
//         _researchAlertShow(survey);
//       });
//       return;
//     }

//     QWAlertDialog dialog = QWAlertDialog();
//     dialog.showWithLargeButton(
//       bgColor: ThemeSkinColors.of(context).data.bgColor2,
//       context: context,
//       title: survey.title,
//       content: survey.content,
//       contentMatchText: [
//         QWMatchText(
//             matchString: survey.highlight ?? '',
//             style: TextStyle(
//                 fontSize: 14,
//                 fontFamily: 'PingFangSC-Semibold',
//                 color: ThemeSkinColors.of(context).data.brandColorLevel0))
//       ],
//       contentAlignment: TextAlign.left,
//       action: QWAlertAction(
//           title: '填写问卷',
//           // type: QWAlertActionType.yellowDestructive,
//           type: QWAlertActionType.custom,
//           styleColor: getModalBtnColor(context, 'r'),
//           onTap: () {
//             if (survey.linkUrl.qw_isNotEmpty()) {
//               QWNavigateChannel.open(survey.linkUrl);
//             }
//           }),
//     );
//     dialog.dialogWillHidden(() {
//       _addResearchAlertShowRecord();
//     });
//   }

  static Future<bool> _checkResearchAlertHasShow() async {
    // ACGUser userInfo = await ACGUserChannel.fetchUser();
    // String key = userInfo?.userId ?? '';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // bool flag = (prefs.getBool(key + _QWResearchAlertHasShow) ?? false);
    // return flag;
  }

  static _addResearchAlertShowRecord() async {
    // ACGUser userInfo = await ACGUserChannel.fetchUser();
    // String key = userInfo?.userId ?? '';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setBool(key + _QWResearchAlertHasShow, true);
  }

  static Future<String> _getLastConnectGameSession() async {
    // ACGUser userInfo = await ACGUserChannel.fetchUser();
    // String key = userInfo?.userId ?? '';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // String flag = prefs.getString(key + _QWLastConnectGameSession) ?? '';
    // return flag;
  }

  static _addLastConnectGameSession(String value) async {
    // ACGUser userInfo = await ACGUserChannel.fetchUser();
    // String key = userInfo?.userId ?? '';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setString(key + _QWLastConnectGameSession, value ?? '');
  }

  /// 隐私协议弹窗
  static _agreementAlertCheck() {
    _checkAgreementAlertHasShow().then((flag) {
      if (flag) {
        _agreementAlert();
      }
    });
  }

  static Future<bool> _checkAgreementAlertHasShow() async {
    String appVersion = await _getAppVersion();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool flag = (prefs.getString(_QWAgreementAlertHasShow) ?? '') != appVersion;
    return flag;
  }

  static _addAgreementAlertVersionRecord() async {
    String appVersion = await _getAppVersion();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_QWAgreementAlertHasShow, appVersion);
  }

  static Future<String> _getAppVersion() async {
    Completer<String> completer = Completer();
    String version = 'v0.0.1';
    try {
    //   Map map = await ACGSettingChannel.getAppVersion({});
    //   if (map != null) {
    //     String value = map['versionName'];
    //     if (value.qw_isNotEmpty()) {
    //       version = value;
    //     }
    //   }
      completer.complete(version);
    } catch (e) {
      print(e);
      completer.complete(version);
    }
    return completer.future;
  }

  static _agreementAlert() {
    // BuildContext context =
    //     FlutterBoost.containerManager.onstageContainer?.context;
    // if (context == null) {
    //   Future.delayed(Duration(milliseconds: 300)).then((value) {
    //     _agreementAlert();
    //   });
    //   return;
    // }

    TextStyle matchTextStyle = TextStyle(
      fontFamily: '.PingFangSC-Regular',
      fontSize: 14,
    //   color: ThemeSkinColors.of(context).data.brandColorLevel0,
      // color: Color.fromRGBO(153, 153, 153, 1),
      decoration: TextDecoration.underline,
      fontWeight: FontWeight.w300,
    );

    // QWMatchText agreement = QWMatchText(
    //     matchString: '《服务协议》',
    //     style: matchTextStyle,
    //     onTap: () {
    //       QWNavigateChannel.open(_agreementLinkUrl);
    //     });

    // QWMatchText privacy = QWMatchText(
    //     matchString: '《隐私政策》',
    //     style: matchTextStyle,
    //     onTap: () {
    //       QWNavigateChannel.open(_privacyLinkUrl);
    //     });

    // QWAlertDialog().showWithMatchText(
    //   bgColor: ThemeSkinColors.of(context).data.bgColor2,
    //   context: context,
    //   title: _agreementAlertTitle,
    //   titleStyle: TextStyle(
    //       color: ThemeSkinColors.of(context).data.textColorLevel1,
    //       fontFamily: 'PingFangSC-Semibold',
    //       fontSize: 16),
    //   contentMatchText: [agreement, privacy],
    //   content: _agreementAlertContent,
    //   dialogStyle: QWAlertDialogStyle.activity,
    //   contentAlignment: TextAlign.left,
    //   action1: QWAlertAction(
    //       title: '不同意',
    //       // type: QWAlertActionType.normal,
    //       type: QWAlertActionType.custom,
    //       styleColor: getModalBtnColor(context, 'l'),
    //       onTap: () {
    //         exit(0);
    //       }),
    //   action2: QWAlertAction(
    //       title: '同意',
    //       // type: QWAlertActionType.yellowDestructive,
    //       type: QWAlertActionType.custom,
    //       styleColor: getModalBtnColor(context, 'r'),
    //       onTap: () {
    //         _addAgreementAlertVersionRecord();
    //       }),
    // );
  }

  /// 用户获取头像框提醒 接口检查
  static _sendUserDecorationAPICheck() {
    // getUserDecorationNotifyAPI().then((value) {
    //   var data = SafeMap(value)['data'].value;
    //   if (data != null) {
    //     var model = QWUserDecorationNotifyPO.fromJson(Map.from(data));
    //     if ( model != null && model.decorationPic.qw_isNotEmpty()) {
    //       _showUserDecorationAlert(model);
    //     }
    //   }
    // }).catchError((e) {
    //   print('getUserDecorationNotifyAPI error:' + e);
    // });
  }

  static _showUserDecorationAlert(model) {
    // BuildContext context =
    //     FlutterBoost.containerManager.onstageContainer?.context;
    // if (context == null) {
    //   Future.delayed(Duration(milliseconds: 300)).then((value) {
    //     _showUserDecorationAlert(model);
    //   });
    //   return;
    // }
    // QWAvatarDecorationAlert.show(context: context, model: model);
  }

}

const String _agreementAlertTitle = '欢迎来到氢玩APP';

const String _agreementAlertContent = """
1.为更好的向您提供氢玩APP的相关服务，我们会根据您使用服务的具体功能需要，收集必要的用户信息。
2.为保障您的账号与使用安全，您需要授权我们读取您的手机储存和手机识别码权限等，您有权拒绝或取消授权。
3.您可以访问、更正、删除您的个人信息，我们也提供注销账户和更正信息的渠道。
请您阅读完整版氢玩APP 《服务协议》和《隐私政策》 。
""";

const String _agreementLinkUrl =
    'https://g.alicdn.com/ygfe/cg-agreement/legalagreement_qw.html';
const String _privacyLinkUrl =
    'https://g.alicdn.com/ygfe/cg-agreement/privacypolicy_qw.html';
