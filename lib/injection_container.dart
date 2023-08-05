import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/network/networkinfo.dart';
import 'features/currencies/data/datasources/currencies_local_datasources.dart';
import 'features/currencies/data/datasources/currencies_remote_datasourses.dart';
import 'features/currencies/data/repositories/currency_repositoriesImp.dart';
import 'features/currencies/domain/repositories/currency_repository.dart';
import 'features/currencies/domain/usecases/get_currencies.dart';
import 'features/currencies/presentation/state_managements/bloc/currencies_bloc.dart';
import 'features/gold/data/datasources/gold_data_source.dart';
import 'features/gold/data/repository/gold_repositoryimp.dart';
import 'features/gold/domain/repositories/gold_repository.dart';
import 'features/gold/domain/usecases/get_gold_price_by_currency_usecase.dart';
import 'features/gold/domain/usecases/get_goldprice_usecase.dart';
import 'features/gold/presentation/state_managements/cubit/gold_cubit.dart';


final sl = GetIt.instance;
Future<void> init() async {
//! Features Currencies

  //bloc

  sl.registerFactory(() => CurrenciesBloc(getCurrencies: sl()));
  sl.registerFactory(
      () => GoldCubit(getGoldprice: sl(), getGoldprice_by_currencyType: sl()));

  //Usecases
  sl.registerLazySingleton(() => GetCurrenciesUseCases(sl()));
  sl.registerLazySingleton(() => GetGoldPriceUseCase(sl()));
  sl.registerLazySingleton(() => GetGoldPriceByCurrencyUseCase(sl()));

  //Repository
  sl.registerLazySingleton<CurrencyRepository>(() => CurrencyRepositoryImp(
      currenciesLocalDataSources: sl(),
      currenciesRemoteDataSources: sl(),
      networkInfo: sl()));
  sl.registerLazySingleton<GoldRepository>(
      () => GoldRepositoryImp(networkInfo: sl(), goldDataSource: sl()));

  //datasources

  sl.registerLazySingleton<CurrenciesRemoteDataSources>(
      () => CurrenciesRemoteDataSourcesImp(client: sl()));
  sl.registerLazySingleton<CurrenciesLocalDataSources>(
      () => CurrenciesLocalDataSourcesImp(sharedPreferences: sl()));
  sl.registerLazySingleton<GoldDataSource>(() => GoldDataSourceImp());

//! Core

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImp(sl()));

//! External

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
