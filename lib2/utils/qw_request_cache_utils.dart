import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:package_info/package_info.dart';
// import 'package:qingwan_flutter_builder/utils/qw_safemap.dart';

/**
 * 两次保存缓存的时间间隔
 */
const int SAVE_TIME_INTERVAL = 3600 * 1000;

class RequestCacheUtils {
  static String _localPath = 'flutter_request';
  static int _lastSaveTime = 0;

  RequestCacheUtils() {}

  static Future<Map<String, dynamic>> readLocalData(String apiName) async {
//    int time = DateTime.now().millisecondsSinceEpoch;
    print('CGHome: readLocalData1 ');
    try {
      String folder = '';
      if (Platform.isAndroid) {
//      Directory documentsDir = await getExternalStorageDirectory();
//      folder = documentsDir.path;
        //这里获取路径比较耗时，使用写死的路径
        folder = '/storage/emulated/0/Android/data/com.qingwan.cloudgame/files';
      } else if (Platform.isIOS) {
        Directory documentsDir = await getApplicationDocumentsDirectory();
        folder = documentsDir.path;
      }

      String path = '$folder/$_localPath/$apiName.json';
      File file = new File(path);
      Map<String, dynamic> result = Map<String, dynamic>();
      if (file.existsSync()) {
        String initData = await file.readAsString();
        result = jsonDecode(initData);
      } else {
        return null;
      }
//      print('CGHome: readLocalData3 len='+ result['data']['nodes'].length.toString());

      PackageInfo packageInfo = await PackageInfo.fromPlatform();

//      print('CGHome: readLocalData  time=' + (DateTime.now().millisecondsSinceEpoch - time).toString());

    //   if (SafeMap(result)['appVersion'].value == packageInfo.version) {
    //     return result;
    //   }
      //相邻版本升级，不对比版本号,提升cache命中率
    //   String cacheAppVersion = SafeMap(result)['appVersion'].value;
    //   if (cacheAppVersion.startsWith('0.3')) {
    //     print('CGHome:---cache----equal');
    //     return result;
    //   }
    } catch (e) {
      print('CGHome:readLocalData ' + e.toString());
    }
    return null;
  }

  static Future<bool> saveToLocalData(String apiName, Map result) async {
    try {
      int currentTime = new DateTime.now().millisecondsSinceEpoch;
      if (currentTime - _lastSaveTime < SAVE_TIME_INTERVAL) {
        return false;
      }
//      print('CGHome: _saveLocalData diff=' + (currentTime - _lastSaveTime).toString() + ' apiName=' + apiName);
      _lastSaveTime = currentTime;
      Map newMap = Map.from(result);
      try {
        //只保存前3个页卡
        if (newMap['data'] != null && newMap['data']['nodes'] != null) {
          List list = newMap['data']['nodes'];
          int saveSize = 3;
          if (list.length >= saveSize) {
            List nodes = [];
            for (int i = 0; i < saveSize; i++) {
              Map clonedData = jsonDecode(jsonEncode(result['data']['nodes'][i]));
              clonedData['data'].remove('dataModel');
              nodes.add(clonedData);
            }

            newMap['data']['nodes'] = nodes;
          }
        }
      } catch (e) {
        print('CGHome:saveToLocalData0 ' + e.toString());
      }



      String folder = '';
      if (Platform.isAndroid) {
//      Directory documentsDir = await getExternalStorageDirectory();
//      folder = documentsDir.path;
        //这里获取路径比较耗时，使用写死的路径
        folder = '/storage/emulated/0/Android/data/com.qingwan.cloudgame/files';
      } else if (Platform.isIOS) {
        Directory documentsDir = await getApplicationDocumentsDirectory();
        folder = documentsDir.path;
      }
      String path = '$folder/$_localPath/$apiName.json';

      //保存当前版本号
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      newMap['appVersion'] = packageInfo.version;
      print('CGHome: saveToLocalData version=' + packageInfo.version);

      Directory data = Directory('$folder/$_localPath');
      if (!data.existsSync()) {
        data.createSync();
      }
      File file = new File(path);
      if (!file.existsSync()) {
        file.createSync();
      }

      await file.writeAsString(json.encode(newMap));
    } catch (e) {
      print('CGHome:saveToLocalData ' + e.toString());
    }
    return true;
  }

  static Future cleanLocalData(String id) async {
    Directory documentsDir = await getApplicationDocumentsDirectory();
    String documentsPath = documentsDir.path;
    File file = new File('$documentsPath/$_localPath/$id.json');
    if (file.existsSync()) {
      file.deleteSync();
    }
  }
}
