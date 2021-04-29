import 'package:flutter/material.dart';
// import 'package:qingwan_flutter_builder/constants/qw_font.dart';
import 'package:acg_ui_flutter/acg_ui_flutter.dart';
import 'package:new_project/constants/qw_font.dart';

class QWAppBar extends StatelessWidget {
  QWAppBar({
    Key key,
    this.title,
    this.onBack,
    this.scrollController,
  }) : super(key: key);

  final GestureTapCallback onBack;
  final String title;
  ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return ACGAppBarFadeIn(
        onBack: onBack,
        children: <Widget>[_buildTitle(context)],
        scrollController: scrollController);
  }

  Widget _buildTitle(BuildContext context) {
    return Container(
      width: 240,
      padding: EdgeInsets.only(left: 12),
      child: Text(
        title ?? '',
        style: TextStyle(
          fontFamily: kPingFangSemibold,
          color: Color.fromRGBO(255, 255, 255, 0.90),
          fontSize: 18,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
