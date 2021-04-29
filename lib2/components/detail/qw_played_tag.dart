import 'package:flutter/material.dart';
import 'package:acg_flutter_theme/acg_flutter_theme.dart';

const isPlay = 'true';

class QWPlayedTag extends StatelessWidget {
  QWPlayedTag({Key key, this.hasPlayed, this.lastPlayed}) : super(key: key);
  final String hasPlayed;
  final String lastPlayed;
  @override
  Widget build(BuildContext context) {
    final ThemeSkinColors _themeSkinColors = ThemeSkinColors.of(context);
    if (lastPlayed == isPlay || hasPlayed == isPlay) {
      List<Widget> list = [];
      list.add(_buildLine(_themeSkinColors.data));
      list.add(_buildPlayed(hasPlayed, lastPlayed, _themeSkinColors.data));
      return Row(
        children: list,
      );
    }
    return Container();
  }

  Widget _buildPlayed(hasPlayed, lastPlayed, skin) {
    final _lastPlayed = lastPlayed == 'true';
    final title = _lastPlayed ? '玩到这' : '我玩过';
    return Text(
      title,
      style: TextStyle(
          // color: Color(_lastPlayed ? 0xffFFAA00 : 0xffffffff),
          color: _lastPlayed ? skin.brandColorLevel0 : skin.textColorLevel2,
          fontSize: 12,
          fontFamily: 'PingFangSC-Regular',
          fontWeight: _lastPlayed ? FontWeight.bold : FontWeight.normal),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildLine(skin) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: Text(
        '|',
        style: TextStyle(
            color: skin.textColorLevel2,
            fontSize: 12,
            fontFamily: 'PingFangSC-Regular'),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
