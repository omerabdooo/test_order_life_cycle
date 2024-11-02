import 'package:dartz/dartz.dart';
import 'package:test_order_life_cycle/core/errors/failure.dart';
import 'package:test_order_life_cycle/core/use_cases/param_use_case.dart';
import 'package:test_order_life_cycle/features/delivery/Receive_Parcels/domain/entities/receive_parcels_entity.dart';
import 'package:test_order_life_cycle/features/delivery/Receive_Parcels/domain/repo/receive_parcels_repo.dart';

class ReceiveParcelsUseCase
    extends UseCaseWithParam<ReceiveParcelsEntity, ReceiveParcelsParams> {
  final ReceiveParcelsRepo receiveParcelsRepo;

  ReceiveParcelsUseCase(this.receiveParcelsRepo);

  @override
  Future<Either<Failure, ReceiveParcelsEntity>> execute(
      ReceiveParcelsParams params) {
    return receiveParcelsRepo.receiveParcels(
      params.parcelId,
      params.status,
    );
  }
}

class ReceiveParcelsParams {
  final int parcelId;
  final int status;

  ReceiveParcelsParams(this.parcelId, this.status);
}
