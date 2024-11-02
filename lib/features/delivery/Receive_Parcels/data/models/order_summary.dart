//parcelId

import 'package:test_order_life_cycle/features/delivery/Receive_Parcels/domain/entities/order_information.dart';

class OrderSummary extends OrderInformationEntity{
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
    parcelId: id ?? 0, 
    orderId: orderNumber ?? '', 
    totalParcels: totalOrdersDetails ?? 1, 
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
