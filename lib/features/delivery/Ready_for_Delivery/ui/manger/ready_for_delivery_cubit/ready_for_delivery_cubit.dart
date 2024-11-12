import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_order_life_cycle/features/delivery/Ready_for_Delivery/domain/entities/ready_for_delivery_entity.dart';
import 'package:test_order_life_cycle/features/delivery/Ready_for_Delivery/domain/usecases/ready_for_delivery_use_case.dart';

part 'ready_for_delivery_state.dart';

class ReadyForDeliveryCubit extends Cubit<ReadyForDeliveryState> {
  final GetAllReadyForDeliveryUseCase getAllReadyForDeliveryUseCase;
  ReadyForDeliveryCubit(this.getAllReadyForDeliveryUseCase)
      : super(ReadyForDeliveryInitial());
  Future<void> getAllReadyForDelivery() async {
    emit(ReadyForDeliveryLoading());

    final result = await getAllReadyForDeliveryUseCase.execute();
    result.fold((failure) => emit(ReadyForDeliveryFailure(failure.message)),
        (delivery) {
      if (delivery != null) {
        emit(ReadyForDeliverySuccess(delivery));
      } else {
        emit(ReadyForDeliveryFailure("Noting Ready For Delivery found"));
      }
    });
  }
}
