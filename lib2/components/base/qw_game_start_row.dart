import 'package:fish_lottie/fish_lottie.dart';
import 'package:flutter/material.dart';
import 'package:new_project/constants/qw_assets.dart';
// import 'package:qingwan_flutter_builder/constants/qw_assets.dart';
// import 'package:qingwan_flutter_builder/service/qw_game_dispatch_service.dart';

/// icon text
class QWGameIconV2 extends StatefulWidget {
  int status = 0;
  // true 是挑战赛
  bool isChallenge;
  _QWGameIconV2 _QWGameIconV2_;

  QWGameIconV2({this.status = 0, this.isChallenge = false});

  @override
  State<StatefulWidget> createState() {
    if (_QWGameIconV2_ == null) {
      _QWGameIconV2_ = _QWGameIconV2();
    }
    return _QWGameIconV2_;
  }

  updateStatus(int status) {
    if (this.status == status) {
      return;
    }
    if (_QWGameIconV2_ != null) {
      _QWGameIconV2_.setState(() {
        this.status = status;
      });
    } else {
      this.status = status;
    }
  }
}

class _QWGameIconV2 extends State<QWGameIconV2>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  bool isDispose = false;

  @override
  Widget build(BuildContext context) {
    if (widget.status == 0) {
      return _buildDef();
    } else {
      return _buildLottie();
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (widget.status == 1) {
          widget.updateStatus(2);
        } else if (widget.status == 4) {
          widget.updateStatus(5);
        }
      }
    });
  }

  @override
  void dispose() {
    isDispose = true;
    _controller.dispose();
    super.dispose();
  }

  _buildDef() {
    return Image(
      image: AssetImage(startGameIcon),
      width: 80,
      height: 80,
    );
  }

  GlobalKey _globalKey1 = GlobalKey();
  GlobalKey _globalKey2 = GlobalKey();
  GlobalKey _globalKey3 = GlobalKey();
  GlobalKey _globalKey4 = GlobalKey();
  GlobalKey _globalKey5 = GlobalKey();
  GlobalKey _globalKey6 = GlobalKey();
  bool offstage = false;
  _hideState2() {
    ///延迟隐藏播放中图片，临时解决图片切换时闪烁问题
    Future.delayed(Duration(milliseconds: 300), () {
      if(isDispose){
        return;
      }
      if(offstage == false){
        setState(() {
          offstage = true;
        });
      }

    });
  }

  _buildLottie() {
    String lottieUri = "";
    GlobalKey curKey = null;
    bool loop = false;
    //1、从未播放变成播放，1次 start_state1
    //2、视频播放中，静态图 。
    //3、排队中，循环：start_state2
    //4、排队中到加载中或者播放中到家在中，1次 start_state3， 循环 start_state4
    //5、即将进入，循环 start_state5
    print("============ status=${widget.status}");
    if (widget.status == 1) {
      //从未播放变成播放
      curKey = _globalKey1;
      lottieUri = start_state1;
    } else if (widget.status == 2) {
      if(widget.isChallenge){
        offstage = true;
        loop = true;
        curKey = _globalKey6;
        lottieUri = start_state_challenge;
        _hideState2();
      } else {
        // 视频播放中，静态图
        offstage = false;
        return Image.asset("lib/assets/image/start_state0.png",
            width: 80, height: 80);
      }
    } else if (widget.status == 3) {
      //排队中
      loop = true;
      curKey = _globalKey2;
      lottieUri = start_state2;
      _hideState2();
    } else if (widget.status == 4) {
      //排队中到加载中或者播放中到家在中
      curKey = _globalKey3;
      lottieUri = start_state3;
      _hideState2();
    } else if (widget.status == 5) {
      curKey = _globalKey4;
      lottieUri = start_state4;
      loop = true;
      _hideState2();
    } else if (widget.status == 6) {
      curKey = _globalKey5;
      lottieUri = start_state5;
      loop = true;
    }
    return Stack(
      children: [
        Offstage(
          offstage: offstage,
          child: Image.asset("lib/assets/image/start_state0.png",
              width: 80, height: 80),
        ),
        LottieAnimationView.fromAsset(
          lottieUri,
          key: curKey,
          animationController: _controller,
          width: 80,
          height: 80,
          fit: BoxFit.fill,
          alignment: Alignment.center,
          autoPlay: true,
          loop: loop,
          reverse: false,
        )
      ],
    );
  }
}
