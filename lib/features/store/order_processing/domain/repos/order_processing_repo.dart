import 'package:dartz/dartz.dart';
import 'package:test_order_life_cycle/core/errors/failure.dart';

import '../entities/order_processing_entity.dart';

abstract class OrderProcessingRepo {
  Future<Either<Failure, List<OrderProcessingEntity>>> fetchOrderProcessing(
      {required String storeId, required int orderId});
}
