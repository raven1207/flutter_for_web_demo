import 'package:acg_ui_flutter/utils/acg_utils_index.dart';
import 'package:flutter/material.dart';
import 'package:acg_ui_flutter/acg_ui_flutter.dart';
import 'package:new_project/constants/acg_constant.dart';
import 'package:new_project/constants/qw_font.dart';
// import 'package:acg_flutter_component/acg_flutter_component.dart';
// import 'package:qingwan_flutter_builder/constants/acg_constant.dart';
// import 'package:qingwan_flutter_builder/constants/qw_font.dart';
// import 'package:qingwan_flutter_builder/utils/qw_index_utils.dart';

class QWGamePublisher extends StatelessWidget {
  QWGamePublisher({Key key, this.picUrl, this.nickName, this.dateTime})
      : super(key: key);
  final String picUrl;
  final String nickName;
  final String dateTime;
  @override
  Widget build(BuildContext context) {
    return ACGLayoutFlex(
      flexDirection: row,
      alignItems: flexCenter,
      justifyContent: flexStart,
      children: <Widget>[
        _buildHeader(context),
        _buildInfo(),
      ],
    );
  }

  //头像
  Widget _buildHeader(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 11),
      decoration: BoxDecoration(
        color: Color(0xff76CFFF),
        borderRadius: BorderRadius.circular(36),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(36),
        // child: ACGCDNImage(picUrl,
        //   fit: BoxFit.cover,
        //   width: 36,
        //   height: 36,
        //   ossWidth: 36,
        //   ossHeight: 36,
        //   deviceScale: MediaQuery.of(context).devicePixelRatio.toInt())
      ),
    );
  }

  //用户名
  Widget _buildInfo() {
    return ACGLayoutFlex(
      flexDirection: column,
      alignItems: flexStart,
      justifyContent: flexCenter,
      children: <Widget>[
        Container(
          width: 160,
          child: Text(
            breakWord(nickName ?? ''),
            style: TextStyle(
                color: Color(0xffE6E6E6),
                fontFamily: kPingFangRegular,
                fontSize: 14),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Text(breakWord(dateTime ?? ''),
            style: TextStyle(
                color: Color(0xff808080),
                fontFamily: kPingFangRegular,
                fontSize: 12))
      ],
    );
  }
}
