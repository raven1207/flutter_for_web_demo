import 'package:flutter/material.dart';
// import 'package:qingwan_flutter_builder/constants/qw_assets.dart';
import 'package:acg_ui_flutter/acg_ui_flutter.dart';
import 'package:new_project/constants/acg_constant.dart';
import 'package:new_project/constants/qw_assets.dart';
// import 'package:qingwan_flutter_builder/constants/acg_constant.dart';

class QWError extends StatelessWidget {
  const QWError(
      {Key key,
      this.title = '网络出错',
      this.picUrl = defaultBg1,
      this.onPressed,
      this.top})
      : super(key: key);
  final String title;
  final String picUrl;
  final VoidCallback onPressed;
  final top;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ACGLayoutFlex(
        flexDirection: column,
        alignItems: flexCenter,
        justifyContent: flexCenter,
        children: [
          // Image.network(
          //   picUrl ?? defaultBg,
          //   width: 180,
          //   height: 180,
          // ),
          Container(
              margin: EdgeInsets.only(top: top),
              // color: Color(0xff666666),
              child: Image(
                image: AssetImage(defaultBg1),
                width: 180,
                height: 180,
                fit: BoxFit.cover,
              )),
          Container(
            width: 240,
            margin: EdgeInsets.only(top: 18, bottom: 24),
            alignment: Alignment.center,
            child: Text(
              '$title',
              textAlign: TextAlign.center,
              style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Color(0xff808080),
                  fontFamily: 'PingFangSC-Regular',
                  fontSize: 15),
            ),
          ),
          GestureDetector(
            onTap: onPressed,
            child: Container(
              width: 90,
              height: 36,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Color(0xffffffff).withOpacity(0.5), width: 1),
                  borderRadius: BorderRadius.circular(23)),
              child: Text('刷新',
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      color: Color(0xffFFFFFF),
                      fontFamily: 'PingFangSC-Regular',
                      fontSize: 15)),
            ),
          )
        ],
      ),
    );
  }
}
