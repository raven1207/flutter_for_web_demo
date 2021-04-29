import 'package:flutter/material.dart';

/// icon text
class QWRoundButton extends StatelessWidget {
  final String iconPath;
  final double size;

  /// icon padding
  final VoidCallback onPressed;
  final bool hasBackground;

  const QWRoundButton(
      {Key key,
      this.iconPath,
      this.size,
      this.hasBackground = true,
      @required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: Color(0X99000000),
            //设置四周圆角 角度
            borderRadius: BorderRadius.all(Radius.circular(size / 2)),
          ),
          child: Center(
            child: Image(
              image: AssetImage(iconPath),
              width: hasBackground ? 15 : size,
              height: hasBackground ? 15 : size,
            ),
// text],
          ),
        ));
  }
}
