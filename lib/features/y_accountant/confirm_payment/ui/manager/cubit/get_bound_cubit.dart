import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:test_order_life_cycle/features/y_accountant/confirm_payment/domin/entitnies/bound_entitny.dart';
import 'package:test_order_life_cycle/features/y_accountant/confirm_payment/domin/usecase/get_bound_usecase.dart';

part 'get_bound_state.dart';

class GetBoundCubit extends Cubit<GetBoundState> {
  final GetBoundUSeCase getCartItemUseCase;
  GetBoundCubit(this.getCartItemUseCase) : super(GetBoundInitial());
  Future<void> getBound() async {
    emit(GetBoundLodingCubit());
    final result = await getCartItemUseCase.execute();
    right(result).forEach((cart) {});
    result.fold(
        (failure) => emit(GetBoundFailureCubit(errorMessage: failure.message)),
        (cartItem) => emit(GetBoundSuccessCubit(boundEntitny: cartItem)));
  }
}
