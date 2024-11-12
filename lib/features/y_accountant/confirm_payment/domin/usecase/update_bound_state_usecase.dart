import 'package:dartz/dartz.dart';
import 'package:test_order_life_cycle/core/errors/failure.dart';
import 'package:test_order_life_cycle/core/use_cases/param_use_case.dart';
import 'package:test_order_life_cycle/features/y_accountant/confirm_payment/domin/entitnies/bound_entitny.dart';
import 'package:test_order_life_cycle/features/y_accountant/confirm_payment/domin/entitnies/update_bound_state_entinty.dart';
import 'package:test_order_life_cycle/features/y_accountant/confirm_payment/domin/repo/y_accontant_repo.dart';

class UpdateBoundStateUsecase
    extends UseCaseWithParam<BoundEntitny, BoundParameter> {
  final YAccontantRepo yAccontantRepo;

  UpdateBoundStateUsecase({required this.yAccontantRepo});

  @override
  Future<Either<Failure, BoundEntitny>> execute(BoundParameter params) {
    return yAccontantRepo.updateBoundState(params.boundId, params.action);
  }
}

class BoundParameter {
  final int boundId;
  final String action;

  BoundParameter({required this.boundId, required this.action});
}
