import 'package:test_order_life_cycle/features/store/order_processing/domain/entities/order_processing_bill_entity.dart';

import 'data.dart';

class OrderProcessingBillModel extends OrderProcessingBillEntity {
  bool? success;
  String? message;
  Data? data;

  OrderProcessingBillModel({this.success, this.message, this.data})
      : super(
            isSuccess: success ?? false,
            serverMessage: message ?? "",
            invoiceDate: data!.date!,
            invoiceNumbers: data.invoiceNumber ?? "",
            invoiceAmounts: data.invoiceAmount ?? 0,
            invoiceImages: data.invoiceImageUrl,
            invoiceId: 0);

  factory OrderProcessingBillModel.fromJson(Map<String, dynamic> json) {
    return OrderProcessingBillModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'data': data?.toJson(),
      };
}
