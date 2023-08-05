import 'package:flutter/material.dart';

abstract class Languages {
  static Languages? of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages);
  }

  String get Gold_Currencey_Prices;
  String get Currency_Prices;
  String get Currency_Name;
  String get price;
  String get doller;
  String get versus;
  String get rail_usa;
  String get Feedback;
  String get Gold_prices;
  String get euro;
  String get egppound;
  String get qarrail;
  String get kwddinar;
  String get aeddirham;
  String get omrrial;
  String get gram_24k;
  String get gram_21k;
  String get gram_18k;
  String get gram_price;
  String get select_currency_type;
  String get name_developer;
  String get developandprogramming;
  String get develop_programming;
  String get last_update;
  String get NO_INTERNET_CONNCTION_MESSAGE;
  String get NO_CACHED_DATA_MESSAGE;
  String get SERVER_FAILUER_MESSAGE;
  String get sure_exit;
  String get yes;
  String get cancel;
}
