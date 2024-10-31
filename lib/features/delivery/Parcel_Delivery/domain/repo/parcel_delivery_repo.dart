import 'package:dartz/dartz.dart';
import 'package:test_order_life_cycle/core/errors/failure.dart';
import 'package:test_order_life_cycle/features/delivery/Parcel_Delivery/domain/entities/parcel_delivery_entity.dart';

abstract class ParcelDeliveryRepo {
  //Future<Either<Failure, CustomerAddressEntity>> getAllCustomerAddress();
  Future<Either<Failure, ParcelDeliveryEntity>> parcelDelivery(
    int orderId,
    String receiptCode,
    int status,
  );
}
