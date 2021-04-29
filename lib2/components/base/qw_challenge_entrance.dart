// 气泡组件
// created by xiao
//created at 2020-11-09
// import 'package:acg_flutter_channel/acg_flutter_channel.dart';
// import 'package:acg_flutter_component/acg_flutter_component.dart';
import 'package:flutter/material.dart';
import 'package:new_project/constants/qw_font.dart';
// import 'package:qingwan_flutter_builder/channel/qw_nav_channel.dart';
// import 'package:qingwan_flutter_builder/constants/acg_detail_tab.dart';
// import 'package:qingwan_flutter_builder/constants/qw_font.dart';
// import 'package:qingwan_flutter_builder/utils/qw_safemap.dart';

class QWChallengeEntrance extends StatelessWidget {
  QWChallengeEntrance(
      {Key key,
      this.joinedCountText,
      this.bgImageUrl,
      this.mixGameId,
      this.litePlayId,
      this.liteLineId,
      this.challengeId,
      this.margin,
      this.trackInfo,
      this.spmAB,
      this.pageName})
      : super(key: key);

  final String joinedCountText;
  final String bgImageUrl;

  final String mixGameId;
  final String  litePlayId;
  final String  liteLineId;
  final String  challengeId;
  final EdgeInsetsGeometry margin;

  //埋点相关参数
  final Map<String, dynamic> trackInfo;
  final String spmAB;
  final String pageName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          this.onChallengeClick();
        },
        // child: Container(
        //     width: MediaQuery.of(context).size.width,
        //     margin: this.margin,
        //     child: Stack(
        //       children: [
        //         Image.network(
        //           bgImageUrl,
        //           fit: BoxFit.contain,
        //           width: MediaQuery.of(context).size.width,
        //           height: 36,
        //         ),
        //         Container(
        //             padding: EdgeInsets.only(right: 22, top: 11),
        //             height: 36,
        //             alignment: Alignment.centerRight,
        //             child: Text(
        //               joinedCountText,
        //               style: TextStyle(
        //                 fontFamily: 'PingFangSC-Semibold',
        //                 color: Colors.white,
        //                 fontSize: 12,
        //               ),
        //               maxLines: 1,
        //               overflow: TextOverflow.ellipsis,
        //             ))
        //       ],
        //     ))
        child: Container(
            padding: EdgeInsets.only(left: 15),
			height: 42,
            child: Row(
              children: [
                // ACGCDNImage(
                //   'https://gw.alicdn.com/imgextra/i2/O1CN01nxR7Nv1IY4iMPqEqn_!!6000000000904-2-tps-54-54.png',
                //   height: 14,
                //   width: 16,
                //   fit: BoxFit.cover,
                //   deviceScale: MediaQuery.of(context).devicePixelRatio.toInt(),
                // ),
				SizedBox(width: 2,),
                Text('排行榜',
                    style: TextStyle(
                        fontFamily: kPingFangRegular,
                        color: Color(0xffffffff),
                        fontSize: 12))
              ],
            )));
  }

  void onChallengeClick() {
    // String url = "qwcg://flutter?un_flutter=true&flutter_path=/partDetail&"
    //     "mixGameId=$mixGameId"
    //     "&litePlayId=$litePlayId"
    //     "&liteLineId=$liteLineId"
    //     "&tabBarTag=${QWDetailTabBarTag.challenge}";

    // print('CGHome onChallengeClick url=' + url);
    // ACGUTChannel.click(
    //     pageName: pageName,
    //     eventName: 'feeds_card_challenge',
    //     spm: '$spmAB.feeds_card_challenge.ph',
    //     parameters: trackInfo);

    // QWNavigateChannel.open(url);

  }
}