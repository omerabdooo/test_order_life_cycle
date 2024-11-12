import 'package:dartz/dartz.dart';
import 'package:test_order_life_cycle/core/errors/failure.dart';
import 'package:test_order_life_cycle/features/k_accounant/confirm_payment/domain/approve_invoice_entity.dart';
import 'package:test_order_life_cycle/features/k_accounant/confirm_payment/domain/choose_type_of_invoice_entity.dart';
import 'package:test_order_life_cycle/features/k_accounant/confirm_payment/domain/payment_bills_to_confirm_entity.dart';

abstract class PaymentBillsRepo {
  Future<Either<Failure, List<PaymentBillsToConfirmEntity>>>
      getPaymentBillsToConfirm();
  Future<Either<Failure, ApproveInvoiceEntity>> approveInvoice(
      String invoiceId);
  Future<Either<Failure, ChooseTypeOfInvoiceEntity>> chooseTypeOfInvoice(
      int invoiceType, String invoiceId);
}
