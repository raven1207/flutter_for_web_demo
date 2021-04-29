
extension Extension on String {
  qw_isEmpty() => this == null || this == '';
  qw_isNotEmpty() => !this.qw_isEmpty();
  int qw_toInt() => this.qw_isNotEmpty() ? int.tryParse(this) : 0;
  bool qw_toBool() => (this ?? '').toLowerCase() == 'true';

  String addMsg(String msg) {
    return this + "_" +  msg;
  }
}
