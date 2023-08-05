import 'package:flutter/material.dart';

import '../localization/language/languages.dart';

class DisplayNameAndPricesCurrencyorGold extends StatelessWidget {
  final String nam_currencyORgold;
  final double price;
  final bool checktype_curreOrGold;
  const DisplayNameAndPricesCurrencyorGold(
      {Key? key,
      required this.checktype_curreOrGold,
      required this.nam_currencyORgold,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.06,
      decoration: BoxDecoration(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  (checktype_curreOrGold
                          ? ' '
                          : Languages.of(context)!.versus) +
                      ' ' +
                      nam_currencyORgold,
                  style: checktype_curreOrGold
                      ? TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                        )
                      : TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                ),
              ),
            ),
            Expanded(
              child: Text(
                price.toStringAsFixed(4),
                style: checktype_curreOrGold
                    ? TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                      )
                    : TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
