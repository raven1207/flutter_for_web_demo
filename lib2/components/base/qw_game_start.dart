import 'package:flutter/material.dart';

/// icon text
class QWGameIcon extends StatelessWidget {
  final Text text;
  final Image icon;

  /// icon padding
  final VoidCallback onPressed;

  const QWGameIcon({Key key, this.text, this.icon, @required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          decoration: BoxDecoration(
            color: Color(0X99000000),
            //设置四周圆角 角度
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(19.0),
                topRight: Radius.circular(19.0),
                bottomLeft: Radius.circular(9.0),
                bottomRight: Radius.circular(9.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[icon, text],
          )),
    );
  }
}
