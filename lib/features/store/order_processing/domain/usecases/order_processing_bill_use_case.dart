import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:test_order_life_cycle/core/errors/failure.dart';
import 'package:test_order_life_cycle/core/use_cases/param_use_case.dart';
import 'package:test_order_life_cycle/features/store/order_processing/domain/entities/order_processing_bill_entity.dart';
import 'package:test_order_life_cycle/features/store/order_processing/domain/repos/order_processing_repo.dart';

class OrderProcessingBillUseCase extends UseCaseWithParam<
    OrderProcessingBillEntity, OrderProcessingBillParam> {
  final OrderProcessingRepo orderProcessingRepo;

  OrderProcessingBillUseCase({required this.orderProcessingRepo});

  ///////////////////////////////////////////////////////////
  @override
  Future<Either<Failure, OrderProcessingBillEntity>> execute(
      OrderProcessingBillParam params) async {
    return await orderProcessingRepo.fetchOrderProcessingBill(
      ids: params.ids,
      invoiceNumber: params.invoiceNumbers,
      invoiceAmount: params.invoiceAmounts,
      invoiceImage: params.invoiceImages,
      invoiceDate: params.invoiceDate,
    );
  }
}

class OrderProcessingBillParam {
  final List<int> ids;
  final String invoiceNumbers;
  final num invoiceAmounts;
  final File invoiceImages;
  final DateTime invoiceDate;

  OrderProcessingBillParam({
    required this.ids,
    required this.invoiceNumbers,
    required this.invoiceAmounts,
    required this.invoiceImages,
    required this.invoiceDate,
  });
}
