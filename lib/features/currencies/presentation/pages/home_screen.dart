import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/localization/language/languages.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../global/widget/dropdown_lang_change.dart';
import '../state_managements/bloc/currencies_bloc.dart';
import '../widgets/currency_widgets/currencies_prices_widget.dart';
import '../widgets/currency_widgets/drawer_widget.dart';
import '../widgets/currency_widgets/message_display_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _BuildAppbar(context),
      drawer: DrawerWidget(),
      body: _BuildBody(context),
    );
  }

  AppBar _BuildAppbar(context) => AppBar(
        title: Text(
          Languages.of(context)!.Currency_Prices.toString(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Container(
              color: Color.fromRGBO(35, 41, 70, 1),
              child: ChangeLanguageWidget(),
            ),
          )
        ],
      );

  Widget _BuildBody(context) {
    return WillPopScope(
      onWillPop: () async {
        await ConfirmExitDialog(context);
        return false;
      },
      child: Padding(
        padding: EdgeInsets.all(0.0),
        child: BlocBuilder<CurrenciesBloc, CurrenciesState>(
          builder: (context, state) {
            if (state is LoadingCurrenciesState) {
              return LoadingWidget();
            } else if (state is LoadedCurrenciesState) {
              return CurrenciesPricesWidget(
                currencies: state.currency,
              );
            } else if (state is ErrorCurrenciesState) {
              return MessageDisplayWidget(
                message: state.message,
              );
            }
            return LoadingWidget();
          },
        ),
      ),
    );
  }

  Future<void> ConfirmExitDialog(context) async {
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text(
                Languages.of(context)!.sure_exit,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Color.fromARGB(218, 4, 255, 113),
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text(
                          Languages.of(context)!.cancel,
                          style: TextStyle(color: Colors.black, fontSize: 17),
                        )),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 175, 176, 176),
                      ),
                      onPressed: () => SystemNavigator.pop(),
                      child: Text(
                        Languages.of(context)!.yes,
                        style: TextStyle(color: Colors.black, fontSize: 17),
                      ),
                    ),
                  ],
                )
              ],
            ));
  }
}
