import 'package:dartz/dartz.dart';
import 'package:test_order_life_cycle/core/errors/failure.dart';
import 'package:test_order_life_cycle/features/delivery/Receive_Parcels/domain/entities/order_information.dart';
import 'package:test_order_life_cycle/features/delivery/Receive_Parcels/domain/entities/receive_parcels_entity.dart';

abstract class ReceiveParcelsRepo {
  Future<Either<Failure, OrderInformationEntity>> getOrderInformation(int parcelId);
  Future<Either<Failure, ReceiveParcelsEntity>> receiveParcels(
    int parcelId,
    int status,
  );
}
