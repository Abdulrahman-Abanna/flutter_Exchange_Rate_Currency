import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/gold.dart';

abstract class GoldRepository{
  Future<Either<Failure,Gold>> getGoldprice();
  Future<Either<Failure,Gold>> getGoldpriceBycurrency(double currency);
}