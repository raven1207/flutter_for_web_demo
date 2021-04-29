import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:new_project/utils/qw_index_utils.dart';
// import 'package:qingwan_flutter_builder/utils/qw_index_utils.dart';

class QWGameInfo extends StatelessWidget {
  QWGameInfo(
      {Key key,
      this.picUrl,
      this.title,
      this.playedCount,
      this.cardNum,
      this.duration})
      : super(key: key);

  final String picUrl;
  final String title;
  final String playedCount;
  final String cardNum;
  final String duration;

  @override
  Widget build(BuildContext context) {
    if (title == null) {
      return Container();
    }

    return Container(
      margin: EdgeInsets.only(top: 50, left: 12, bottom: 12, right: 12),
      height: 90,
      child: Row(
        children: <Widget>[
          _buildIcon(),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                      _buildTitle(),
                      SizedBox(height: 3),
                      _buildSubtitle(),
                    ])),
                _buildPlayCount(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIcon() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffD8D8D8),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          picUrl ?? '',
          fit: BoxFit.contain,
          width: 90,
          height: 90,
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      title ?? '',
      style: TextStyle(
        fontFamily: 'PingFangSC-Semibold',
        color: Color.fromRGBO(255, 255, 255, 0.90),
        fontSize: 21,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildSubtitle() {
    int s = int.parse(duration ?? '0');
    final _duration = s / 60;
    return RichText(
        text: TextSpan(
            text: '$cardNum个片段 | 预计',
            style: TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontFamily: 'PingFangSC-Regular'),
            children: <TextSpan>[
              TextSpan(
                  text: '${_duration.toInt()}分钟',
                  style: TextStyle(fontSize: 12, color: Color(0xffFFAA00))),
              TextSpan(
                  text: '通过',
                  style: TextStyle(fontSize: 12, color: Colors.white)),
            ]),
        textAlign: TextAlign.center);
  }

  Widget _buildPlayCount() {
    int count = int.parse(playedCount);
    return Text(
      '${formatNumber(count)}人玩过',
      style: TextStyle(
        fontFamily: 'PingFangSC-Regular',
        color: Color(0xFFFFFFFF),
        fontSize: 12,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
