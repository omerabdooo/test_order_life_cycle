// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:test_order_life_cycle/features/delivery/Receive_Parcels/domain/entities/order_information_entity.dart';
// import 'package:test_order_life_cycle/features/delivery/Receive_Parcels/domain/usecases/order_information_use_case.dart';

// part 'order_information_state.dart';

// class OrderInformationCubit extends Cubit<OrderInformationState> {
//   GetOrderInformationUseCase getProductDetialsUseCase;
//   OrderInformationCubit(
//     this.getProductDetialsUseCase,
//   ) : super(OrderInformationInitial());
//   Future<void> getProductDetials(productId) async {
//     emit(OrderInformationLoading());

//     var params = OrderInformationParameter(productId);
//     final result = await getProductDetialsUseCase.execute(params);

//     result.fold((failure) => emit(OrderInformationFailure(failure.message)),
//         (fProductEntity) => emit(OrderInformationSuccess(fProductEntity)));
//   }
// }
