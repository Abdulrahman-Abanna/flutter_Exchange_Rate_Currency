import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'select_currency_state.dart';

class SelectCurrencyCubit extends Cubit<SelectCurrencyState> {
  SelectCurrencyCubit() : super(SelectCurrencyInitial());

  static SelectCurrencyCubit get(context) => BlocProvider.of(context);

  double? SelectCurrency;
  void SelectCurrcyType(currency_type) {
    SelectCurrency = currency_type;
    emit(SelectCurrencyTypeState(currency: SelectCurrency!));
  }
}
