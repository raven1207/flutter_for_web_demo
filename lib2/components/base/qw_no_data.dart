import 'package:flutter/material.dart';
import 'package:new_project/components/base/qw_error.dart';
import 'package:new_project/constants/qw_language.dart';
// import 'package:qingwan_flutter_builder/constants/qw_language.dart';
// import 'package:qingwan_flutter_builder/components/base/qw_error.dart';
// import 'package:acg_flutter_component/acg_flutter_component.dart';

class QWNoData extends StatelessWidget {
  const QWNoData(
      {Key key, this.title, this.status, this.onPressed, this.top = 0.0})
      : super(key: key);
  final String status;
  final VoidCallback onPressed;
  final top;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onPressed != null) {
          onPressed();
        }
      },
      child: Center(
        child: _buildStatus(),
      ),
    );
  }

  Widget _buildStatus() {
    // if (status == isLoading) {
    //   return ACGLoadingLottie();
    // }
    if (status == isError) {
      // title = isErrorText;
      return QWError(title: isErrorText, top: top, onPressed: onPressed);
    } else if (status == isEmptyData) {
      // title = noData;
      return QWError(title: noData, top: top, onPressed: onPressed);
    } else {
      // title = isLoadingText;
      return QWError(title: title, top: top, onPressed: onPressed);
    }
  }
}
