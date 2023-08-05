import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/gold.dart';
import '../repositories/gold_repository.dart';

class GetGoldPriceUseCase {
  final GoldRepository goldRepository;

  GetGoldPriceUseCase(this.goldRepository);
  Future<Either<Failure, Gold>> call() {
    return goldRepository.getGoldprice();
  }
}
