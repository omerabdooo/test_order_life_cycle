import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:test_order_life_cycle/core/errors/failure.dart';
import 'package:test_order_life_cycle/features/store/order_processing/domain/entities/order_processing_shipping_entity.dart';
import 'package:test_order_life_cycle/features/store/order_processing/domain/usecases/order_processing_shipping_usecase.dart';

part 'shipping_state.dart';

class ShippingCubit extends Cubit<ShippingState> {
  ShippingCubit(this.orderProcessingShippingUseCase) : super(ShippingInitial());
  final OrderProcessingShippingUseCase orderProcessingShippingUseCase;
  Future<void> fechOrderShipping(
    List<int> ids,
    String shippingCompany,
    File invoiceImage,
    String shippingNumbers,
  ) async {
    emit(OrderProcessingShippingLoading());
    try {
      var params = OrderProcessingShippingParam(
        ids: ids,
        shippingNumbers: shippingNumbers,
        shippingCompany: shippingCompany,
        invoiceImages: invoiceImage,
      );
      final result = await orderProcessingShippingUseCase.execute(params);

      result.fold(
          (failure) =>
              emit(OrderProcessingShippingFailuer(errMessage: failure.message)),
          (serverMessage) {
        if (serverMessage.isSuccess == true) {
          emit(OrderProcessingShippingSuccess(serverMessage: serverMessage));
          print("Omar and Qais");
        } else {
          emit(OrderProcessingShippingFailuer(
              errMessage: serverMessage.serverMessage));
          print("fjdiofghsjkdfhsjkahfjkhglk");
        }
      });
    } catch (e) {
      if (e is DioException) {
        ServerFailure failure = ServerFailure.fromDioError(e);
        emit(OrderProcessingShippingFailuer(errMessage: failure.message));
      } else {
        emit(OrderProcessingShippingFailuer(errMessage: e.toString()));
      }
    }
  }
}
