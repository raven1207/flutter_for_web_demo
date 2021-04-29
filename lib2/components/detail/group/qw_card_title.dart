import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:acg_ui_flutter/acg_ui_flutter.dart';

class QwCardTitle extends StatelessWidget {
  QwCardTitle({
    Key key,
    this.title,
  }) : super(key: key);
  String title;
  @override
  Widget build(BuildContext context) {
    return ACGLayoutFlex(
        height: 36,
        alignItems: 'center',
        justifyContent: 'flex-start',
        children: <Widget>[
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: 'PingFangSC-Semibold',
                  color: Color(0xFFFFFFFF),
                  fontSize: 14,
                  // fontWeight: FontWeight.bold
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )),
        ]);
  }
}
