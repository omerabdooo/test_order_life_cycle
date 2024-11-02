part of 'order_information_cubit.dart';

@immutable
sealed class OrderInformationState {}

final class OrderInformationInitial extends OrderInformationState {}

final class OrderInformationLoading extends OrderInformationState {}

final class OrderInformationSuccess extends OrderInformationState {
  final OrderInformationEntity orderInformation;

  OrderInformationSuccess(this.orderInformation);
}

final class OrderInformationFailure extends OrderInformationState {
  final String errorMessage;

  OrderInformationFailure(this.errorMessage);
}
