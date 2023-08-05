import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_gold_currency_prices/core/widgets/update_last_widget.dart';
import 'package:intl/intl.dart';

import '../../../../core/localization/language/languages.dart';
import '../../../../core/widgets/dispay_name_and_price_c_or_g.dart';
import '../../../../core/widgets/dropdowuntype_curr_or_gold_widget.dart';
import '../../domain/entities/gold.dart';

class DetailGoldWidget extends StatelessWidget {
  final Gold gold;
  const DetailGoldWidget({Key? key, required this.gold}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Color.fromRGBO(35, 41, 70, 1),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 40.0,
            left: 5.0,
            right: 5.0,
          ),
          child: Column(children: [
            Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Languages.of(context)!.select_currency_type,
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    )
                  ]),
            ),
            SizedBox(
              height: 25.0,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.07,
              decoration: BoxDecoration(
                color: Colors.yellow[200],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(15.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(children: [
                  Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          DropdowuntypeCurrencyOrGold(
                            call_from_page_CorG: true,
                          ),
                        ],
                      )),
                  Expanded(
                      child: Text(
                    Languages.of(context)!.gram_price,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  )),
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 1.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 233, 211, 132),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0)),
                ),
                child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DisplayNameAndPricesCurrencyorGold(
                          nam_currencyORgold: Languages.of(context)!.gram_24k,
                          price: gold.gram_price_24k,
                          checktype_curreOrGold: true,
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                        DisplayNameAndPricesCurrencyorGold(
                          nam_currencyORgold: Languages.of(context)!.gram_21k,
                          price: gold.gram_price_21k,
                          checktype_curreOrGold: true,
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                        DisplayNameAndPricesCurrencyorGold(
                          nam_currencyORgold: Languages.of(context)!.gram_18k,
                          price: gold.gram_price_18k,
                          checktype_curreOrGold: true,
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                      ]),
                ),
              ),
            ),
            UpdateLastWidget(),
            ]),
        ),
      ),
    );
  }
}
