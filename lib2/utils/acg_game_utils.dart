// import 'package:qingwan_flutter_builder/service/qw_game_service.dart';

//this 毫秒单位
extension Extension on int {
  int qw_formatTimeToWait() {
    if (this == null) {
      return 0;
    }
    if (this.qw_isLessThanOneMinute()) {
      return this ~/ 1000;
    } else if (this <= 3600000) {
      return (this / 1000) ~/ 60;
    } else {
      return 60;
    }
  }

  String qw_timeToWaitUnit() {
    if (this == null || this.qw_isLessThanOneMinute()) {
      return '秒';
    } else {
      return '分钟';
    }
  }

  String qw_timeToWaitWithUnit() {
    if (this == null) {
      return '0秒';
    }
    return this.qw_formatTimeToWait().toString() + this.qw_timeToWaitUnit();
  }

  bool qw_isOutOfUpbound() {
    if (this != null && this > 360000) {
      return true;
    } else {
      return false;
    }
  }

  bool qw_isLessThanOneMinute() {
    if (this == null || (0 <= this && this < 60000)) {
      return true;
    }
    return false;
  }
}
