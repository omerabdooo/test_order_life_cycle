import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_order_life_cycle/features/k_accounant/confirm_payment/domain/choose_type_of_invoice_entity.dart';
import 'package:test_order_life_cycle/features/k_accounant/confirm_payment/domain/usecases/choose_type_of_invoice_use_case.dart';

part 'choose_type_of_invoice_state.dart';

class ChooseTypeOfInvoiceCubit extends Cubit<ChooseTypeOfInvoiceState> {
  final ChooseTypeOfInvoiceUseCase chooseTypeOfInvoiceUseCase;
  ChooseTypeOfInvoiceCubit(this.chooseTypeOfInvoiceUseCase) : super(ChooseTypeOfInvoiceInitial());
 
Future<void> chooseTypeOfInvoice(int invoiceType,String invoiceId) async {
  emit(ChooseTypeOfInvoiceLoading());
  var params = ChooseTypeOfInvoiceParams(invoiceType,invoiceId);
  final result = await chooseTypeOfInvoiceUseCase.execute(params);
  result.fold(
    (failure) => emit(ChooseTypeOfInvoiceFailure(
        invoiceId: int.parse(invoiceId), errorMessage: failure.message)),
    // (invoice) => emit(ChooseTypeOfInvoiceSuccess(chooseTypeOfInvoiceEntity: invoice)),
          (invoice) {
        if (invoice.isSuccess == true) {
          emit(ChooseTypeOfInvoiceSuccess(chooseTypeOfInvoiceEntity: invoice));
        } else {
          emit(ChooseTypeOfInvoiceFailure(
          invoiceId: int.parse(invoiceId), errorMessage: invoice.serverMessage));
        }
      },
  );
}
}
