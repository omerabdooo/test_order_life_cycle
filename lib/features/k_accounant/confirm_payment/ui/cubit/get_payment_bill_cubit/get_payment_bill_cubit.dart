import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_order_life_cycle/features/k_accounant/confirm_payment/domain/payment_bills_to_confirm_entity.dart';
import 'package:test_order_life_cycle/features/k_accounant/confirm_payment/domain/usecases/get_payment_bills_to_confirm_use_case.dart';

part 'get_payment_bill_state.dart';

class GetPaymentBillCubit extends Cubit<GetPaymentBillState> {
  final GetPaymentBillsToConfirmUseCase getPaymentBillsToConfirmUseCase;

  GetPaymentBillCubit(this.getPaymentBillsToConfirmUseCase)
      : super(GetPaymentBillInitial());

  Future<void> getPaymentBillsToConfirm() async {
    emit(GetPaymentBillLoading());
    final result = await getPaymentBillsToConfirmUseCase.execute(NoParams());
    result.fold(
      (failure) => emit(GetPaymentBillFailuer(errMessage: failure.message)),
      (paymentBills) => emit(GetPaymentBillSuccess(paymentBills: paymentBills)),
    );
  }
}
