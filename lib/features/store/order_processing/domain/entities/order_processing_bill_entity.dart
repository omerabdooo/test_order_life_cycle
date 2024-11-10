import 'dart:io';

class OrderProcessingBillEntity {
  final bool isSuccess;
  final String serverMessage;
  //final DateTime invoiceDate;
  final String invoiceNumbers;
  final num invoiceAmounts;
  final File? invoiceImages;
  final int invoiceId;

  OrderProcessingBillEntity(
      {required this.isSuccess,
      required this.serverMessage,
      //required this.invoiceDate,
      required this.invoiceNumbers,
      required this.invoiceAmounts,
      required this.invoiceImages,
      required this.invoiceId});
}
