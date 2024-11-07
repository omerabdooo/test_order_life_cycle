import 'package:test_order_life_cycle/features/y_accountant/confirm_payment/domin/entitnies/bound_entitny.dart';

import 'item.dart';

class BoundModel extends BoundEntitny {
  List<Item>? items;
  int? totalCount;
  int? totalPages;
  int? currentPage;
  int? pageSize;

  BoundModel({
    this.items,
    this.totalCount,
    this.totalPages,
    this.currentPage,
    this.pageSize,
  }) : super(
          boundId: items?.firstOrNull?.bondId ?? 0,
          banKName: items?.firstOrNull?.bankName ?? '',
          clintName: items?.firstOrNull?.customerName ?? '',
          image: items?.firstOrNull?.bondImgUrl ?? '',
          boundNumber: items?.firstOrNull?.bondNumber ?? 0,
          date: items?.firstOrNull?.bondDate ?? DateTime.now(),
          boundValue: items?.firstOrNull?.bondAmount ?? 0,
          orderNumber: items?.firstOrNull?.orderId ?? 0,
        );

  factory BoundModel.fromJson(Map<String, dynamic> json) => BoundModel(
        items: (json['items'] as List<dynamic>?)
            ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
            .toList(),
        totalCount: json['totalCount'] as int?,
        totalPages: json['totalPages'] as int?,
        currentPage: json['currentPage'] as int?,
        pageSize: json['pageSize'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'items': items?.map((e) => e.toJson()).toList(),
        'totalCount': totalCount,
        'totalPages': totalPages,
        'currentPage': currentPage,
        'pageSize': pageSize,
      };
}
