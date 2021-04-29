import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:qingwan_flutter_builder/constants/acg_constant.dart';
// import 'package:qingwan_flutter_builder/constants/qw_font.dart';
// import 'package:qingwan_flutter_builder/utils/qw_index_utils.dart';
import 'package:acg_ui_flutter/acg_ui_flutter.dart';
// import 'package:qingwan_flutter_builder/constants/qw_assets.dart';
// import 'package:qingwan_flutter_builder/components/detail/part/qw_play_count.dart';
import 'package:acg_flutter_theme/acg_flutter_theme.dart';
import 'package:new_project/constants/acg_constant.dart';
import 'package:new_project/constants/qw_font.dart';
import 'package:new_project/utils/qw_index_utils.dart';
// import 'package:acg_flutter_component/acg_flutter_component.dart';

class QWDetailInfo extends StatelessWidget {
  QWDetailInfo({
    Key key,
    this.picUrl,
    this.title,
    this.playedCountText,
    this.cardNum,
    this.duration,
  }) : super(key: key);

  final String picUrl;
  final String title;
  final String playedCountText;
  final String cardNum;
  final String duration;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        // ACGCDNImage(
        //   picUrl ?? defaultBg,
        //   fit: BoxFit.cover,
        //   height: 184,
        //   width: _width,
        //   ossWidth: _width.toInt(),
        //   ossHeight: 184,
        //   deviceScale: MediaQuery.of(context).devicePixelRatio.toInt()
        // ),
        Positioned(
            bottom: 0,
            left: 0,
            child: Container(
                color: Color(0xff000000).withOpacity(0.5),
                width: _width,
                height: 184,
                child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 18, horizontal: 18),
                    child: ACGLayoutFlex(
                      flexDirection: column,
                      alignItems: flexStart,
                      justifyContent: flexEnd,
                      children: [_buildTitle(), _buildSubTitle(context)],
                    ))))
      ],
    );
  }

  Widget _buildTitle() {
    return Text(
      title ?? "",
      style: TextStyle(
          color: Color(0xffFFFFFF).withOpacity(0.8),
          fontFamily: kPingFangSemibold,
          fontSize: 21),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildSubTitle(BuildContext context) {
    ThemeSkinColors themeSkinColors = ThemeSkinColors.of(context);
    Color textColorLevel1 = themeSkinColors.data.textColorLevel1;
    TextStyle _style = TextStyle(
        color: textColorLevel1, fontFamily: kPingFangRegular, fontSize: 12);
    // int count = int.parse(playedCount);
    return Padding(
        padding: EdgeInsets.only(top: 3),
        child: ACGLayoutFlex(
          flexDirection: row,
          alignItems: flexCenter,
          justifyContent: flexStart,
          children: [
            Text(
              '${cardNum ?? '0'}个片段',
              style: _style,
            ),
            _buildLine(_style),
            Text(
              '预计${formatTime(duration)}分钟通关',
              style: _style,
            ),
            _buildLine(_style),
            // QWPlayCount(
            //     playedCountText: playedCountText,
            //     opacity: 0.9,
            //     textColor: textColorLevel1),
          ],
        ));
  }

  //竖杠
  Widget _buildLine(TextStyle _style) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 4),
        child: Text('|', style: _style));
  }
}
