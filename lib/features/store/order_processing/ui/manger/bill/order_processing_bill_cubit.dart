import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:test_order_life_cycle/core/errors/failure.dart';
import 'package:test_order_life_cycle/features/store/order_processing/domain/entities/order_processing_bill_entity.dart';
import 'package:test_order_life_cycle/features/store/order_processing/domain/entities/order_processing_entity.dart';
import 'package:test_order_life_cycle/features/store/order_processing/domain/usecases/order_processing_bill_use_case.dart';

part 'order_processing_bill_state.dart';

class OrderProcessingBillCubit extends Cubit<OrderProcessingBillState> {
  OrderProcessingBillCubit(this.orderProcessingBillUseCase)
      : super(OrderProcessingBillInitial());
  final OrderProcessingBillUseCase orderProcessingBillUseCase;
  Future<void> fechOrderBill(String invoiceAmount, File invoiceImage,
      Object invoiceNumber, DateTime invoiceDate) async {
    emit(OrderProcessingBillLoading());
    try {
      var params = OrderProcessingBillParam(
        invoiceAmounts: invoiceAmount,
        invoiceNumbers: invoiceNumber,
        invoiceImages: invoiceImage,
        invoiceDate: invoiceDate,
      );
      final result = await orderProcessingBillUseCase.execute(params);

      result.fold(
          (failure) =>
              emit(OrderProcessingBillFailuer(errMessage: failure.message)),
          (bill) {
        if (bill.isSuccess == true) {
          emit(OrderProcessingBillSuccess(bill: bill));
        } else {
          emit(OrderProcessingBillFailuer(errMessage: bill.serverMessage));
        }
      });
    } catch (e) {
      if (e is DioException) {
        ServerFailure failure = ServerFailure.fromDioError(e);
        emit(OrderProcessingBillFailuer(errMessage: failure.message));
      } else {
        emit(OrderProcessingBillFailuer(errMessage: e.toString()));
      }
    }
    // var result = await orderProcessingBillUseCase.execute(
    //     OrderProcessingBillParam(
    //         invoiceNumber: invoiceNumber,
    //         invoiceAmount: invoiceAmount,
    //         invoiceImage: invoiceImage));
    // result.fold((failuer) {
    //   emit(
    //     OrderProcessingBillFailuer(errMessage: failuer.message),
    //   );
    // }, (bill) {
    //   emit(
    //     OrderProcessingBillSuccess(bill: bill),
    //   );
    // });
  }
}
