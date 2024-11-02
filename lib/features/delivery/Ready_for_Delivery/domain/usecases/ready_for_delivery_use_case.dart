import 'package:dartz/dartz.dart';
import 'package:test_order_life_cycle/core/errors/failure.dart';
import 'package:test_order_life_cycle/core/use_cases/no_param_use_case.dart';
import 'package:test_order_life_cycle/features/delivery/Ready_for_Delivery/domain/entities/ready_for_delivery_entity.dart';
import 'package:test_order_life_cycle/features/delivery/Ready_for_Delivery/domain/repo/parcel_delivery_repo.dart';

class ReadyForDeliveryUseCase extends UseCaseWithNoParam {
  final ReadyForDeliveryRepo readyForDeliveryRepo;

  ReadyForDeliveryUseCase(this.readyForDeliveryRepo);

  @override
  Future<Either<Failure, List<ReadyForDeliveryEntity>?>> execute() {
    return readyForDeliveryRepo.readyForDelivery();
  }
}
