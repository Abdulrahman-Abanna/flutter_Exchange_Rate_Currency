import 'package:flutter_clean_architecture_gold_currency_prices/features/currencies/data/model/currencies_model.dart';

class AppConstants {
  static const String PhoneNumber = "tel:+967776341682";
  static const String PhoneNumberWhats = "+967773189477";
  static const String recipientEmail = "mailto:abduo0001996@gmail.com";

  static String baseUrl = "https://api.metalpriceapi.com/v2";
  static String api_key = '1a4482c5826ccc05671f567c301f7a26';
  static String base = 'USD';

  static late List<CurrenciesModel> currenciesList = [];

  static List currenciesList_dropdown = [
    currenciesList[0].USD,
    currenciesList[0].SAR,
    currenciesList[0].EUR,
    currenciesList[0].AED,
    currenciesList[0].KWD,
    currenciesList[0].EGP,
    currenciesList[0].OMR,
    currenciesList[0].QAR,
  ];

  static late String datetime;
}
