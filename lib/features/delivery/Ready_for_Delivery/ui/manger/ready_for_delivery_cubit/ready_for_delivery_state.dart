part of 'ready_for_delivery_cubit.dart';

@immutable
sealed class ReadyForDeliveryState {}

final class ReadyForDeliveryInitial extends ReadyForDeliveryState {}

final class ReadyForDeliveryLoading extends ReadyForDeliveryState {}

final class ReadyForDeliverySuccess extends ReadyForDeliveryState {
  final List<ReadyForDeliveryEntity> delivery;

  ReadyForDeliverySuccess(this.delivery);
}

final class ReadyForDeliveryFailure extends ReadyForDeliveryState {
  final String errorMessage;

  ReadyForDeliveryFailure(this.errorMessage);
}
