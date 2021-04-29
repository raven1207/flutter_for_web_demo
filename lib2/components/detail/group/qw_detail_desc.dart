// import 'package:acg_flutter_channel/acg_flutter_channel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:qingwan_flutter_builder/components/detail/qw_game_publisher.dart';
// import 'package:qingwan_flutter_builder/constants/acg_constant.dart';
// import 'package:qingwan_flutter_builder/constants/qw_font.dart';
// import 'package:qingwan_flutter_builder/constants/qw_ut.dart';
import 'package:acg_ui_flutter/acg_ui_flutter.dart';
import 'package:new_project/constants/acg_constant.dart';
import 'package:new_project/constants/qw_font.dart';

import '../qw_game_publisher.dart';
// import 'package:qingwan_flutter_builder/constants/qw_assets.dart';

class QWDetailDesc extends StatefulWidget {
  QWDetailDesc(
      {Key key,
      this.picUrl,
      this.nickName,
      this.dateTime,
      this.subTitle,
      this.mixGameId,
      this.liteLineId})
      : super(key: key);

  final String picUrl;
  final String nickName;
  final String dateTime;
  final String subTitle;
  final String mixGameId;
  final String liteLineId;

  @override
  _QWDetailDescState createState() => _QWDetailDescState();
}

class _QWDetailDescState extends State<QWDetailDesc> {
  bool isExpanding = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12),
      padding: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1, //宽度
            color: Color(0xff505050).withOpacity(0.2), //边框颜色
          ),
        ),
      ),
      child: ACGLayoutFlex(
        flexDirection: column,
        alignItems: flexStart,
        justifyContent: flexStart,
        children: <Widget>[_buildTitle(), _buildSubTitle()],
      ),
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: ACGLayoutFlex(
        flexDirection: row,
        alignItems: flexCenter,
        justifyContent: spaceBetween,
        children: <Widget>[
          QWGamePublisher(
              picUrl: widget.picUrl, nickName: widget.nickName, dateTime: widget.dateTime),
          GestureDetector(
              onTap: () {
                setState(() {
                  isExpanding = !isExpanding;
                });
                // ACGUTChannel.click(
                //     pageName: StatListPage.kPageName,
                //     eventName: 'list_detail',
                //     spm: '${StatListPage.kSpmAB}.list_detail.ph',
                //     parameters: {'gameid': widget.mixGameId, 'albumid': widget.liteLineId});
              },
              child: _buildDetailAllBtn()),
        ],
      ),
    );
  }

  Widget _buildDetailAllBtn() {
    if (widget.subTitle == null || widget.subTitle.length < 50) {
      return Container();
    }
    return Row(
      children: [
        Text('合集详情',
            style: TextStyle(color: Color(0xff808080), fontFamily: kPingFangRegular, fontSize: 12)),
        // Image(
        //   image: AssetImage(downIcon),
        //   width: 18,
        //   height: 18,
        // ),
        Icon(
          isExpanding ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
          color: Color(0xff808080),
          size: 20,
        )
      ],
    );
  }

  Widget _buildSubTitle() {
    // if (isExpanding) {
    return Container(
      margin: EdgeInsets.only(top: 6),
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Text(widget.subTitle ?? "",
          maxLines: isExpanding ? 100 : 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontFamily: kPingFangRegular, fontSize: 12, color: Color(0xff808080))),
    );
    // }
    // return Container();
  }
}
