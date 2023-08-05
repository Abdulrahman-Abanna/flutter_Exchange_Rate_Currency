part of 'currencies_bloc.dart';

abstract class CurrenciesEvent extends Equatable {
  const CurrenciesEvent();

  @override
  List<Object> get props => [];
}

class GetCurrenciesEvent extends CurrenciesEvent {}

// class SelectCurrencyTypeEvent extends CurrenciesEvent {
//   final double price_the_currencyin_dollar;
//   SelectCurrencyTypeEvent({required this.price_the_currencyin_dollar});
//   @override
//   List<Object> get props => [price_the_currencyin_dollar];
  
// }
