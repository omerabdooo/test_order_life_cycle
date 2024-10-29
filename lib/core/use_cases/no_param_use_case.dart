import 'package:dartz/dartz.dart';
import 'package:test_order_life_cycle/core/errors/failure.dart';
// UseCase With No Parameters

abstract class UseCaseWithNoParam<type> {
  Future<Either<Failure, type>> execute();
}
