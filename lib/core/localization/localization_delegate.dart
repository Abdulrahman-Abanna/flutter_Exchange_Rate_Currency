import 'package:flutter/material.dart';
import 'language/language_an.dart';
import 'language/language_ar.dart';
import 'language/languages.dart';

class AppLocalizationDelegate extends LocalizationsDelegate<Languages> {

  AppLocalizationDelegate();
  
  @override
  bool isSupported(Locale locale) => ['ar', 'en'].contains(locale.languageCode);

  @override
  Future<Languages> load(Locale locale) => _load(locale);

  static Future<Languages> _load(Locale locale) async {
    switch (locale.languageCode) {
      case 'ar':
        return Language_ar();
      case 'en':
        return Language_en();
      default:
        return Language_ar();
    }
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<Languages> old) => false;
}
