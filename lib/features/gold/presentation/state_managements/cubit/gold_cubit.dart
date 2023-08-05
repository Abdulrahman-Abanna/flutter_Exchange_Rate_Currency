import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/error/failures.dart';
import '../../../domain/entities/gold.dart';
import '../../../domain/usecases/get_gold_price_by_currency_usecase.dart';
import '../../../domain/usecases/get_goldprice_usecase.dart';

part 'gold_state.dart';

class GoldCubit extends Cubit<GoldState> {
  final GetGoldPriceUseCase getGoldprice;
  final GetGoldPriceByCurrencyUseCase getGoldprice_by_currencyType;
  GoldCubit(
      {required this.getGoldprice, required this.getGoldprice_by_currencyType})
      : super(GoldInitial());

  Future<void> GetGoldprice() async {
    emit(LoadinggetGoldState());
    final getgoldprice = await getGoldprice();
    getgoldprice.fold(
        (failure) =>
            emit(ErrorgetGoldState(message: _mapFailureToMessage(failure))),
        (gold) => emit(LoadedgetGoldState(gold: gold)));
  }

  double? labeldropdown;

  Future<void> getGoldPriceByCurrencyType(currency_type) async {
      labeldropdown=currency_type;
    emit(LoadinggetGoldPriceByCurrencyTypeState());
    final getGoldpriceBycurr_type =
        await getGoldprice_by_currencyType(currency_type);
    getGoldpriceBycurr_type.fold((l) => null,
        (gold) => emit(LoadedgetGoldPriceByCurrencyTypeState(gold: gold)));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case OfflineFailure:
        return   "الرجاء التحقق من الاتصال بالانترنت";
      default:
        return "Unexpected Error . please try agin later .";
    }
  }
}
