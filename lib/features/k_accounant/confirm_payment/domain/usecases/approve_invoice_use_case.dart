import 'package:dartz/dartz.dart';
import 'package:test_order_life_cycle/core/errors/failure.dart';
import 'package:test_order_life_cycle/core/use_cases/param_use_case.dart';
import 'package:test_order_life_cycle/features/k_accounant/confirm_payment/domain/approve_invoice_entity.dart';
import 'package:test_order_life_cycle/features/k_accounant/confirm_payment/domain/repo/payment_bills_repo.dart';

class ApproveInvoiceUseCase
    extends UseCaseWithParam<ApproveInvoiceEntity, ApproveInvoiceParams> {
  final PaymentBillsRepo paymentBillsRepo;

  ApproveInvoiceUseCase(this.paymentBillsRepo);

  @override
  Future<Either<Failure, ApproveInvoiceEntity>> execute(
      ApproveInvoiceParams params) {
    return paymentBillsRepo.approveInvoice(params.invoiceId);
  }
}

class ApproveInvoiceParams {
  final String invoiceId;

  ApproveInvoiceParams(this.invoiceId);
}
