import 'package:test_order_life_cycle/features/k_accounant/confirm_payment/domain/payment_bills_to_confirm_entity.dart';

class PaymentBillsToConfirmModel extends PaymentBillsToConfirmEntity {
  int? invoiceId;
  int? invoiceNumber;
  num? entredInvoiceAmount;
  String? invoiceImageUrl;
  String? invoiceDate;
  String? invoiceType;
  String? invoiceStatus;
  String? orderNumber;
  num? totalAmountOfOrderDetails;
  String? storeName;
  String? salesmanName;
  num? differenceAmountBetweenTotalPriceOfOrderDetailsAndEntredInvoiceAmount;

  PaymentBillsToConfirmModel({
    this.invoiceId,
    this.invoiceNumber,
    this.entredInvoiceAmount,
    this.invoiceImageUrl,
    this.invoiceDate,
    this.invoiceType,
    this.invoiceStatus,
    this.orderNumber,
    this.totalAmountOfOrderDetails,
    this.storeName,
    this.salesmanName,
    this.differenceAmountBetweenTotalPriceOfOrderDetailsAndEntredInvoiceAmount,
  }) : super(
          paymentBillInvoiceId: invoiceId ?? 0,
          paymentBillInvoiceNumber: invoiceNumber ?? 0,
          paymentBillEntredInvoiceAmountFromStore: entredInvoiceAmount ?? 0,
          paymentBillInvoiceImageUrl: invoiceImageUrl ?? '',
          paymentBillInvoiceDate: invoiceDate ?? '',
          paymentBillInvoiceType: invoiceType ?? '',
          paymentBillInvoiceStatus: invoiceStatus ?? '',
          paymentBillOrderNumber: orderNumber ?? '',
          paymentBillTotalAmountOfOrderDetails: totalAmountOfOrderDetails ?? 0,
          paymentBillStoreName: storeName ?? '',
          paymentBillSalesmanName: salesmanName ?? '',
          paymentBillDifferenceAmountBetweenTotalPriceOfOrderDetailsAndEntredInvoiceAmountFromStore:
              differenceAmountBetweenTotalPriceOfOrderDetailsAndEntredInvoiceAmount ??
                  0,
        );

  factory PaymentBillsToConfirmModel.fromJson(Map<String, dynamic> json) {
    return PaymentBillsToConfirmModel(
      invoiceId: json['invoiceId'] as int?,
      invoiceNumber: json['invoiceNumber'] as int?,
      entredInvoiceAmount: json['entredInvoiceAmount'] as num?,
      invoiceImageUrl: json['invoiceImageUrl'] as String?,
      invoiceDate: json['invoiceDate'] as String?,
      invoiceType: json['invoiceType'] as String?,
      invoiceStatus: json['invoiceStatus'] as String?,
      orderNumber: json['orderNumber'] as String?,
      totalAmountOfOrderDetails: json['totalAmountOfOrderDetails'] as num?,
      storeName: json['storeName'] as String?,
      salesmanName: json['salesmanName'] as String?,
      differenceAmountBetweenTotalPriceOfOrderDetailsAndEntredInvoiceAmount:
          json['differenceAmountBetweenTotalPriceOfOrderDetailsAndEntredInvoiceAmount']
              as num?,
    );
  }

  Map<String, dynamic> toJson() => {
        'invoiceId': invoiceId,
        'invoiceNumber': invoiceNumber,
        'entredInvoiceAmount': entredInvoiceAmount,
        'invoiceImageUrl': invoiceImageUrl,
        'invoiceDate': invoiceDate,
        'invoiceType': invoiceType,
        'invoiceStatus': invoiceStatus,
        'orderNumber': orderNumber,
        'totalAmountOfOrderDetails': totalAmountOfOrderDetails,
        'storeName': storeName,
        'salesmanName': salesmanName,
        'differenceAmountBetweenTotalPriceOfOrderDetailsAndEntredInvoiceAmount':
            differenceAmountBetweenTotalPriceOfOrderDetailsAndEntredInvoiceAmount,
      };
}
