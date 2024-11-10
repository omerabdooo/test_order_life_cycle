import 'package:test_order_life_cycle/features/store/order_processing/domain/entities/order_processing_shipping_entity.dart';

class ShippingModel extends OrderProcessingShippingEntity {
  bool? success;
  String? message;
  List<String>? errors;
  String? data;

  ShippingModel({this.success, this.message, this.errors, this.data})
      : super(
          isSuccess: success ?? false,
          serverMessage: message ?? 'server Error',
        );

  factory ShippingModel.fromJson(Map<String, dynamic> json) => ShippingModel(
        success: json['success'] as bool?,
        message: json['message'] as String?,
        errors: json['errors'] as List<String>?,
        data: json['data'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'errors': errors,
        'data': data,
      };
}
