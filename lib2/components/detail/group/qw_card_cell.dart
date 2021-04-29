// import 'package:acg_flutter_channel/acg_flutter_channel.dart';
// import 'package:acg_flutter_component/acg_flutter_component.dart';
import 'package:acg_flutter_theme/acg_flutter_theme.dart';
import 'package:acg_ui_flutter/acg_ui_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:new_project/channel/qw_nav_channel.dart';
import 'package:new_project/components/base/qw_challenge_entrance.dart';

import 'package:new_project/constants/acg_constant.dart';
import 'package:new_project/constants/qw_assets.dart';
import 'package:new_project/constants/qw_cart_type.dart';
// import 'package:new_project/constants/qw_ut.dart';
import 'package:new_project/models/detail/qw_detail_model.dart';
// import 'package:qingwan_flutter_builder/channel/qw_nav_channel.dart';
// import 'package:qingwan_flutter_builder/components/base/qw_challenge_entrance.dart';
// import 'package:qingwan_flutter_builder/components/base/qw_challenge_tag.dart';
// import 'package:qingwan_flutter_builder/components/detail/part/qw_play_count.dart';
// // import 'package:qingwan_flutter_builder/components/base/qw_game_start.dart';
// import 'package:qingwan_flutter_builder/components/detail/qw_played_tag.dart';
// import 'package:qingwan_flutter_builder/components/play/qw_player_scene.dart';
// import 'package:qingwan_flutter_builder/components/play/qw_video_container.dart';
// import 'package:qingwan_flutter_builder/constants/acg_constant.dart';
// import 'package:qingwan_flutter_builder/constants/acg_detail_tab.dart';
// import 'package:qingwan_flutter_builder/constants/qw_assets.dart';
// import 'package:qingwan_flutter_builder/constants/qw_cart_type.dart';
// import 'package:qingwan_flutter_builder/constants/qw_ut.dart';
// import 'package:qingwan_flutter_builder/models/detail/qw_detail_model.dart';
// import 'package:qingwan_flutter_builder/utils/qw_safemap.dart';

class QwCardCell extends StatefulWidget {
  QwCardCell(
      {Key key,
      this.index,
      this.type,
      this.title,
      this.desc,
      this.playedCountText,
      this.commentCountText,
      this.shwoComment,
      this.hasPlayed,
      this.lastPlayed,
      this.isNew,
      this.videoUrl,
      this.coverUrl,
      this.videoDuration,
      this.tagName,
      this.tagIcon,
      this.tagUrl,
      this.litePlayId,
      this.startGame,
      this.gaming,
      this.mixGameId,
      this.onClick,
      this.onTapQueue,
      this.isQueue,
      this.waitingTime,
      this.liteLineId,
      this.challenge,
      this.isInView,
      this.indexId,
      this.cardData,
      this.brandColorLevel0,
      this.helpColor1,
      this.textColor,
      this.textColorLevel3,
      this.textColorLevel2,
      this.textColorLevel1})
      : super(key: key) {
    this.cardData.kPageAB ='';
    this.cardData.kPageName = '';
  }
  final int index;
  final String type;
  final String title;
  final String desc;
  final String playedCountText;
  final String commentCountText;
  final bool shwoComment;
  final String videoUrl;
  final String coverUrl;
  final String videoDuration;
  final String tagName;
  final String tagIcon;
  final String tagUrl;
  final String litePlayId;
  final String hasPlayed;
  final String lastPlayed;
  final String isNew;
  final Function onClick;
  final QWDetailDataGamingModel gaming;
  final Function onTapQueue;
  final bool isQueue;
  final String waitingTime;
  final String liteLineId;
  final String mixGameId;
  final Map challenge;
  final GameInfoCallback startGame;
  final QWDetailDataCardModel cardData;
  final Color brandColorLevel0;
  final Color helpColor1;
  final Color textColorLevel3;
  final Color textColorLevel2;
  final Color textColorLevel1;
  final Color textColor;
  final bool isInView;
  final String indexId;
  @override
  _QwCardCellState createState() => _QwCardCellState();
}

class _QwCardCellState extends State<QwCardCell> {
  ThemeSkinColors _themeSkinColors;

  Map <String, dynamic> trackInfo;

  @override
  Widget build(BuildContext context) {
    _themeSkinColors = ThemeSkinColors.of(context);
    final _isPlayed = widget.lastPlayed == 'true' || widget.hasPlayed == 'true';
    final _newPartGame = widget.isNew != null && widget.isNew == '1';

    trackInfo = widget.cardData?.trackInfo ?? {};
    // return QWVisibilityDetector(
    //     globalKey: widget.index.toString(),
    //     onExposeInfo: (info) {
    //       ACGUTChannel.expose(
    //         pageName: StatListPage.kPageName,
    //         eventName: 'feeds_card',
    //         spm: '${StatListPage.kSpmAB}.feeds_card.ph',
    //         parameters: {
    //           'position': widget.index + 1,
    //           'qingid': widget.litePlayId,
    //           'albumid': widget.liteLineId,
    //           'gameid': widget.mixGameId,
    //           'videoid': widget.cardData.video?.liteVideoId ?? "",
    //           'challengeid': widget.cardData?.challenge?.challengeId ?? "-1",
    //           ...trackInfo ?? {},
    //           ...info
    //         },
    //       );

    //       ACGUTChannel.expose(
    //         pageName: StatListPage.kPageName,
    //         eventName: 'feeds_card_comment',
    //         spm: '${StatListPage.kSpmAB}.c1612681423022.d1612681423022',
    //         parameters: {
    //           'gameid': widget.mixGameId,
    //           'qingid': widget.litePlayId,
    //           'videoid': widget.cardData.video?.liteVideoId ?? "",
    //           'albumid': widget.liteLineId,
    //           'cardpos': widget.index + 1,
    //           'challengeid': widget.cardData?.challenge?.challengeId ?? "-1",
    //           ...trackInfo ?? {},
    //         },
    //       );
    //     },
    //     child: GestureDetector(
    //       onTap: () {
    //         //剧情动画点击去全屏播放
    //         if (widget.type == ScenarioType) {
    //           if (widget.cardData.video == null) {
    //             return null;
    //           }
    //           return onClickPlot();
    //         }
    //         widget.onClick(widget);

    //         ACGUTChannel.click(
    //           pageName: StatListPage.kPageName,
    //           eventName: 'feeds_card',
    //           spm: '${StatListPage.kSpmAB}.feeds_card.ph',
    //           parameters: {
    //             'position': widget.index + 1,
    //             'qingid': widget.litePlayId,
    //             'albumid': widget.liteLineId,
    //             'gameid': widget.mixGameId,
    //             'videoid': widget.cardData.video?.liteVideoId ?? "",
    //             'challengeid': widget.cardData?.challenge?.challengeId ?? "-1",
    //             ...trackInfo ?? {},
    //           },
    //         );
    //       },
    //       child: Padding(
    //         padding: EdgeInsets.only(
    //             left: 0,
    //             right: 12,
    //             top: 10),
    //         child: Container(
    //             padding: EdgeInsets.only(bottom: 18),
    //             // decoration: BoxDecoration(
    //             //   border: Border(
    //             //     bottom: BorderSide(
    //             //       width: 1, //宽度
    //             //       color: Color(0xff505050).withOpacity(0.2), //边框颜色
    //             //     ),
    //             //   ),
    //             // ),
    //             child: Column(
    //               children: [
    //                 Container(
    //                   height: 36,
    //                   width: double.infinity,
    //                   child: Stack(
    //                     children: [
    //                       _buildLeftLine(_isPlayed),
    //                       _buildTitle(_newPartGame),
    //                       // Positioned(
    //                       //     top: 5, bottom: 5, right: 0, child: _buildTag()),
    //                     ],
    //                   ),
    //                 ),
    //                 _buildDescription(),
    //                 // _buildChallengeView(),
    //                 _buildVideoArea(widget),
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: [_buildChallengeView(), _buildTag()],
    //                 ),
    //                 // Positioned(
    //                 //     top: 12, bottom: 5, right: 0, child: _buildTag()),
    //               ],
    //             )),
    //       ),
    //     ));

    // child: Padding(
    //     padding: EdgeInsets.only(left: 16, right: 12, top: 10),
    //     child: Column(
    //       children: [
    //         Container(
    //           height: 36,
    //           width: double.infinity,
    //           child: Stack(
    //             children: [
    //               _buildTitle(),
    //               Positioned(top: 5, bottom: 5, right: 0, child: _buildTag()),
    //             ],
    //           ),
    //         ),
    //         _buildDescription(),
    //         _buildVideoArea(widget),
    //       ],
    //     )),
    // );
  }

  void onTapCallback(QwCardCell widget) {
    //3普通卡片
    widget.type == ScenarioType
        ? QWNavigateChannel.open(widget.tagUrl)
        : widget
            .startGame({'type': widget.type, 'litePlayId': widget.litePlayId});
  }

  Widget _buildVideoArea(QwCardCell widget) {
    return widget.type == ScenarioType
        ? Container()
        : Container(
            margin: EdgeInsets.only(top: 12),
            child: Stack(
              children: [
                Container(
                    padding: EdgeInsets.only(left: 12),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(9),
                        child: Container())),
                _buildChallengeTag()
              ],
            ));
  }

  Widget _buildChallengeTag() {
    if (widget.cardData == null || widget.cardData.challenge == null) {
      return Offstage();
    }
    // return QWChallengeTag(
	// 	top:8
	// );
  }
//  //氢玩按钮
//  Widget _buildGameIcon() {
//    return Container(
//      width: 38,
//      height: 54,
//      child: QWGameIcon(
//        icon: Image(
//          image: AssetImage(startGameIcon),
//          width: 38,
//          height: 30,
//        ),
//        text: Text("氢玩",
//            style: TextStyle(
//                fontSize: 12,
//                color: Color(0xffFFaa00),
//                fontWeight: FontWeight.bold)),
//        onPressed: () => {onTapCallback(widget)},
//      ),
//    );
//  }

  // 气泡排队时长
  // Widget _buildACGBubble() {
  // if (widget.isQueue && widget.isInView) {
  //   return Container(
  //       margin: EdgeInsets.only(right: 34, bottom: 4),
  //       child: ACGBubble(
  //         borderRadius: Radius.circular(10),
  //         direction: BubbleDirection.right,
  //         color: Color(0xff000000).withOpacity(0.9),
  //         child: Row(
  //           children: <Widget>[
  //             Text('预计排队',
  //                 style: TextStyle(
  //                     color: Colors.white,
  //                     fontFamily: 'PingFangSC-Regular',
  //                     fontSize: 10.0)),
  //             Text('${formatTime(widget.waitingTime) ?? ''}',
  //           style: TextStyle(
  //                     color: Color(0xffF7B500),
  //                     fontFamily: 'PingFangSC-Regular',
  //                     fontSize: 10.0)),
  //             Text('分钟',
  //                 style: TextStyle(
  //                     color: Colors.white,
  //                     fontFamily: 'PingFangSC-Regular',
  //                     fontSize: 10.0))
  //           ],
  //         ),
  //       ));
  // }
  //   return Container();
  // }

  Widget _buildDescription() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 12),
      child: Text(
        widget.desc ?? "",
        style: TextStyle(
            color: _themeSkinColors.data.textColorLevel2,
            fontSize: 12,
            fontFamily: 'PingFangSC-Regular'),
        maxLines: widget.type == ScenarioType ? 100 : 100,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildChallengeView() {
    if (widget.cardData == null || widget.cardData.challenge == null) {
      return Offstage();
    }
    return QWChallengeEntrance(
      joinedCountText: widget.cardData.challenge.challengeTip,
      bgImageUrl: 'https://gw.alicdn.com/bao/uploaded/TB1Lc2P84z1gK0jSZSgXXavwpXa-1053-108.png',
      mixGameId: widget.mixGameId,
      litePlayId: widget.litePlayId,
      liteLineId: widget.liteLineId,
      challengeId: widget.cardData.challenge.challengeId,
      margin: EdgeInsets.only(left: 12, top: 12),
      trackInfo: trackInfo,
      spmAB: widget.cardData.kPageAB,
      pageName: widget.cardData.kPageName,
    );
  }

  Widget _buildTag() {
    // 3普通卡片
    return widget.type == ScenarioType
        ? GestureDetector(
            onTap: () => onClickPlot(),
            child: _buildTags(widget.tagName ?? "", widget.tagIcon ?? ''))
        : Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.only(left: 14),
				height: 42,
                child: Row(
                  children: [
                    // QWPlayCount(
                    //   playedCountText: widget.playedCountText ?? "",
                    // ),
                    // QWPlayedTag(
                    //     hasPlayed: widget.hasPlayed,
                    //     lastPlayed: widget.lastPlayed),
                  ],
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                //   ACGUTChannel.click(
                //     pageName: StatListPage.kPageName,
                //     eventName: 'feeds_card_comment',
                //     spm: '${StatListPage.kSpmAB}.c1612681552081.d1612681552081',
                //     parameters: {
                //       'gameid': widget.mixGameId,
                //       'qingid': widget.litePlayId,
                //       'videoid': widget.cardData.video?.liteVideoId ?? "",
                //       'albumid': widget.liteLineId,
                //       'position': widget.index + 1,
                //       'challengeid': widget.cardData?.challenge?.challengeId ?? "-1",
                //       ...trackInfo ?? {},
                //     },
                //   );

                //   QWNavigateChannel.open(
                //       "qwcg://flutter?un_flutter=true&flutter_path=/partDetail&"
                //       "mixGameId=${Uri.encodeComponent(widget.mixGameId)}"
                //       "&litePlayId=${widget.litePlayId}"
                //       "&liteLineId=${widget.liteLineId}"
                //       "&tabBarTag=${QWDetailTabBarTag.comment}");
                },
                child: widget.shwoComment
                    ? Container(
                        padding: EdgeInsets.only(left: 14),
						height: 42,
                        child: Row(
                          children: [
                            Image(
                              image: AssetImage(comment_icon),
                              width: 14,
                              height: 12,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Text(widget.commentCountText ?? '评论',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'PingFangSC-Regular',
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12))
                          ],
                        ),
                      )
                    : Offstage(),
              ),
            ],
          );
  }

  Widget _buildTags(tagName, tagIcon) {
    if (tagName == '' && tagName.isEmpty && tagIcon == '' && tagIcon.isEmpty) {
      return Container();
    }
    return Container(
      decoration: BoxDecoration(
        color: _themeSkinColors.data.helpColor1,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.only(
        left: 10.0,
        right: 10.0,
      ),
      child: ACGLayoutFlex(
          flexDirection: row,
          alignItems: flexCenter,
          justifyContent: flexEnd,
          children: <Widget>[
            // ACGCDNImage(defalutTagIcon,
            //     fit: BoxFit.contain,
            //     height: 12,
            //     width: 10,
            //     ossWidth: 10,
            //     ossHeight: 12,
            //     deviceScale: MediaQuery.of(context).devicePixelRatio.toInt()),
            SizedBox(
              width: 3,
            ),
            Text(
              widget.tagName ?? '剧情动画',
              style: TextStyle(
                  color: _themeSkinColors.data.textColor,
                  fontFamily: 'PingFangSC-Regular',
                  fontSize: 12),
            )
          ]),
    );
  }

  Widget _buildLeftLine(bool _isPlayed) {
    // final _isPlayed = widget.lastPlayed == 'true' || widget.hasPlayed == 'true';
    return Positioned(
        top: 10,
        bottom: 10,
        left: 0,
        child: Container(
          width: 2,
          decoration: _isPlayed
              ? BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(2.0),
                      bottomRight: Radius.circular(2.0)),
                  color: widget.brandColorLevel0,
                  boxShadow: [
                      BoxShadow(
                        color: widget.helpColor1,
                        offset: Offset(2, 0.0),
                        blurRadius: 3,
                        // spreadRadius: 0,
                      ),
                    ])
              : BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(2.0),
                      bottomRight: Radius.circular(2.0)),
                  color: widget.textColorLevel3,
                ),
          child: null,
        ));
  }

  Widget _buildTitle(bool newPartGame) {
    return Row(children: [
      newPartGame ? Padding(
        padding: EdgeInsets.only(top: 3, left: 12, right: 6),
        child: SizedBox(
          width: 28,
          height: 12,
          child: Image.asset('lib/assets/image/main_tab_new_tip.png'),
        ),
      ) : Offstage(),
      Expanded(
        child: Container(
          height: 36,
          padding: EdgeInsets.only(left: newPartGame ? 0 : 12),
          alignment: Alignment.centerLeft,
          child: Text(
            widget.title,
            style: TextStyle(
              color: widget.textColorLevel1,
              fontFamily: 'PingFangSC-Semibold',
              fontSize: 16,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      )
    ],);
    // return ACGLayoutFlex(
    //   flexDirection: row,
    //   alignItems: flexCenter,
    //   justifyContent: flexStart,
    //   children: <Widget>[
    //     // 圆圈
    //     // Container(
    //     //     margin: EdgeInsets.only(right: 6),
    //     //     padding: EdgeInsets.all(4),
    //     //     decoration: BoxDecoration(
    //     //         shape: BoxShape.circle,
    //     //         border: Border.all(
    //     //             width: 2,
    //     //             color: Color(widget.hasPlayed == 'true'
    //     //                 ? 0xffFFAA00
    //     //                 : 0xff505050)))),
    //     Container(
    //       width: 180,
    //       child: Text(
    //         widget.title,
    //         style: TextStyle(
    //           color: Color(0xFFE6E6E6),
    //           fontFamily: 'PingFangSC-Semibold',
    //           fontSize: 16,
    //         ),
    //         maxLines: 1,
    //         overflow: TextOverflow.ellipsis,
    //       ),
    //     ),
    //   ],
    // );
  }

  @override
  void didUpdateWidget(QwCardCell oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget:QWCardCell");
    print(widget.isInView);
  }

  //剧情动画点击
  void onClickPlot() {
    if (widget.tagUrl != null && widget.tagUrl.length > 0) {
      return QWNavigateChannel.open(widget.tagUrl);
    } else {
      return QWNavigateChannel.open(
          "qwcg://flutter?un_flutter=true&flutter_path=/scenario&liteLineId=${widget.liteLineId}&mixGameId=${Uri.encodeComponent(widget.mixGameId)}&litePlayId=${widget.litePlayId}&videoUrl=${Uri.encodeComponent(widget.videoUrl)}&title=${Uri.encodeComponent(widget.title)}&desc=${Uri.encodeComponent(widget.desc)}&cardType=${widget.type}&liteVideoId=${widget.cardData.video?.liteVideoId ?? ""}");
    }
  }
}

class QWPlayCount {
}
