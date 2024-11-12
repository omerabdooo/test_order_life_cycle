import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:test_order_life_cycle/core/errors/failure.dart';
import 'package:test_order_life_cycle/features/store/order_processing/domain/entities/order_processing_bill_entity.dart';
import 'package:test_order_life_cycle/features/store/order_processing/domain/entities/order_processing_shipping_entity.dart';

import '../entities/order_processing_entity.dart';

abstract class OrderProcessingRepo {
  Future<Either<Failure, List<OrderProcessingEntity>>> fetchOrderProcessing(
      {required int orderId,
      required String orderNum,
      required String orderDate,
      required String productNum});
  //////////////////////////////////////////////////////////////////////////
  Future<Either<Failure, OrderProcessingBillEntity>> fetchOrderProcessingBill(
      {required List<int> ids,
      required String invoiceNumber,
      required num invoiceAmount,
      required File invoiceImage,
      required DateTime invoiceDate});

  Future<Either<Failure, OrderProcessingShippingEntity>>
      sendOrderProcessingShipping({
    required List<int> ids,
    required String shippingNumber,
    required String shippingCompany,
    required File invoiceImage,
  });
}
