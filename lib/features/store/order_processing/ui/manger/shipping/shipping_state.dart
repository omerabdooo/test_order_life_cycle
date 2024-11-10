part of 'shipping_cubit.dart';

@immutable
sealed class ShippingState {}

final class ShippingInitial extends ShippingState {}

final class OrderProcessingShippingLoading extends ShippingState {}

final class OrderProcessingShippingFailuer extends ShippingState {
  final String errMessage;

  OrderProcessingShippingFailuer({required this.errMessage});
}

final class OrderProcessingShippingSuccess extends ShippingState {
  final OrderProcessingShippingEntity serverMessage;

  OrderProcessingShippingSuccess({required this.serverMessage});
}
