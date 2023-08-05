part of 'currencies_bloc.dart';

abstract class CurrenciesState extends Equatable {
  const CurrenciesState();

  @override
  List<Object> get props => [];
}

class CurrenciesInitial extends CurrenciesState {}


class LoadingCurrenciesState extends CurrenciesState {}

class LoadedCurrenciesState extends CurrenciesState {
  final List<Currency> currency;

  LoadedCurrenciesState({required this.currency});
  @override
  List<Object> get props => [currency];
}

class ErrorCurrenciesState extends CurrenciesState {
  final String message;

  ErrorCurrenciesState({required this.message});
    @override
  List<Object> get props => [message];

}

// class LoadingSelectCurrencyTypeState extends CurrenciesState {}

// class LoadedSelectCurrencyTypeState extends CurrenciesState {
//   final double currency;
//   LoadedSelectCurrencyTypeState({required this.currency});
//   @override
//   List<Object> get props => [currency];
// }

