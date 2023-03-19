import 'package:hive/hive.dart';
import 'package:mova_app/models/account/account_details.dart';

class HiveService {
  static late Box _userSettingsBox;

  static Future<void> init() async {
    _userSettingsBox = await Hive.openBox('userSettings');
  }

  static Future<bool> saveSessionId(String? sessionId) async {
    await _userSettingsBox.put('session_id', sessionId);
    return true;
  }

  static String? getSessionId() {
    final String? sessionId = _userSettingsBox.get('session_id');
    return sessionId;
  }

  static Future<bool> saveTheme(bool isLight) async {
    await _userSettingsBox.put('theme', isLight);
    return true;
  }

  static bool getTheme() {
    final bool isLight = _userSettingsBox.get('theme') ?? false;
    return isLight;
  }

  static Future<bool> saveLanguage(String? language) async {
    await _userSettingsBox.put('language', language);
    return true;
  }

  static String getLanguage() {
    final String language = _userSettingsBox.get('language') ?? 'en';
    return language;
  }

  static Future<bool> saveListId(int listId) async {
    await _userSettingsBox.put('list_id', listId);
    return true;
  }

  static int getListId() {
    final int listId = _userSettingsBox.get('list_id');
    return listId;
  }

  static Future<bool> saveAccountDetails(AccountDetails accountDetails) async {
    Map<dynamic, dynamic> userInfo = {
      'user_id': accountDetails.id,
      'username': accountDetails.username,
      'profile_path': accountDetails.avatar.tmdb!.avatarPath,
    };
    await _userSettingsBox.put('user_info', userInfo);

    return true;
  }

  static Map<dynamic, dynamic> getAccountDetails() {
    final Map<dynamic, dynamic> userInfo = _userSettingsBox.get('user_info');
    return userInfo;
  }

  static Future<bool> clear() async {
    await _userSettingsBox.clear();
    return true;
  }
}
