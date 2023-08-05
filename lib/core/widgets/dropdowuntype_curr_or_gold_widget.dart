import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/currencies/domain/entities/currency.dart';
import '../../features/currencies/presentation/state_managements/cubit/select_currency_cubit.dart';
import '../../features/gold/presentation/state_managements/cubit/gold_cubit.dart';
import '../constants/constants.dart';
import '../localization/language/languages.dart';

class DropdowuntypeCurrencyOrGold extends StatelessWidget {
  final Currency? currency;
  final bool call_from_page_CorG;
  DropdowuntypeCurrencyOrGold(
      {Key? key, this.currency, required this.call_from_page_CorG})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    _returnNameCurrency(context, {value}) {
      if (value == AppConstants.currenciesList[0].SAR) {
        return Languages.of(context)!.rail_usa;
      } else if (value == AppConstants.currenciesList[0].AED) {
        return Languages.of(context)!.aeddirham;
      } else if (value == AppConstants.currenciesList[0].EGP) {
        return Languages.of(context)!.egppound;
      } else if (value == AppConstants.currenciesList[0].EUR) {
        return Languages.of(context)!.euro;
      } else if (value == AppConstants.currenciesList[0].KWD) {
        return Languages.of(context)!.kwddinar;
      } else if (value == AppConstants.currenciesList[0].OMR) {
        return Languages.of(context)!.omrrial;
      } else if (value == AppConstants.currenciesList[0].QAR) {
        return Languages.of(context)!.qarrail;
      }
      return Languages.of(context)!.doller;
    }

    return DropdownButton<dynamic>(
      items: AppConstants.currenciesList_dropdown
          .map<DropdownMenuItem>((value) => DropdownMenuItem(
                value: value,
                child: Text(
                  _returnNameCurrency(value: value, context),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ))
          .toList(),
      onChanged: (currencytype) {
        if (call_from_page_CorG) {
          context.read<GoldCubit>()..getGoldPriceByCurrencyType(currencytype);
        } else {
          SelectCurrencyCubit.get(context).SelectCurrcyType(currencytype);
          print("testonch  ${currencytype}");
        }
      },
      icon: Icon(
        Icons.arrow_drop_down,
        color: Colors.black,
        size: 30.0,
      ),
      borderRadius: BorderRadius.circular(12.0),
      hint: Text(
        _returnNameCurrency(context,
            value: call_from_page_CorG
                ? context.read<GoldCubit>().labeldropdown
                : SelectCurrencyCubit.get(context).SelectCurrency),
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
      ),
      underline: Container(),
      dropdownColor: Color.fromRGBO(239, 196, 202, 1),
    );
  }
}
