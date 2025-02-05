import 'package:shared_preferences/shared_preferences.dart';

///Local Data Helper

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  static Future<SharedPreferences> init() async {
    return sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setData({required String key, dynamic value}) async {
    switch (value) {
      case String _:
        return await sharedPreferences.setString(key, value);
      case bool _:
        return await sharedPreferences.setBool(key, value);
      case int _:
        return await sharedPreferences.setInt(key, value);
      case double _:
        return await sharedPreferences.setDouble(key, value);
      case List<String> _:
        return await sharedPreferences.setStringList(key, value);
      default:
        throw ArgumentError('Unsupported type');
    }
  }

  static getData({required String key}) {
    return sharedPreferences.get(key);
  }

  static Future<bool> clearData({
    required String key,
  }) async {
    return await sharedPreferences.remove(key);
  }

  static Future<bool> clearAll() async {
    return await sharedPreferences.clear();
  }
}
