import 'package:shared_preferences/shared_preferences.dart';


class LanguageCacheHelper {
  Future<void> CacheLanguageCode(String languageCode) async {
    final _pref = await SharedPreferences.getInstance();
    _pref.setString("LOCALE", languageCode);
  }

  Future<String> getCacheLanguageCode() async {
    final _pref = await SharedPreferences.getInstance();
    final cachedLanguageCode = await _pref.getString("LOCALE");
    if (cachedLanguageCode != null && cachedLanguageCode.isNotEmpty) {
      return cachedLanguageCode;
    } else {
      return 'ar';
    }
  }
}
