import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/utils.dart';

class SharedPrefHelper {
  SharedPrefHelper._();

  static Future<void> removeData(String key) async {
    Utils.printLog('SharedPrefHelper : data with key : $key has been removed');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(key);
  }

  static Future<void> clearAllData() async {
    Utils.printLog('SharedPrefHelper : all data has been cleared');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }

  static Future<void> setData(String key, Object value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Utils.printLog("SharedPrefHelper : setData with key : $key");
    switch (value) {
      case String v:
        await sharedPreferences.setString(key, v);
      case int v:
        await sharedPreferences.setInt(key, v);
      case bool v:
        await sharedPreferences.setBool(key, v);
      case double v:
        await sharedPreferences.setDouble(key, v);
      default:
        throw ArgumentError('Unsupported value type: ${value.runtimeType}');
    }
  }

  static Future<bool> getBool(String key) async {
    Utils.printLog('SharedPrefHelper : getBool with key : $key');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(key) ?? false;
  }

  static Future<double> getDouble(String key) async {
    Utils.printLog('SharedPrefHelper : getDouble with key : $key');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getDouble(key) ?? 0.0;
  }

  static Future<int> getInt(String key) async {
    Utils.printLog('SharedPrefHelper : getInt with key : $key');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(key) ?? 0;
  }

  static Future<String> getString(String key) async {
    Utils.printLog('SharedPrefHelper : getString with key : $key');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(key) ?? '';
  }

  static Future<void> setSecuredString(String key, String value) async {
    const flutterSecureStorage = FlutterSecureStorage();
    await flutterSecureStorage.write(key: key, value: value);
  }

  static Future<String> getSecuredString(String key) async {
    const flutterSecureStorage = FlutterSecureStorage();
    return await flutterSecureStorage.read(key: key) ?? '';
  }

  static Future<void> clearAllSecuredData() async {
    const flutterSecureStorage = FlutterSecureStorage();
    await flutterSecureStorage.deleteAll();
  }
}
