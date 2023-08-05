import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/gold.dart';
import '../repositories/gold_repository.dart';

class GetGoldPriceByCurrencyUseCase {
  final GoldRepository goldRepository;

  GetGoldPriceByCurrencyUseCase(this.goldRepository);
  
  Future<Either<Failure, Gold>> call(double currencytype) {
    return goldRepository.getGoldpriceBycurrency(currencytype);
  }
}
