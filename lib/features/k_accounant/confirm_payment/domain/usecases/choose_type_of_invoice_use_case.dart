import 'package:dartz/dartz.dart';
import 'package:test_order_life_cycle/core/errors/failure.dart';
import 'package:test_order_life_cycle/core/use_cases/param_use_case.dart';
import 'package:test_order_life_cycle/features/k_accounant/confirm_payment/domain/choose_type_of_invoice_entity.dart';
import 'package:test_order_life_cycle/features/k_accounant/confirm_payment/domain/repo/payment_bills_repo.dart';

class ChooseTypeOfInvoiceUseCase extends UseCaseWithParam<
    ChooseTypeOfInvoiceEntity, ChooseTypeOfInvoiceParams> {
  final PaymentBillsRepo paymentBillsRepo;

  ChooseTypeOfInvoiceUseCase(this.paymentBillsRepo);

  @override
  Future<Either<Failure, ChooseTypeOfInvoiceEntity>> execute(
      ChooseTypeOfInvoiceParams params) {
    return paymentBillsRepo.chooseTypeOfInvoice(
        params.invoiceType, params.invoiceId);
  }
}

class ChooseTypeOfInvoiceParams {
  final int invoiceType;
  final String invoiceId;

  ChooseTypeOfInvoiceParams(this.invoiceType, this.invoiceId);
}
