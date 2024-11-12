import 'package:test_order_life_cycle/features/k_accounant/confirm_payment/domain/approve_invoice_entity.dart';

class ApproveInvoiceModel extends ApproveInvoiceEntity {
  bool? success;
  String? message;

  ApproveInvoiceModel({this.success, this.message})
      : super(isSuccess: success!, serverMessage: message ?? '');

  factory ApproveInvoiceModel.fromJson(Map<String, dynamic> json) {
    return ApproveInvoiceModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
      };
}
