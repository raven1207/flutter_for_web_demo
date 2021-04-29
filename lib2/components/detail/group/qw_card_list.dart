// import 'package:acg_flutter_channel/acg_flutter_channel.dart';
import 'package:acggame_paassdk_flutter_plugin/util/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:new_project/components/detail/group/qw_card_cell.dart';
import 'package:new_project/constants/acg_constant.dart';
import 'package:new_project/models/detail/qw_detail_model.dart';
// import 'package:qingwan_flutter_builder/components/detail/group/qw_card_cell.dart';
// import 'package:qingwan_flutter_builder/components/play/qw_player_scene.dart';
// import 'package:qingwan_flutter_builder/constants/acg_constant.dart';
// import 'package:qingwan_flutter_builder/constants/qw_ut.dart';
// import 'package:qingwan_flutter_builder/models/detail/qw_detail_model.dart';
// import 'package:qingwan_flutter_builder/utils/qw_index_utils.dart';

class QwCardList extends StatefulWidget {
  QwCardList(
      {Key key,
      this.index,
      this.indexId,
      this.cardData,
      this.isInView = false,
      this.onClickDetail,
      this.onTapQueue,
      this.isQueue,
      this.waitingTime,
      this.liteLineId,
      this.startGame,
      this.brandColorLevel0,
      this.helpColor1,
      this.textColor,
      this.textColorLevel3,
      this.textColorLevel2,
      this.textColorLevel1})
      : super(key: key);
  final QWDetailDataCardModel cardData;
  final int index;
  final bool isInView;
  final String indexId;
  final GameInfoCallback startGame;
  final Function onClickDetail;
  final Function onTapQueue;
  final bool isQueue;
  final String waitingTime;
  final String liteLineId;
  final Color brandColorLevel0;
  final Color helpColor1;
  final Color textColor;
  final Color textColorLevel3;
  final Color textColorLevel2;
  final Color textColorLevel1;

  @override
  _QwCardListState createState() => _QwCardListState();
}

//卡片列表
class _QwCardListState extends State<QwCardList> {
  EventBus _bug = EventBus();
  @override
  void initState() {
    super.initState();
    _bug.on(COMMENTEVENTTOTAL, _commentEvent);
  }

  _commentEvent(data) {
    String count = data['total'];

    String litePlayId = data['litePlayId'];
    if (widget.cardData.litePlayId == litePlayId) {
      setState(() {
        widget.cardData.commentCount = count;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _bug.off(COMMENTEVENTTOTAL, _commentEvent);
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.cardData;
    final video = item.video;
    final tag = item.tag;
    // if (item.cardType == ChapterType) {
    //   //章节标题
    //   return QwCardTitle(title: item.title ?? '');
    // } else {
    String videoUrl =  '';
    String coverUrl = video?.coverUrl ?? '';
    String commentCount = item.commentCount;
    // String commentCountStr = formatComment(commentCount);
    // ACGLogChannel.tlog(StatListPage.kPageName, '详情页list');
    QWOperatingModel operatingModel = item.operating;
    bool showComment = false;
    if(operatingModel != null){
      showComment = operatingModel.showCommentIcon == '1';
    }
    return QwCardCell(
      brandColorLevel0: widget.brandColorLevel0,
      helpColor1: widget.helpColor1,
      textColor: widget.textColor,
      textColorLevel3: widget.textColorLevel3,
      textColorLevel2: widget.textColorLevel2,
      textColorLevel1: widget.textColorLevel1,
      cardData: widget.cardData,
      liteLineId: widget.liteLineId,
      isQueue: widget.isQueue,
      waitingTime: widget.waitingTime,
      onTapQueue: widget.onTapQueue,
      onClick: widget.onClickDetail,
      gaming: item.gaming,
      mixGameId: item.gaming?.mixGameId ?? '',
      startGame: widget.startGame,
      index: widget.index,
      indexId: widget.indexId,
      type: item.cardType,
      title: item.title,
      hasPlayed: item.hasPlayed,
      lastPlayed: item.lastPlayed,
      isNew: item.isNew,
      desc: item.description,
      playedCountText: item.playedCountText,
      coverUrl: coverUrl,
      videoUrl: videoUrl,
      videoDuration: video?.durationText ?? '',
      tagName: tag?.tagName ?? '',
      tagIcon: tag?.tagIcon ?? '',
      tagUrl: tag?.targetUrl ?? '',
      litePlayId: item.litePlayId ?? '',
      isInView: widget.isInView,
      commentCountText: '',
      shwoComment: showComment
    );
    // }
  }
}
