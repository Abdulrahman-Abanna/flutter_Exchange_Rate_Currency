part of 'gold_cubit.dart';

abstract class GoldState extends Equatable {
  const GoldState();

  @override
  List<Object> get props => [];
}

class GoldInitial extends GoldState {}

class LoadinggetGoldState extends GoldState {}

class LoadedgetGoldState extends GoldState {
  final Gold gold;

  LoadedgetGoldState({required this.gold});

  @override
  List<Object> get props => [gold];
}
class ErrorgetGoldState extends GoldState {
  final String message;

  ErrorgetGoldState({required this.message});

  @override
  List<Object> get props => [message];
}


class LoadinggetGoldPriceByCurrencyTypeState extends GoldState {}

class LoadedgetGoldPriceByCurrencyTypeState extends GoldState {
  final Gold gold;

  LoadedgetGoldPriceByCurrencyTypeState({required this.gold});

  @override
  List<Object> get props => [gold];
}

