import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_gold_currency_prices/core/localization/language/languages.dart';
import '../constants/constants.dart';

class UpdateLastWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(top:30.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(Languages.of(context)!.last_update+" :- "+
            AppConstants.datetime,
            style: TextStyle(fontSize: 14, color: Colors.white),
          )
        ]),
      ),
    );
  }
}
