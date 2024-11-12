part of 'choose_type_of_invoice_cubit.dart';

@immutable
sealed class ChooseTypeOfInvoiceState {}

final class ChooseTypeOfInvoiceInitial extends ChooseTypeOfInvoiceState {}
final class ChooseTypeOfInvoiceLoading extends ChooseTypeOfInvoiceState {}

final class ChooseTypeOfInvoiceFailure extends ChooseTypeOfInvoiceState {
  final String errorMessage;
  final int invoiceId;
  ChooseTypeOfInvoiceFailure({required this.invoiceId, required this.errorMessage});
}

final class ChooseTypeOfInvoiceSuccess extends ChooseTypeOfInvoiceState {
  final ChooseTypeOfInvoiceEntity chooseTypeOfInvoiceEntity;

  ChooseTypeOfInvoiceSuccess({required this.chooseTypeOfInvoiceEntity});
}