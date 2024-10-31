import 'package:dartz/dartz.dart';
import 'package:test_order_life_cycle/core/errors/failure.dart';
import 'package:test_order_life_cycle/core/use_cases/param_use_case.dart';
import 'package:test_order_life_cycle/features/delivery/Parcel_Delivery/domain/entities/parcel_delivery_entity.dart';
import 'package:test_order_life_cycle/features/delivery/Parcel_Delivery/domain/repo/parcel_delivery_repo.dart';

class ParcelDeliveryUseCase
    extends UseCaseWithParam<ParcelDeliveryEntity, ParcelDeliveryParams> {
  final ParcelDeliveryRepo parcelDeliveryRepo;

  ParcelDeliveryUseCase(this.parcelDeliveryRepo);

  @override
  Future<Either<Failure, ParcelDeliveryEntity>> execute(
      ParcelDeliveryParams params) {
    return parcelDeliveryRepo.parcelDelivery(
        params.orderId, 
        params.receiptCode, 
        params.status,
        );
  }
}

class ParcelDeliveryParams {
   final int orderId;
   final String receiptCode;
   final int status;

  ParcelDeliveryParams(
    this.orderId, 
    this.receiptCode, 
    this.status

  );
}
