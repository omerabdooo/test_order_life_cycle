import 'package:test_order_life_cycle/features/delivery/Parcel_Delivery/domain/entities/parcel_delivery_entity.dart';

class OrderStatus extends ParcelDeliveryEntity {
  bool? success;
  String? message;
  // Data? data;

  OrderStatus({
    this.success,
    this.message,
    // this.data
  }) : super(
          isSuccess: success ?? false,
          serverMessage: message ?? "",
        );

  // Factory constructor to create an instance from JSON
  factory OrderStatus.fromJson(Map<String, dynamic> json) => OrderStatus(
        success: json['success'] as bool?,
        message: json['message'] as String?,
      );

  // Method to convert the instance back to JSON
  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
      };
}
