import 'package:dartz/dartz.dart';
import 'package:test_order_life_cycle/core/errors/failure.dart';
import 'package:test_order_life_cycle/core/use_cases/param_use_case.dart';
import 'package:test_order_life_cycle/features/k_accounant/confirm_payment/domain/payment_bills_to_confirm_entity.dart';
import 'package:test_order_life_cycle/features/k_accounant/confirm_payment/domain/repo/payment_bills_repo.dart';

class GetPaymentBillsToConfirmUseCase
    extends UseCaseWithParam<List<PaymentBillsToConfirmEntity>, NoParams> {
  final PaymentBillsRepo paymentRepo;

  GetPaymentBillsToConfirmUseCase(this.paymentRepo);

  @override
  Future<Either<Failure, List<PaymentBillsToConfirmEntity>>> execute(
      NoParams params) {
    return paymentRepo.getPaymentBillsToConfirm();
  }
}

class NoParams {}
