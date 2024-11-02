import 'package:dartz/dartz.dart';
import 'package:test_order_life_cycle/core/errors/failure.dart';
import 'package:test_order_life_cycle/core/use_cases/param_use_case.dart';
import 'package:test_order_life_cycle/features/delivery/Receive_Parcels/domain/entities/order_information.dart';
import 'package:test_order_life_cycle/features/delivery/Receive_Parcels/domain/repo/receive_parcels_repo.dart';

class GetOrderInformationUseCase
    extends UseCaseWithParam<OrderInformationEntity, OrderInformationParams> {
  final ReceiveParcelsRepo receiveParcelsRepo;

  GetOrderInformationUseCase(this.receiveParcelsRepo);

  @override
  Future<Either<Failure, OrderInformationEntity>> execute(
      OrderInformationParams params) {
    return receiveParcelsRepo.getOrderInformation(params.parcelId);
  }
}

class OrderInformationParams {
  final int parcelId;

  OrderInformationParams(this.parcelId);
}
