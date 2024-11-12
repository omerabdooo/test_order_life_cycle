part of 'get_payment_bill_cubit.dart';

@immutable
sealed class GetPaymentBillState {}

final class GetPaymentBillInitial extends GetPaymentBillState {}

final class GetPaymentBillLoading extends GetPaymentBillState {}

final class GetPaymentBillFailuer extends GetPaymentBillState {
  final String errMessage;

  GetPaymentBillFailuer({required this.errMessage});
}

final class GetPaymentBillSuccess extends GetPaymentBillState {
  final List<PaymentBillsToConfirmEntity> paymentBills;

  GetPaymentBillSuccess({required this.paymentBills});
}
