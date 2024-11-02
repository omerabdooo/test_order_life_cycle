part of 'parcel_delivery_cubit.dart';

@immutable
sealed class ParcelDeliveryState {}

final class ParcelDeliveryInitial extends ParcelDeliveryState {}

class ParcelDeliveryLoading extends ParcelDeliveryState {}

class ParcelDeliverySuccess extends ParcelDeliveryState {
  final String parcelDelivery;

  ParcelDeliverySuccess(this.parcelDelivery);
}

class ParcelDeliveryFailure extends ParcelDeliveryState {
  final String errorMessage;

  ParcelDeliveryFailure(this.errorMessage);
}

