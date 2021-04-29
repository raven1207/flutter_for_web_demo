import 'package:acg_flutter_theme/acg_flutter_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:new_project/components/base/qw_no_data.dart';
import 'package:new_project/components/detail/group/qw_card_list.dart';
import 'package:new_project/components/detail/group/qw_detail_desc.dart';
import 'package:new_project/components/detail/group/qw_detail_info.dart';
import 'package:new_project/components/detail/qw_app_bar.dart';
import 'package:new_project/components/detail/qw_card_end.dart';
// import 'package:new_project/components/play/autoplay/inview_notifier_list.dart';
// import 'package:new_project/components/play/qw_page_player_behavior.dart';
// import 'package:new_project/components/play/scroll/qw_scroll_binder.dart';
import 'package:new_project/constants/qw_cart_type.dart';
import 'package:new_project/constants/qw_font.dart';
import 'package:new_project/constants/qw_language.dart';
// import 'package:new_project/constants/qw_ut.dart';
import 'package:new_project/models/detail/qw_detail_model.dart';
import 'package:new_project/models/detail/qw_detail_queue_model.dart';
import 'package:new_project/service/qw_detail_request.dart';
import 'package:new_project/utils/qw_auto_orientation.dart';
import 'package:new_project/utils/qw_index_utils.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

const qingwanDetail = 'qingwanDetail';

const pageLoad = 'pageLoad';

class QWDetailPage extends StatefulWidget {
  QWDetailPage({Key key, this.mixGameId, this.liteLineId, this.previewTicket})
      : super(key: key);

  final String mixGameId;
  final String liteLineId;
  final String previewTicket;

  @override
  _QWDetailPageState createState() => _QWDetailPageState();
}

class _QWDetailPageState extends State<QWDetailPage>
    {
  _QWDetailPageState() {
  }
  int startLoadingTime = 0;
  QWDetailDataModel _qwDetailModel;
  QWDetailDataCardModel card;
  QWDetailDataCardVideoModel video;
  QWDetailDataCardTagModel tag;
  bool _isLoading = false;
  String resStatus = isLoading;
  bool isQueue = false;
  String waitingTime;
  List listData = [];
  String _errorText = '';
  // var _mixGameId = 'OkA1XzNBMUgkYA==';
  // var _mixGameId = 'M0A2XzNBMUgkYA==';
  // var _liteLineId = '1';
  //滚动监听
  ScrollController _controller = new ScrollController();
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  bool _registerDetailLoading = false;

  @override
  Widget build(BuildContext context) {
    Widget content;
    final ThemeSkinColors _themeSkinColors = ThemeSkinColors.of(context);

    if (resStatus != null) {
      content = QWNoData(
          status: resStatus,
          title: _errorText,
          onPressed: () {
            setState(() {
              resStatus = isLoading;
              getNewsList(false);
            });
          });
    } else {
      //   ACGMonitorChannel.commit({
      //     "module": qingwanDetail,
      //     "monitorPoint": pageLoad,
      //     "dimensions": {
      //       "title": 'render_build',
      //       "time": (DateTime.now().millisecondsSinceEpoch - startLoadingTime)
      //     }
      //   });
      content = _buildCardPanel();
    }

    return Scaffold(
        backgroundColor: _themeSkinColors.data.pageBackgroundColor,
        body: Container(
          child: SafeArea(
            top: false,
            child: Container(
              child: content,
            ),
          ),
        ));
  }

  @override
  void initState() {
    registerLoadingMonitor(_registerDetailLoading, qingwanDetail, pageLoad);
    _registerDetailLoading = false;
    // ACGMonitorChannel.commit({
    //   "module": qingwanDetail,
    //   "monitorPoint": pageLoad,
    //   "dimensions": {
    //     "title": "page_enter",
    //     "time": (DateTime.now().millisecondsSinceEpoch - startLoadingTime)
    //   }
    // });
    super.initState();
    getNewsList(false);
    // initScrollBinder(-1);
    QWAutoOrientation.portraitUpMode();
    resetAppbarLightStyle();
    // ACGUTChannel.setPage(
    //     pageName: StatListPage.kPageName,
    //     spm: StatListPage.kSpmAB,
    //     spmA: StatListPage.kSpmA,
    //     spmB: StatListPage.kSpmB,
    //     parameters: {'gameid': widget.mixGameId, 'albumid': widget.liteLineId});

    // ACGLogChannel.tlog(StatListPage.kPageName, '页面渲染成功');
  }

  Widget _buildCardPanel() {
    Widget _listView;

    if (listData == null) {
      _listView = QWNoData(status: isEmptyData);
    } else {
      //   ACGMonitorChannel.commit({
      //     "module": qingwanDetail,
      //     "monitorPoint": pageLoad,
      //     "dimensions": {
      //       "title": "render_components_buildCardPanel",
      //       "time": (DateTime.now().millisecondsSinceEpoch - startLoadingTime)
      //     }
      //   });
      _listView = Stack(
        children: <Widget>[
          _listViewContent(),
          _buildAppBar(),
        ],
      );
    }

    return _listView;
  }

  Widget _getListViewBuilder() {
    return ListView.builder(
      itemCount: listData.length,
      controller: _controller,
      itemBuilder: (BuildContext context, int index) {
        return _getItem(context, index, true);
      },
    );
  }

  String _generateIndexKey(int index) {
    card = listData[index];
    if (card.cardType == CELL_TYPE_INFO ||
        card.cardType == CELL_TYPE_DESC ||
        card.cardType == CELL_TYPE_END ||
        index == (listData.length - 1)) {
      return '${index}_pictext';
    }

    if (card.cardType == ScenarioType) {
      return '${index}_pictext';
    }

    return '${index}_playable';
  }

  Widget _listViewContent() {
    return Container();
  }

  Widget _getItem(BuildContext context, int index, bool isInView) {
    card = listData[index];
    card.kPageAB = '';
    card.kPageName = '';
    video = card?.video ?? null;
    tag = card?.tag ?? null;
    // return Text('${card.cardType}',
    //     style: TextStyle(color: Colors.white));
    if (card.cardType == CELL_TYPE_INFO) {
      // demo测试
      // return QWGameInfo(
      //   picUrl: _qwDetailModel.picUrl,
      //   title: _qwDetailModel.liteLineTitle,
      //   playedCount: _qwDetailModel.playedCount,
      //   cardNum: _qwDetailModel.liteLineCardNum,
      //   duration: _qwDetailModel.expectedDuration,
      // );
      return QWDetailInfo(
        picUrl: _qwDetailModel.headerUrl,
        title: _qwDetailModel.liteLineTitle,
        playedCountText: _qwDetailModel.playedCountText,
        cardNum: _qwDetailModel.liteLineCardNum,
        duration: _qwDetailModel.expectedDuration,
      );
    }
    if (card.cardType == CELL_TYPE_DESC) {
      //demo测试
      // return QWGameDesc(
      //     maxLines: 2,
      //     canExpand: true,
      //     data: _qwDetailModel.liteLineDescription);

      return QWDetailDesc(
          subTitle: _qwDetailModel.liteLineDescription,
          picUrl: _qwDetailModel.createUser?.avatar ?? '',
          nickName: _qwDetailModel.createUser?.nickName ?? '',
          mixGameId: widget.mixGameId,
          liteLineId: widget.liteLineId,
          dateTime: _qwDetailModel.publishTimeText ?? '');
    }
    if (card.cardType == CELL_TYPE_NO_DATA) {
      return QWNoData(
          status: isEmptyData,
          top: 100.0,
          onPressed: () {
            setState(() {
              resStatus = isLoading;
              getNewsList(false);
            });
          });
    }
    if (card.cardType == CELL_TYPE_END) {
      return QWCardEnd(fontFamily: kPingFangRegular);
    } else {
      //   ACGLogChannel.tlog(StatListPage.kPageName, '详情页列表');
      return QwCardList(
          brandColorLevel0: ThemeSkinColors.of(context).data.brandColorLevel0,
          helpColor1: ThemeSkinColors.of(context).data.helpColor1,
          textColor: ThemeSkinColors.of(context).data.textColor,
          textColorLevel3: ThemeSkinColors.of(context).data.textColorLevel3,
          textColorLevel2: ThemeSkinColors.of(context).data.textColorLevel2,
          textColorLevel1: ThemeSkinColors.of(context).data.textColorLevel1,
          onClickDetail: onPartDetail,
          liteLineId: widget.liteLineId,
          isQueue: isQueue,
          waitingTime: waitingTime,
          onTapQueue: onTapQueue,
          startGame: _startGame,
          cardData: card,
          index: index,
          indexId: _generateIndexKey(index),
          isInView: true);
    }
  }

  Widget _buildAppBar() {
    if (_qwDetailModel == null) {
      return Container();
    }

    return QWAppBar(
      title: _qwDetailModel.liteLineTitle,
      onBack: () => {},
      scrollController: _controller,
    );
  }

  void _setDetailModel(Map<String, dynamic> jsonValue) {
    if (jsonValue != null && jsonValue['data'] != null) {
      if (mounted) {
        final qwDetailModel = QWDetailModel.fromJson(jsonValue);
        if (qwDetailModel != null && qwDetailModel.data != null) {
          _qwDetailModel = qwDetailModel.data;
          listData.add(
              QWDetailDataCardModel.fromJson({'cardType': CELL_TYPE_INFO}));
          listData.add(
              QWDetailDataCardModel.fromJson({'cardType': CELL_TYPE_DESC}));
          if (_qwDetailModel.cardList == null ||
              _qwDetailModel.cardList.isEmpty ||
              _qwDetailModel.cardList.length == 0) {
            listData.add(QWDetailDataCardModel.fromJson(
                {'cardType': CELL_TYPE_NO_DATA}));
          } else {
            listData.addAll(_qwDetailModel.cardList);
            listData.add(
                QWDetailDataCardModel.fromJson({'cardType': CELL_TYPE_END}));
          }
          if (widget.previewTicket != null && listData != null) {
            for (int i = 0; i < listData.length; i++) {
              listData[i]?.gaming?.playType = 'LITE_LINE_PREVIEW';
            }
          }
          setState(() {
            resStatus = null;
            // ACGMonitorChannel.commit({
            //   "module": qingwanDetail,
            //   "monitorPoint": pageLoad,
            //   "dimensions": {
            //     "title": "data_process",
            //     "time":
            //         (DateTime.now().millisecondsSinceEpoch - startLoadingTime)
            //   }
            // });
          });
        } else {
          setState(() {
            resStatus = isEmptyData;
          });
        }
      }
    } else {
      setState(() {
        resStatus = isEmptyData;
      });
    }
  }

  //  请求数据
  void getNewsList(bool isLoadMore) async {
    // final prefs = await _prefs;
    Map<String, String> params = new Map();
    // params['page.page'] = "$curPage";
    // params['page.size'] = "$DEFAULT_REQUEST_NUM";
    // params['mixGameId'] = widget.mixGameId;
    // params['liteLineId'] = widget.liteLineId;
    params['mixGameId'] = widget.mixGameId;
    params['liteLineId'] = widget.liteLineId;
    params['previewTicket'] = widget.previewTicket;
    if (_isLoading) {
      return;
    }
    _isLoading = true;
    resStatus = isLoading;
    _errorText = '';
    // ACGMonitorChannel.commit({
    //   "module": qingwanDetail,
    //   "monitorPoint": pageLoad,
    //   "dimensions": {
    //     "title": "data_request_start",
    //     "time": (DateTime.now().millisecondsSinceEpoch - startLoadingTime)
    //   }
    // });
    getReceiveDetail(params).then((json) {
      _isLoading = false;
      //   ACGMonitorChannel.commit({
      //     "module": qingwanDetail,
      //     "monitorPoint": pageLoad,
      //     "dimensions": {
      //       "title": "data_request_success",
      //       "time": (DateTime.now().millisecondsSinceEpoch - startLoadingTime)
      //     }
      //   });
      if (json != null && json['data'] != null) {
        _setDetailModel(json);
        // ACGLogChannel.tlog(StatListPage.kPageName, '请求成功');
      } else {
        _onError();
      }
    }, onError: (err) {
      _isLoading = false;
      String errorText = err.toString();
      if (errorText.contains('NETWORK_ERROR')) {
        _errorText = "网络异常";
      }
      _onError();
    }).catchError((err) => _onError());
  }

  void _onError() {
    setState(() {
      resStatus = _errorText == '网络异常' ? 'isNotNetWork' : isError;
    });

    // ACGLogChannel.tlog(StatListPage.kPageName, '请求异常');
  }

  @override
  void dispose() {
    try {
      _controller.dispose();
    } catch (e) {
      print('QwDetailPage:dispose $e');
    }
    super.dispose();
  }

  void _startGame(Map gameInfo) {
    //TODO:内部逻辑会启动游戏，代码待移除
  }

  //跳转片段详情页
  void onPartDetail(item) {
    // 0122版本去掉卡片点击跳转详情页
    // QWNavigateChannel.open(
    //     "qwcg://flutter?un_flutter=true&flutter_path=/partDetail" +
    //         "&mixGameId=${item.mixGameId}&liteLineId=${widget.liteLineId}&litePlayId=${item.litePlayId}");
  }

  //调用预计排队接口
  void onTapQueue(Map item) async {
    Map<String, String> params = new Map();
    params['mixGameId'] = item['mixGameId'] ?? '';
    params['litePlayId'] = item['litePlayId'] ?? '';
    params['liteLineId'] = widget.liteLineId;
   
  }
}
