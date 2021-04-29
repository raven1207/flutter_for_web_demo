import 'package:flutter/material.dart';
import 'package:acg_flutter_theme/acg_flutter_theme.dart';

class QWCardEnd extends StatelessWidget {
  QWCardEnd(
      {Key key,
      this.fontFamily,
      this.bottom = 61.0,
      this.title = '↑↑好玩的都在上面了↑↑'})
      : super(key: key);
  final String fontFamily;
  final double bottom;
  final String title;

  @override
  Widget build(BuildContext context) {
    return _buildEnd(context);
  }

  Widget _buildEnd(BuildContext context) {
    final ThemeSkinColors _ThemeSkinColors = ThemeSkinColors.of(context);
    return Container(
        margin: EdgeInsets.only(top: 24, bottom: bottom),
        child: Center(
          child: Text(title,
              style: TextStyle(
                  fontSize: 12,
                  color: _ThemeSkinColors.data.textColorLevel3,
                  fontFamily: fontFamily)),
        ));
  }
}
