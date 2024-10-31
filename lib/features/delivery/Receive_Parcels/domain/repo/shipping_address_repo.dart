import 'package:dartz/dartz.dart';
import 'package:test_order_life_cycle/core/errors/failure.dart';
import 'package:test_order_life_cycle/features/delivery/Receive_Parcels/domain/entities/receive_parcels_entity.dart';

abstract class ShippingAddressRepo {
  //Future<Either<Failure, CustomerAddressEntity>> getAllCustomerAddress();
  Future<Either<Failure, ReceiveParcelsEntity>> addNewCustomerAddress(
    int orderId,
    int status,
  );
}
