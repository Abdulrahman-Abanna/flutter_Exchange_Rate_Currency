import 'package:dartz/dartz.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/networkinfo.dart';
import '../../domain/entities/gold.dart';
import '../../domain/repositories/gold_repository.dart';
import '../datasources/gold_data_source.dart';

class GoldRepositoryImp implements GoldRepository {
  final GoldDataSource goldDataSource;
  final NetworkInfo networkInfo;

  GoldRepositoryImp({required this.networkInfo, required this.goldDataSource});
  @override
  Future<Either<Failure, Gold>> getGoldprice() async {
    if (await networkInfo.isConnectd) {
      try {
        final datasourceGold = await goldDataSource.GetGoldprice();
        return Right(datasourceGold);
      } on OfflineException {
        return left(OfflineFailure());
      }
    } else {
      try {
        final datasourceGold = await goldDataSource.GetGoldprice();
        return Right(datasourceGold);
      } on OfflineException {
        return left(OfflineFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Gold>> getGoldpriceBycurrency(double currency) async {
    final datasouce = await goldDataSource.GetGoldpriceByCurrency(currency);
    return Right(datasouce);
  }
}
