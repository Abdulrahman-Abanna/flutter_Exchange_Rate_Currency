import 'package:dartz/dartz.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/networkinfo.dart';
import '../../domain/entities/currency.dart';
import '../../domain/repositories/currency_repository.dart';
import '../datasources/currencies_local_datasources.dart';
import '../datasources/currencies_remote_datasourses.dart';

class CurrencyRepositoryImp implements CurrencyRepository {
  final CurrenciesRemoteDataSources currenciesRemoteDataSources;
  final CurrenciesLocalDataSources currenciesLocalDataSources;
  final NetworkInfo networkInfo;

  CurrencyRepositoryImp(
      {required this.currenciesLocalDataSources,
      required this.currenciesRemoteDataSources,
      required this.networkInfo});
  @override
  Future<Either<Failure, List<Currency>>> getCurrencies() async {
    if (await networkInfo.isConnectd) {
      try {
        final remoteCurrnceies =await currenciesRemoteDataSources.getCurrenies();
        final updatetime_last = currenciesRemoteDataSources.UpdateTimeLast();
        AppConstants.datetime = updatetime_last;
        AppConstants.currenciesList = remoteCurrnceies;

        currenciesLocalDataSources.CacheCurrencies(remoteCurrnceies);
        currenciesLocalDataSources.CacheUpdateTimeLast(updatetime_last);

        return Right(remoteCurrnceies);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      try {

        final localCurrencies =
            await currenciesLocalDataSources.getCacheCurrencies();
        AppConstants.datetime = currenciesLocalDataSources.getCacheUpdateTimeLast();
        AppConstants.currenciesList = localCurrencies;

        return Right(localCurrencies);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }


}
