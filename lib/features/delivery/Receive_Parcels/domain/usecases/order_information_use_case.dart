// import 'package:dartz/dartz.dart';
// import 'package:test_order_life_cycle/core/errors/failure.dart';
// import 'package:test_order_life_cycle/core/use_cases/param_use_case.dart';
// import 'package:test_order_life_cycle/features/delivery/Receive_Parcels/domain/entities/orde_information_entity.dart';
// import 'package:test_order_life_cycle/features/delivery/Receive_Parcels/domain/repo/receive_parcels_repo.dart';

// class GetOrderInformationUseCase
//     extends UseCaseWithParam<OrderInformationEntity, OrderInformationParameter> {
//   final ReceiveParcelsRepo receiveParcelsRepo;

//   GetOrderInformationUseCase(this.receiveParcelsRepo);

//   @override
//   Future<Either<Failure, OrderInformationEntity>> execute(
//       OrderInformationParameter params) {
//     return receiveParcelsRepo.getOrderInformation(parcelId: params.parcelId);
//   }
// }

// class OrderInformationParameter {
//   final int parcelId;

//   OrderInformationParameter(this.parcelId);
// }
