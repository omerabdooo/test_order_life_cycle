
import 'package:test_order_life_cycle/features/delivery/Receive_Parcels/domain/entities/receive_parcels_entity.dart';

class OrderDetailStatus extends ReceiveParcelsEntity {
  bool? success;
  String? message;
  // Data? data;

  OrderDetailStatus({this.success, this.message, 
  // this.data
  })
      : super(
            isSuccess: success ?? false,
            serverMessage: message ?? "",
            );

  // Factory constructor to create an instance from JSON
  factory OrderDetailStatus.fromJson(Map<String, dynamic> json) =>
      OrderDetailStatus(
        success: json['success'] as bool?,
        message: json['message'] as String?,
      );

  // Method to convert the instance back to JSON
  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
      };
}
