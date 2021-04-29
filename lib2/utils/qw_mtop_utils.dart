// import 'package:acg_flutter_channel/acg_flutter_channel.dart';

Future<Map<String, dynamic>> requestByAPI(
    {String apiName, Map<String, String> bizMap, String apiVersion = "1.0"}) {
  assert(apiName != null && bizMap.length > 0);

  Map<String, String> params = {};
  bizMap.forEach((key, value) {
    params[key] = value;
  });

//   final request = ACGMTopRequest(
//     apiName: apiName,
//     data: {
//       'params': params,
//     },
//     apiVersion: apiVersion,
//   );
//   return ACGMTopChannel.request(request);
}
