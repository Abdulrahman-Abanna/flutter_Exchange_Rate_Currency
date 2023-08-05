part of 'select_currency_cubit.dart';

abstract class SelectCurrencyState extends Equatable {
  const SelectCurrencyState();

  @override
  List<Object> get props => [];
}

class SelectCurrencyInitial extends SelectCurrencyState {}

class SelectCurrencyTypeState extends SelectCurrencyState {
  final double currency;
  SelectCurrencyTypeState({required this.currency});
  @override
  List<Object> get props => [currency];

}
