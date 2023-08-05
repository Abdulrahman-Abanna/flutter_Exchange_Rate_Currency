import 'package:flutter/material.dart';
import '../../../domain/entities/currency.dart';
import 'detials_currency_vs_others_widget.dart';

class CurrenciesPricesWidget extends StatelessWidget {
  final List<Currency> currencies;
  const CurrenciesPricesWidget({Key? key, required this.currencies})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Color.fromRGBO(35, 41, 70, 1),
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 35.0,
            left: 5.0,
            right: 5.0,
          ),
          child: DetialsCurrencyVSothers(currencies: currencies.first),
          
        ),
      ),
    );
  }
}
