import 'package:dartz/dartz.dart';
import 'package:test_order_life_cycle/core/errors/failure.dart';

// UseCase With Parameters

abstract class UseCaseWithParam<type, params> {
  Future<Either<Failure, type>> execute(params params);
}
