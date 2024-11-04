// class OrderProcessingBillEntity {
//   // final String billDate;
//   // final String billNumber;
//   // final String billAmuont;
//   // final String billImage;
//   // final String billId;
//   ////////////////////
//   final bool successes;
//   final String messages;

//   OrderProcessingBillEntity({
//     // required this.billDate,
//     // required this.billNumber,
//     // required this.billAmuont,
//     // required this.billImage,
//     // required this.billId,
//     required this.successes,
//     required this.messages,
//   });
// }
import 'dart:io';

class OrderProcessingBillEntity {
  final bool isSuccess;
  final String serverMessage;
  final DateTime invoiceDate;
  final String invoiceNumbers;
  final num invoiceAmounts;
  final File? invoiceImages;
  final int invoiceId;

  OrderProcessingBillEntity(
      {required this.isSuccess,
      required this.serverMessage,
      required this.invoiceDate,
      required this.invoiceNumbers,
      required this.invoiceAmounts,
      required this.invoiceImages,
      required this.invoiceId});
}
