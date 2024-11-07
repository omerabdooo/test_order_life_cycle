import 'package:test_order_life_cycle/features/store/home/domain/entities/all_order_entity.dart';

class AllOrderModel extends AllOrderEntity {
  int? id;
  String? orderNumber;
  DateTime? createdAt;
  int? quantity;

  AllOrderModel({this.id, this.orderNumber, this.createdAt, this.quantity})
      : super(
            idOrder: id!,
            orderNum: orderNumber ?? "0",
            orderDate: createdAt,
            productNum: quantity ?? 0);

  factory AllOrderModel.fromJson(Map<String, dynamic> json) => AllOrderModel(
        id: json['id'] as int,
        orderNumber: json['orderNumber'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        quantity: json['quantity'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'orderNumber': orderNumber,
        'createdAt': createdAt?.toIso8601String(),
        'quantity': quantity,
      };
}
