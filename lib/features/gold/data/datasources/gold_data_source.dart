import 'package:flutter_clean_architecture_gold_currency_prices/core/error/exceptions.dart';

import '../../../../core/constants/constants.dart';
import '../model/gold_model.dart';

abstract class GoldDataSource {
  Future<GoldModel> GetGoldprice();
  Future<GoldModel> GetGoldpriceByCurrency(double currency_type);
}

class GoldDataSourceImp implements GoldDataSource {
  //to return the gold price by currency USD (the USD is defaut=1)...
  @override
  Future<GoldModel> GetGoldprice() async {
    //the default value USD = 1
    final goldmodel = GoldModel.fromJson(
        ConvertBetweenGoldAndCurrencyPrices(currency_type: 1));
    print(goldmodel);
    return goldmodel;
  }

// to return gold price by the currency type selected
  @override
  Future<GoldModel> GetGoldpriceByCurrency(double currency_type) async {
    final goldmodel = GoldModel.fromJson(
        ConvertBetweenGoldAndCurrencyPrices(currency_type: currency_type));
    print(goldmodel);
    return goldmodel;
  }

//this methods to return gold price by the currency type selected...
  ConvertBetweenGoldAndCurrencyPrices({dynamic currency_type}) {
    if (AppConstants.currenciesList.isNotEmpty) {
        final currencylist = AppConstants.currenciesList.first;

      //To Convert the Gold price from Currency $USD to Currency type Select..
      double goldprice_versus_currency_Type = currencylist.XAU / currency_type;

      //! To Convert From Ounce Gold Price to Gram Gold Price
      double gold_price_gram_18k_byCurrency_Type =
          (((1 / goldprice_versus_currency_Type) / 31.1034) * 0.75);

      double gold_price_gram_21k_byCurrency_Type =
          (((1 / goldprice_versus_currency_Type) / 31.1034) * 0.875);

      double gold_price_gram_24k_byCurrency_Type =
          ((1 / goldprice_versus_currency_Type) / 31.1034);

      Map<String, dynamic> goldlist = {
        'gram_price_18k': gold_price_gram_18k_byCurrency_Type,
        'gram_price_21k': gold_price_gram_21k_byCurrency_Type,
        'gram_price_24k': gold_price_gram_24k_byCurrency_Type,
      };
      return goldlist;
      
    } else {
      throw OfflineException();
    }
  }
}
