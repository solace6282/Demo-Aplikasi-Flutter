import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtil {
  static Future<String> getString(String key) async {
    final i = await SharedPreferences.getInstance();
    return i.getString(key) ?? '';
  }

  static Future<void> setString(String key, String value) async {
    final i = await SharedPreferences.getInstance();
    await i.setString(key, value);
  }
}