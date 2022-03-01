import 'package:flutter_demo/presentation/base/resources/language_manager.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageKey {
  static const prefsEmail = 'PREFS_EMAIL';
  static const prefsPassword = 'PREFS_PASSWORD';
  static const prefsKeyLang = "PREFS_KEY_LANG";
  static const prefsKeyOnboardingScreen = "PREFS_KEY_ONBOARDING_SCREEN";
  static const prefsKeyIsUserLoggedIn = "PREFS_KEY_IS_USER_LOGGED_IN";
  static const prefsKeyToken = "PREFS_KEY_TOKEN";
  static const prefsKeyAppSettings = 'PREFS_KEY_APP_SETTINGS';
}

@singleton
class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  Future<String> getAppLanguage() async {
    String? language = _sharedPreferences.getString(StorageKey.prefsKeyLang);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      return LanguageType.vietnam.getValue();
    }
  }

  Future<void> saveAppLanguage(String currentLanguage) async {
    _sharedPreferences.setString(StorageKey.prefsKeyLang, currentLanguage);
  }

  Future<void> saveAccessToken(String token) async {
    _sharedPreferences.setString(StorageKey.prefsKeyToken, token);
  }

  Future<String?> getAccessToken() async {
    return _sharedPreferences.getString(StorageKey.prefsKeyToken);
  }

  Future<void> setIsUserLoggedIn() async {
    _sharedPreferences.setBool(StorageKey.prefsKeyIsUserLoggedIn, true);
  }

  Future<bool> isUserLoggedIn() async {
    return _sharedPreferences.getBool(StorageKey.prefsKeyIsUserLoggedIn) ??
        false;
  }

  Future<void> logout() async {
    _sharedPreferences.remove(StorageKey.prefsKeyIsUserLoggedIn);
  }

  Future<void> saveSettings(String data) async {
    await _sharedPreferences.setString(StorageKey.prefsKeyAppSettings, data);
  }
}
