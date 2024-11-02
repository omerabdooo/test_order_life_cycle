import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_order_life_cycle/features/delivery/Receive_Parcels/domain/entities/order_information.dart';
import 'package:test_order_life_cycle/features/delivery/Receive_Parcels/domain/usecases/order_information_use_case.dart';

part 'order_information_state.dart';

class OrderInformationCubit extends Cubit<OrderInformationState> {
  GetOrderInformationUseCase getOrderInformationUseCase;
  OrderInformationCubit(
    this.getOrderInformationUseCase,
  ) : super(OrderInformationInitial());
  Future<void> getOrderInformation(parcelId) async {
    emit(OrderInformationLoading());

    var params = OrderInformationParams(parcelId);
    final result = await getOrderInformationUseCase.execute(params);

    result.fold((failure) => emit(OrderInformationFailure(failure.message)),
        (productDetails) => emit(OrderInformationSuccess(productDetails)));
  }

}
