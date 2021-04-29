import 'package:acggame_paassdk_flutter_plugin/util/LogUtils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QwSPutils{
  /// 保存数据
  static saveData<T>(String key, T value) async {
    LogUtils.v("saveData $key, value=$value");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(value is String){
      prefs.setString(key, value as String);
    } else if(value is int){
      prefs.setInt(key, value as int);
    } else if(value is bool){
      prefs.setBool(key, value as bool);
    } else if(value is double){
      prefs.setDouble(key, value as double);
    }
    prefs.commit();
  }


  /// 读取数据
  static Future<String> getDataStr(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var value = prefs.getString(key);
    print("_initGuideView,getDataStr value=$value");
    String ret;
    if(value != null){
      ret = value.toString();
    }
    return ret;
  }

  /// 读取数据
  static Future<T> getData<T>(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    T res = prefs.get(key);
    LogUtils.v("isShowGameSoftpad getData, res=$res");
    return res;
  }

  /// 读取数据
  static remove(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}