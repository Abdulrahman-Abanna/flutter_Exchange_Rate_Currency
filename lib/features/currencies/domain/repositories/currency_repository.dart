import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/currency.dart';

abstract class CurrencyRepository {
  Future<Either<Failure, List<Currency>>> getCurrencies();
}
