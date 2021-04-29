//import 'package:acg_flutter_component/acg_flutter_component.dart';
// import 'package:qingwan_flutter_builder/models/detail/qw_detail_model.dart';
//import 'package:qingwan_flutter_builder/components/qw_cdn_image.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

//isExpandable 是否展示""展开""按钮；
//maxLines: 最大行数
class QWGameDesc extends StatefulWidget {
  QWGameDesc(
      {Key key,
      this.data,
      this.canExpand = true,
      this.maxLines = 2,
      this.custStyle})
      : super(key: key) {
    if (custStyle == null) {
      custStyle = TextStyle(
          fontSize: 12,
          fontFamily: 'PingFangSC-Regular',
          color: Color(0xFF999999));
      // color: Colors.red);
    }
  }

  final String data;
  final bool canExpand;
  final int maxLines;
  TextStyle custStyle;

  @override
  _QWGameDescState createState() => _QWGameDescState(false);
}

class _QWGameDescState extends State<QWGameDesc> {
  bool isExpanding;
  final double PADDING = 10.0;

  _QWGameDescState(bool isExpanding) {
    this.isExpanding = isExpanding;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, size) {
      final span = TextSpan(text: widget.data ?? '', style: widget.custStyle);
      final tp = TextPainter(
          text: span,
          maxLines: widget.maxLines,
          textDirection: TextDirection.ltr);
      tp.layout(maxWidth: size.maxWidth - PADDING * 2);

      if (widget.canExpand && tp.didExceedMaxLines) {
        return Stack(
          alignment: AlignmentDirectional.topStart,
          children: <Widget>[
            isExpanding
                ? _buildTitle(widget.data, 0, widget.custStyle)
                : _buildTitle(widget.data, widget.maxLines, widget.custStyle),
            Positioned(
              right: 10,
              bottom: 12,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  setState(() {
                    isExpanding = !isExpanding;
                  });
                },
                child: Container(
                  padding: EdgeInsets.only(left: 10),
                  margin: EdgeInsets.only(top: 6),
                  color: Color(0xff1F1F1F),
                  child: Text(isExpanding ? '收起' : '查看全部',
                      style: TextStyle(
                          fontFamily: 'PingFangSC-Semibold',
                          fontSize: widget.custStyle != null
                              ? widget.custStyle.fontSize
                              : null,
                          color: Color(0xff999999))),
                ),
              ),
            )
          ],
        );
      } else {
        return _buildTitle(widget.data ?? '', 0, widget.custStyle);
      }
    });
  }

  Widget _buildTitle(String data, int maxLines, TextStyle custStyle) {
    if (maxLines > 0) {
      return Container(
          margin: EdgeInsets.only(bottom: 12),
          padding: EdgeInsets.only(left: PADDING, right: PADDING),
          child: Text(data ?? '',
              maxLines: maxLines,
              overflow: TextOverflow.ellipsis,
              style: custStyle));
    }
    return Container(
        margin: EdgeInsets.only(bottom: 12),
        padding: EdgeInsets.only(left: PADDING, right: PADDING),
        child: Text(data ?? '', style: custStyle));
  }
}
