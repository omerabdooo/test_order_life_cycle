import 'package:dartz/dartz.dart';
import 'package:test_order_life_cycle/core/errors/failure.dart';
import 'package:test_order_life_cycle/features/y_accountant/confirm_payment/domin/entitnies/bound_entitny.dart';
import 'package:test_order_life_cycle/features/y_accountant/confirm_payment/domin/entitnies/update_bound_state_entinty.dart';

abstract class YAccontantRepo {
  Future<Either<Failure, List<BoundEntitny>>> getBound();
  Future<Either<Failure, UpdateBoundStateEntinty>> updateBoundState(
      int boundId, String action);
}
