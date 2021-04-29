// import 'package:acg_flutter_channel/acg_flutter_channel.dart';

bool _hasNetwork = true;

bool _ischecking = false;
Future<bool> hasNetwork() async {
  if (_ischecking) {
    return _hasNetwork;
  }
  _ischecking = true;
  print("testhasnetwork---start");
//   var value = await ACGEnvironmentChannel.networkStatus;
  print("testhasnetwork---end");
  _ischecking = false;
  _hasNetwork = true;
  return _hasNetwork;
}
