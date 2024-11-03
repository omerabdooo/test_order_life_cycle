part of 'order_processing_bill_cubit.dart';

@immutable
sealed class OrderProcessingBillState {}

final class OrderProcessingBillInitial extends OrderProcessingBillState {}

final class OrderProcessingBillLoading extends OrderProcessingBillState {}

final class OrderProcessingBillFailuer extends OrderProcessingBillState {
  final String errMessage;

  OrderProcessingBillFailuer({required this.errMessage});
}

final class OrderProcessingBillSuccess extends OrderProcessingBillState {
  final OrderProcessingBillEntity bill;

  OrderProcessingBillSuccess({required this.bill});
}
