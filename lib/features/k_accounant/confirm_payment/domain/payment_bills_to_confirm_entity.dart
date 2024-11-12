class PaymentBillsToConfirmEntity {
  final int paymentBillInvoiceId;
  final int paymentBillInvoiceNumber;
  final num paymentBillEntredInvoiceAmountFromStore;
  final String paymentBillInvoiceImageUrl;
  final String paymentBillInvoiceDate;
  final String paymentBillInvoiceType;
  final String paymentBillInvoiceStatus;
  final String paymentBillOrderNumber;
  final num paymentBillTotalAmountOfOrderDetails;
  final String paymentBillStoreName;
  final String paymentBillSalesmanName;
  final num
      paymentBillDifferenceAmountBetweenTotalPriceOfOrderDetailsAndEntredInvoiceAmountFromStore;

  PaymentBillsToConfirmEntity({
    required this.paymentBillInvoiceId,
    required this.paymentBillInvoiceNumber,
    required this.paymentBillEntredInvoiceAmountFromStore,
    required this.paymentBillInvoiceImageUrl,
    required this.paymentBillInvoiceDate,
    required this.paymentBillInvoiceType,
    required this.paymentBillInvoiceStatus,
    required this.paymentBillOrderNumber,
    required this.paymentBillTotalAmountOfOrderDetails,
    required this.paymentBillStoreName,
    required this.paymentBillSalesmanName,
    required this.paymentBillDifferenceAmountBetweenTotalPriceOfOrderDetailsAndEntredInvoiceAmountFromStore,
  });
}
