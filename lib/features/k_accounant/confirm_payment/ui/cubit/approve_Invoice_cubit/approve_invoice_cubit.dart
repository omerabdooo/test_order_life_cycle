import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_order_life_cycle/features/k_accounant/confirm_payment/domain/approve_invoice_entity.dart';
import 'package:test_order_life_cycle/features/k_accounant/confirm_payment/domain/usecases/approve_invoice_use_case.dart';

part 'approve_invoice_state.dart';

class ApproveInvoiceCubit extends Cubit<ApproveInvoiceState> {
  final ApproveInvoiceUseCase approveInvoiceUseCase;

  ApproveInvoiceCubit(this.approveInvoiceUseCase)
      : super(ApproveInvoiceInitial());

  Future<void> approveInvoice(String invoiceId) async {
    emit(ApproveInvoiceLoading());
    var params = ApproveInvoiceParams(invoiceId);
    final result = await approveInvoiceUseCase.execute(params);
    result.fold(
      (failure) => emit(ApproveInvoiceFailure(
          invoiceId: int.parse(invoiceId), errorMessage: failure.message)),
      (invoice) {
        if (invoice.isSuccess == true) {
          emit(ApproveInvoiceSuccess(approveInvoiceEntity: invoice));
        } else {
          emit(ApproveInvoiceFailure(
          invoiceId: int.parse(invoiceId), errorMessage: invoice.serverMessage));
        }
      },
    );
  }
}
