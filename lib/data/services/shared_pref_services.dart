import 'package:shared_preferences/shared_preferences.dart';

import '../../common/ui/logger.dart';

// key

const String downloadToken = 'isDataDownloaded';
const String lastUpdatedTime = 'lastUpdatedTime';

// final sharedPrefServiceProvider = Provider((ref) => SharedPrefServices());

class SharedPrefServices {
  static Future<SharedPreferences> get _instance async => _prefs ??= await SharedPreferences.getInstance();
  static SharedPreferences? _prefs;

  static Future<SharedPreferences> init() async {
    _prefs = await _instance;
    return _prefs!;
  }

  //sets
  static Future<bool> setString(String key, String value) async => await _prefs!.setString(key, value);
  static Future<bool> setInt(String key, int value) async => await _prefs!.setInt(key, value);
  //gets
  static String? getString(String key) => _prefs!.getString(key);
  static int? getInt(String key) => _prefs!.getInt(key);
  //deletes..
  static Future<bool> remove(String key) async => await _prefs!.remove(key);

  // data
  Future<void> setDownloadStatus() async {
    LoggerManager.green("[SharedPrefServices] setting downloadStatus sp");
    await _prefs!.setString(downloadToken, 'true');
  }

  String? getDownloadStatus() {
    String? token = _prefs!.getString(downloadToken);
    return token;
  }

  Future<void> removeDownloadStatus() async {
    LoggerManager.green("[SharedPrefServices] removing downloadStatus");
    await _prefs!.remove(downloadToken);
  }

  // last updated
  Future<void> setLastUpdatedTime(String data) async {
    LoggerManager.green("[SharedPrefServices] setting last updated time $data");
    await _prefs!.setString(lastUpdatedTime, data);
  }

  String? getLastUpdatedTime() {
    String? data = _prefs!.getString(lastUpdatedTime);
    return data;
  }
}
