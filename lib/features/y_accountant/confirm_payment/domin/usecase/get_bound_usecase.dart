import 'package:dartz/dartz.dart';
import 'package:test_order_life_cycle/core/errors/failure.dart';
import 'package:test_order_life_cycle/core/use_cases/no_param_use_case.dart';
import 'package:test_order_life_cycle/features/y_accountant/confirm_payment/domin/repo/y_accontant_repo.dart';

class GetBoundUSeCase extends UseCaseWithNoParam {
  final YAccontantRepo yAccontantRepo;

  GetBoundUSeCase({required this.yAccontantRepo});

  @override
  Future<Either<Failure, dynamic>> execute() {
    return yAccontantRepo.getBound();
  }
}
