
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {

  static SharedPreferences? sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> putData(String key, dynamic value) async {
    if (value is String) {
      return sharedPreferences!.setString(key, value);
    }
    if (value is int) {
      return sharedPreferences!.setInt(key, value);
    }
    if (value is double) {
      return sharedPreferences!.setDouble(key, value);
    }
    if (value is bool) {
      return sharedPreferences!.setBool(key, value);
    } else {
      return false;
    }
  }

  static dynamic getData(String key) {
      return sharedPreferences!.get(key);
  }

  static Future<bool> removeDate(String key) async {
    return await sharedPreferences!.remove(key);
  }

  static Future<bool> clearData() async {
    return await sharedPreferences!.clear();
  }
}
