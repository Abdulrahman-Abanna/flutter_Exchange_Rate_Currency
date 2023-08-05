import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exceptions.dart';
import '../model/currencies_model.dart';

abstract class CurrenciesLocalDataSources {
  Future<List<CurrenciesModel>> getCacheCurrencies();
  Future<Unit> CacheCurrencies(List<CurrenciesModel> currenciesModel);
  Future<Unit> CacheUpdateTimeLast(String update_last);
  String getCacheUpdateTimeLast();
}

const Cached_Currencies = "Cached_Currencies";

const Cached_updateLast = "Cached_Update";

class CurrenciesLocalDataSourcesImp implements CurrenciesLocalDataSources {
  final SharedPreferences sharedPreferences;

  CurrenciesLocalDataSourcesImp({required this.sharedPreferences});

  @override
  Future<Unit> CacheCurrencies(List<CurrenciesModel> currenciesModel) async {
    final CurrencyToJson = currenciesModel
        .map<Map<String, dynamic>>((item) => item.toJson())
        .toList();
    sharedPreferences.setString(Cached_Currencies, json.encode(CurrencyToJson));
    return Future.value(unit);
  }

  @override
  Future<List<CurrenciesModel>> getCacheCurrencies() {
    final jsonstring = sharedPreferences.getString(Cached_Currencies);
    if (jsonstring != null) {
      List decodejson = json.decode(jsonstring);
      List<CurrenciesModel> jsonToCurrenciesModel = decodejson
          .map<CurrenciesModel>((item) => CurrenciesModel.fromJson(item))
          .toList();
      return Future.value(jsonToCurrenciesModel);
    } else {
      throw EmptyCacheException();
    }
  }

  @override
  Future<Unit> CacheUpdateTimeLast(String update_last) {
    sharedPreferences.setString(Cached_updateLast, update_last);
    return Future.value(unit);
  }

  @override
  String getCacheUpdateTimeLast() {
    return sharedPreferences.getString(Cached_updateLast).toString();
  }
}
