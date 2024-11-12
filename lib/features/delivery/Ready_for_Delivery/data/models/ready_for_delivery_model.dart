import 'package:test_order_life_cycle/features/delivery/Ready_for_Delivery/domain/entities/ready_for_delivery_entity.dart';

class OrderSummary extends ReadyForDeliveryEntity {
  int? id;
  String? orderNumber;
  String? customerName;
  int? totalOrdersDetails;

  OrderSummary({
    this.id,
    this.orderNumber,
    this.customerName,
    this.totalOrdersDetails,
  }) : super(
            idParcel: id ?? 0,
            idOrder: orderNumber ?? '',
            totalParcels: totalOrdersDetails ?? 0,
            name: customerName ?? '',
            phoneNumber: '775445127');

  // Factory constructor to create an instance from JSON
  factory OrderSummary.fromJson(Map<String, dynamic> json) => OrderSummary(
        id: json['id'] as int?,
        orderNumber: json['orderNumber'] as String?,
        customerName: json['customerName'] as String?,
        totalOrdersDetails: json['totalOrdersDetails'] as int?,
      );

  // Method to convert the instance back to JSON
  Map<String, dynamic> toJson() => {
        'id': id,
        'orderNumber': orderNumber,
        'customerName': customerName,
        'totalOrdersDetails': totalOrdersDetails,
      };
}
