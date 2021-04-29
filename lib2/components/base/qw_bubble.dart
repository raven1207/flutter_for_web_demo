// 气泡组件
// created by xiao
//created at 2020-11-09
import 'package:flutter/material.dart';

const _defaultArrowWidth = 6.0; //箭头宽度
const _defaultArrowHeight = 7.0; //箭头高度
const _defaultMinHeight = 24.0; //最小高度
const _defaultMinWidth = 50.0; //最小宽度

class QWBubble extends StatelessWidget {
  final BubbleDirection direction;
  final Radius borderRadius;
  final Widget child;
  final BoxDecoration decoration;
  final Color color;
  final _left;
  final _right;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final BoxConstraints constraints;
  final double width;
  final double height;
  final Alignment alignment;
  final double arrowWidth;
  final double arrowHeight;
  const QWBubble(
      {Key key,
      this.direction = BubbleDirection.left,
      this.borderRadius,
      this.child,
      this.decoration,
      this.color,
      this.padding,
      this.margin,
      this.constraints,
      this.width,
      this.height,
      this.alignment,
      this.arrowHeight,
      this.arrowWidth})
      : _left = direction == BubbleDirection.left ? _defaultArrowWidth : 0.0,
        _right = direction == BubbleDirection.right ? _defaultArrowWidth : 0.0,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _BubbleClipper(
          direction,
          this.borderRadius ?? Radius.circular(5.0),
          this.constraints,
          this.arrowWidth,
          this.arrowHeight),
      child: Container(
        alignment: this.alignment,
        width: this.width,
        height: this.height,
        constraints: (this.constraints ?? BoxConstraints())
            .copyWith(minHeight: _defaultMinHeight, minWidth: _defaultMinWidth),
        margin: this.margin,
        decoration: this.decoration,
        color: this.color,
        padding: EdgeInsets.fromLTRB(this._left, 0.0, this._right, 0.0)
            .add(this.padding ?? EdgeInsets.fromLTRB(7.0, 5.0, 7.0, 5.0)),
        child: this.child,
      ),
    );
  }
}

///方向
enum BubbleDirection { left, right }

class _BubbleClipper extends CustomClipper<Path> {
  final BubbleDirection direction;
  final Radius radius;
  final BoxConstraints constraints;
  final double arrowWidth;
  final double arrowHeight;
  _BubbleClipper(this.direction, this.radius, this.constraints, this.arrowWidth,
      this.arrowHeight);

  @override
  Path getClip(Size size) {
    final path = Path();
    final path2 = Path();
    final centerPoint = (size.height / 2).clamp(
        (this.constraints?.minHeight ?? _defaultMinHeight) / 2,
        (this.constraints?.minHeight ?? _defaultMinHeight) / 2);
    print(centerPoint);
    final _arrowWidth = this.arrowWidth ?? _defaultArrowWidth;
    final _arrowHeight = this.arrowHeight ?? _defaultArrowHeight;
    if (this.direction == BubbleDirection.left) {
      //绘制左边三角形
      path.moveTo(0, centerPoint);
      path.lineTo(_arrowWidth, centerPoint - _arrowHeight / 2);
      path.lineTo(_arrowWidth, centerPoint + _arrowHeight / 2);
      path.close();
      //绘制矩形
      path2.addRRect(RRect.fromRectAndRadius(
          Rect.fromLTWH(
              _arrowWidth, 0, (size.width - _arrowWidth), size.height),
          this.radius));
      //合并
      path.addPath(path2, Offset(0, 0));
    } else {
      //绘制右边三角形
      path.moveTo(size.width, centerPoint);
      path.lineTo(size.width - _arrowWidth, centerPoint - _arrowHeight / 2);
      path.lineTo(size.width - _arrowWidth, centerPoint + _arrowHeight / 2);
      path.close();
      //绘制矩形
      path2.addRRect(RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, (size.width - _arrowWidth), size.height),
          this.radius));
      //合并
      path.addPath(path2, Offset(0, 0));
    }
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
