import 'package:flutter/material.dart';
import 'package:new_project/constants/qw_assets.dart';
// import 'package:qingwan_flutter_builder/constants/qw_assets.dart';

class QWDetailTitleBar extends StatelessWidget {
  QWDetailTitleBar(
      {Key key,
      this.textStyle,
      this.titleTextStyle,
      this.title,
      this.linkUrl = true,
      this.onClickDetail,
      this.padding,
      this.subTitle = '详情'})
      : super(key: key);
  final TextStyle textStyle;
  final TextStyle titleTextStyle;
  final String title;
  final String subTitle;
  final Function onClickDetail;
  final EdgeInsets padding;
  final bool linkUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      width: double.infinity,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(right: 80),
            child: Text(
              title ?? '',
              style: titleTextStyle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          linkUrl
              ? Positioned(
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: GestureDetector(
                    onTap: onClickDetail,
                    child: Row(
                      children: [
                        Text(subTitle ?? '', style: textStyle),
                        Image(
                          image: AssetImage(allIcon),
                          width: 12,
                          height: 12,
                        )
                      ],
                    ),
                  ))
              : Container()
        ],
      ),
    );
  }
}
