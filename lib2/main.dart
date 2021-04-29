import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:new_project/page/detail/qw_detail_page.dart';


void main() async {
   runApp(QWMainScreen());
}

class QWMainScreen extends StatefulWidget {
  static DateTime mainScreenBeginTime;
  static DateTime mainScreenEndTime;

  static String lastPartDetailUniqueId = null;
  static String lastPartDetailLitePlayId = null;
  static String lastPartDetailLiteLineId = null;
  static String currentPageName;

  @override
  State<StatefulWidget> createState() => _QWMainScreenState();
}

class _QWMainScreenState extends State<QWMainScreen> {

  @override
  void initState() {
    super.initState();
  }

 @override
  Widget build(BuildContext context) {

    return QWDetailPage(
        mixGameId: 'M0A2XzNBMUgkYA==', liteLineId: '1', previewTicket: '');
  }
}
