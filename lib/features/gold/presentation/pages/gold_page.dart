import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture_gold_currency_prices/core/localization/language/languages.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../currencies/presentation/widgets/currency_widgets/message_display_widget.dart';
import '../state_managements/cubit/gold_cubit.dart';
import '../widgets/details_gold_widget.dart';

class GoldPage extends StatelessWidget {
  const GoldPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<GoldCubit>().GetGoldprice();
    return Scaffold(
      appBar: _BuildAppbar(context),
      body: _BuildBody(),
    );
  }

  _BuildAppbar(context) {
    return AppBar(
      title: Text(Languages.of(context)!.Gold_prices),
    );
  }

  _BuildBody() {
    return BlocBuilder<GoldCubit, GoldState>(builder: (_, state) {
      if (state is LoadinggetGoldState) {
        return LoadingWidget();
      } else if (state is LoadedgetGoldState) {
        return DetailGoldWidget(gold: state.gold);
      } else if (state is LoadinggetGoldPriceByCurrencyTypeState) {
        return LoadingWidget();
      } else if (state is LoadedgetGoldPriceByCurrencyTypeState) {
        return DetailGoldWidget(gold: state.gold);
      } else if (state is ErrorgetGoldState) {
        return MessageDisplayWidget(message: state.message);
      }
      return SizedBox();
    });
  }
}
