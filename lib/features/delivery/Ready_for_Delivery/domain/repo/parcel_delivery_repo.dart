import 'package:dartz/dartz.dart';
import 'package:test_order_life_cycle/core/errors/failure.dart';
import 'package:test_order_life_cycle/features/delivery/Ready_for_Delivery/domain/entities/ready_for_delivery_entity.dart';

abstract class ReadyForDeliveryRepo {
  Future<Either<Failure, List<ReadyForDeliveryEntity>>> readyForDelivery();
}
