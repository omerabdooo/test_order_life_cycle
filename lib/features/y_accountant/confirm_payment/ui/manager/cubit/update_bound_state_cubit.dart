import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_order_life_cycle/features/y_accountant/confirm_payment/domin/entitnies/bound_entitny.dart';
import 'package:test_order_life_cycle/features/y_accountant/confirm_payment/domin/entitnies/update_bound_state_entinty.dart';
import 'package:test_order_life_cycle/features/y_accountant/confirm_payment/domin/usecase/update_bound_state_usecase.dart';

part 'update_bound_state_state.dart';

class UpdateBoundStateCubit extends Cubit<UpdateBoundStateState> {
  final UpdateBoundStateUsecase updateBoundStateUsecase;
  UpdateBoundStateCubit(this.updateBoundStateUsecase)
      : super(UpdateBoundStateInitial());
  Future<void> updateBoundState(int boundId, String action) async {
    emit(UpdateBoundStateCubitLoading());
    var params = BoundParameter(boundId: boundId, action: action);
    final result = await updateBoundStateUsecase.execute(params);
    result.fold(
        (failure) => emit(UpdateBoundStateCubitFailure(
            errorMessage: failure.message, boundId)),
        (cartItem) => emit(
            UpdateBoundStateCubitSuccess(boundEntitny: cartItem)));
    ;
  }
}
