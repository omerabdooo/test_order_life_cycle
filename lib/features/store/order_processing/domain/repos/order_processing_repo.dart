import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:test_order_life_cycle/core/errors/failure.dart';
import 'package:test_order_life_cycle/features/store/order_processing/domain/entities/order_processing_bill_entity.dart';

import '../entities/order_processing_entity.dart';

abstract class OrderProcessingRepo {
  Future<Either<Failure, List<OrderProcessingEntity>>> fetchOrderProcessing(
      {required int orderId});
  //////////////////////////////////////////////////////////////////////////
  Future<Either<Failure, OrderProcessingBillEntity>> fetchOrderProcessingBill(
      {required List<int> ids,
      required String invoiceNumber,
      required num invoiceAmount,
      required File invoiceImage,
      required DateTime invoiceDate});
}
