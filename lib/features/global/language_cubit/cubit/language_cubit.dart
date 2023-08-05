import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../../core/localization/language_cache_helper.dart';
part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageState(locale: Locale('ar')));

  Future<void> getSavedLanguage() async {
    final String cachedLanguageCode =
        await LanguageCacheHelper().getCacheLanguageCode();
    emit(LanguageState(locale: Locale(cachedLanguageCode)));
  }

  Future<void> ChangeLanguage(languageCode) async {
    await LanguageCacheHelper().CacheLanguageCode(languageCode);
    emit(LanguageState(locale: Locale(languageCode)));
    print(languageCode);
  }
}
