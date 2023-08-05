import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/error/failures.dart';
import '../../../domain/entities/currency.dart';
import '../../../domain/usecases/get_currencies.dart';
part 'currencies_event.dart';
part 'currencies_state.dart';

class CurrenciesBloc extends Bloc<CurrenciesEvent, CurrenciesState> {
  final GetCurrenciesUseCases getCurrencies;
  CurrenciesBloc({required this.getCurrencies}) : super(CurrenciesInitial()) {
    on<CurrenciesEvent>((event, emit) async {
      if (event is GetCurrenciesEvent) {
        emit(LoadingCurrenciesState());
        
        final failureorcurrencies = await getCurrencies();
        failureorcurrencies.fold((failure) {
          emit(ErrorCurrenciesState(message: _mapFailureToMessage(failure)));
        }, (currency) {
          emit(LoadedCurrenciesState(currency: currency));
        });
      } 
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return "عذرا لا يمكننا الوصول الى السيرفر في الوقت الحالي , الرجاء المحاولة لاحقا";

      case EmptyCacheFailure:
        return "لا يوجد معلومات محفوظة مسبقا , يرجى الاتصال بالانترنت";

      case OfflineFailure:
        return   "الرجاء التحقق من الاتصال بالانترنت";

      default:
        return "Unexpected Error . please try again later .";
    }
  }
}
