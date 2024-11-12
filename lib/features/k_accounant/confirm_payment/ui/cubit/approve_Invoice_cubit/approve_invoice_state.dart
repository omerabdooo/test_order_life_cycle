part of 'approve_invoice_cubit.dart';

@immutable
sealed class ApproveInvoiceState {}

final class ApproveInvoiceInitial extends ApproveInvoiceState {}

class ApproveInvoiceLoading extends ApproveInvoiceState {}

class ApproveInvoiceFailure extends ApproveInvoiceState {
  final String errorMessage;
  final int invoiceId;
  ApproveInvoiceFailure({required this.invoiceId, required this.errorMessage});
}

class ApproveInvoiceSuccess extends ApproveInvoiceState {
  final ApproveInvoiceEntity approveInvoiceEntity;

  ApproveInvoiceSuccess({required this.approveInvoiceEntity});
}
