import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture_gold_currency_prices/features/currencies/presentation/state_managements/cubit/select_currency_cubit.dart';
import '../../../../../core/localization/language/languages.dart';
import '../../../../../core/widgets/dispay_name_and_price_c_or_g.dart';
import '../../../../../core/widgets/dropdowuntype_curr_or_gold_widget.dart';
import '../../../../../core/widgets/update_last_widget.dart';
import '../../../domain/entities/currency.dart';

class DetialsCurrencyVSothers extends StatelessWidget {
  final Currency currencies;
  const DetialsCurrencyVSothers({Key? key, required this.currencies})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SelectCurrencyCubit, SelectCurrencyState>(
      listener: ((context, state) {}),
      builder: (context, state) {
        if (state is SelectCurrencyTypeState) {
          return _BuildDetailsCurrency(context, state.currency);
        } else {
          return _BuildDetailsCurrency(context, 1);
        }
      },
    );
  }

  _BuildDetailsCurrency(context, double currency) {
    return Column(children: [
      Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
          color: Color.fromRGBO(239, 196, 202, 1),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.0), topRight: Radius.circular(12.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.white,
              blurRadius: 2.0,
              offset: Offset(0, 0),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: DropdowuntypeCurrencyOrGold(
                          currency: currencies,
                          call_from_page_CorG: false,
                        ),
                      ),
                    ],
                  )),
              Expanded(
                child: Text(
                  Languages.of(context)!.price,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(
          top: 1.0,
        ),
        child: Container(
          height: MediaQuery.of(context).size.height / 2,
          decoration: BoxDecoration(
            color: Color.fromRGBO(44, 52, 90, 1),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12.0),
                bottomRight: Radius.circular(12.0)),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                DisplayNameAndPricesCurrencyorGold(
                  nam_currencyORgold: Languages.of(context)!.doller,
                  price: ExchangeRateBt_currency(currencies.USD, currency),
                  checktype_curreOrGold: false,
                ),
                Divider(
                  color: Colors.grey,
                ),
                DisplayNameAndPricesCurrencyorGold(
                  nam_currencyORgold: Languages.of(context)!.rail_usa,
                  price: ExchangeRateBt_currency(currencies.SAR, currency),
                  checktype_curreOrGold: false,
                ),
                Divider(
                  color: Colors.grey,
                ),
                DisplayNameAndPricesCurrencyorGold(
                  nam_currencyORgold: Languages.of(context)!.euro,
                  price: ExchangeRateBt_currency(currencies.EUR, currency),
                  checktype_curreOrGold: false,
                ),
                Divider(
                  color: Colors.grey,
                ),
                DisplayNameAndPricesCurrencyorGold(
                  nam_currencyORgold: Languages.of(context)!.kwddinar,
                  price: ExchangeRateBt_currency(currencies.KWD, currency),
                  checktype_curreOrGold: false,
                ),
                Divider(
                  color: Colors.grey,
                ),
                DisplayNameAndPricesCurrencyorGold(
                  nam_currencyORgold: Languages.of(context)!.egppound,
                  price: ExchangeRateBt_currency(currencies.EGP, currency),
                  checktype_curreOrGold: false,
                ),
                Divider(
                  color: Colors.grey,
                ),
                DisplayNameAndPricesCurrencyorGold(
                  nam_currencyORgold: Languages.of(context)!.omrrial,
                  price: ExchangeRateBt_currency(currencies.OMR, currency),
                  checktype_curreOrGold: false,
                ),
                Divider(
                  color: Colors.grey,
                ),
                DisplayNameAndPricesCurrencyorGold(
                  nam_currencyORgold: Languages.of(context)!.qarrail,
                  price: ExchangeRateBt_currency(currencies.QAR, currency),
                  checktype_curreOrGold: false,
                ),
                Divider(
                  color: Colors.grey,
                ),
                DisplayNameAndPricesCurrencyorGold(
                  nam_currencyORgold: Languages.of(context)!.aeddirham,
                  price: ExchangeRateBt_currency(currencies.AED, currency),
                  checktype_curreOrGold: false,
                ),
                Divider(
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ),
      ),
      SizedBox(
        height: 20,
      ),
      UpdateLastWidget(),
    ]);
  }

  ExchangeRateBt_currency(double cur1, double cur2) {
    return cur1 / cur2;
  }
}
