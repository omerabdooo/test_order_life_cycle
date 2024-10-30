part of 'order_processing_cubit.dart';

@immutable
sealed class OrderProcessingState {}

final class OrderProcessingInitial extends OrderProcessingState {}

final class OrderProcessingLoading extends OrderProcessingState {}

final class OrderProcessingFailuer extends OrderProcessingState {
  final String errMessage;

  OrderProcessingFailuer({required this.errMessage});
}

final class OrderProcessingSuccess extends OrderProcessingState {
  final List<OrderProcessingEntity> orders;

  OrderProcessingSuccess({required this.orders});
}
