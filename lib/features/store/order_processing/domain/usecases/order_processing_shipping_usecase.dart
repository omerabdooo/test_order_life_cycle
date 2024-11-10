import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:test_order_life_cycle/core/errors/failure.dart';
import 'package:test_order_life_cycle/core/use_cases/param_use_case.dart';
import 'package:test_order_life_cycle/features/store/order_processing/domain/entities/order_processing_shipping_entity.dart';
import 'package:test_order_life_cycle/features/store/order_processing/domain/repos/order_processing_repo.dart';

class OrderProcessingShippingUseCase extends UseCaseWithParam<
    OrderProcessingShippingEntity, OrderProcessingShippingParam> {
  final OrderProcessingRepo orderProcessingRepo;

  OrderProcessingShippingUseCase({required this.orderProcessingRepo});

  ///////////////////////////////////////////////////////////
  @override
  Future<Either<Failure, OrderProcessingShippingEntity>> execute(
      OrderProcessingShippingParam params) async {
    return await orderProcessingRepo.sendOrderProcessingShipping(
      ids: params.ids,
      shippingNumber: params.shippingNumbers,
      shippingCompany: params.shippingCompany,
      invoiceImage: params.invoiceImages,
    );
  }
}

class OrderProcessingShippingParam {
  final List<int> ids;
  final String shippingNumbers;
  final String shippingCompany;
  final File invoiceImages;

  OrderProcessingShippingParam({
    required this.ids,
    required this.shippingNumbers,
    required this.shippingCompany,
    required this.invoiceImages,
  });
}
