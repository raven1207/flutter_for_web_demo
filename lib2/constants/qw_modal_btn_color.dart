import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:acg_flutter_theme/acg_flutter_theme.dart';

const left = 'l';
const right = 'r';
Map<String, Color> getModalBtnColor(BuildContext context, String type) {
  final _data = ThemeSkinColors.of(context).data;
  Map<String, Color> _style;
  if (type == left) {
    _style = {
      'bgColor': _data.dividerColor,
      'borderColor': _data.borderColor,
      'textColor': _data.textColorLevel2,
    };
  } else if (type == right) {
    _style = {
      'bgColor': _data.brandColor,
      'borderColor': _data.borderColor,
      'textColor': _data.textColor,
    };
  }

  return _style;
}
