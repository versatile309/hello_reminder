import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<String?> getByKey(String key) async {
    return _prefs.getString(key);
  }

  Future<void> setByKey(String key, String value) async {
    await _prefs.setString(key, value);
  }
}
