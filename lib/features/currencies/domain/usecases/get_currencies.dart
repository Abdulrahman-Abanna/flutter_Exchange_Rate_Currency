import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/currency.dart';
import '../repositories/currency_repository.dart';

class GetCurrenciesUseCases {
  final CurrencyRepository repository;

  GetCurrenciesUseCases(this.repository);
  
  Future<Either<Failure, List<Currency>>> call() {
      return repository.getCurrencies();
  }
}
