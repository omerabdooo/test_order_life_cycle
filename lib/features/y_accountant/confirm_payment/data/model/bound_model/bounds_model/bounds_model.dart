import 'package:test_order_life_cycle/features/y_accountant/confirm_payment/domin/entitnies/bound_entitny.dart';

class BoundsModel extends BoundEntitny {
  int? bondId;
  int? bondNumber;
  num? bondAmount;
  String? customerName;
  String? bondImgUrl;
  String? bankName;
  DateTime? bondDate;
  dynamic note;
  dynamic bondStatus;
  dynamic approvedBy;
  dynamic bondRejectedBy;
  int? orderId;

  BoundsModel({
    this.bondId,
    this.bondNumber,
    this.bondAmount,
    this.customerName,
    this.bondImgUrl,
    this.bankName,
    this.bondDate,
    this.note,
    this.bondStatus,
    this.approvedBy,
    this.bondRejectedBy,
    this.orderId,
  }) : super(
            boundId: bondId??0,
            banKName: bankName??'',
            clintName: customerName??'',
            image: bondImgUrl,
            boundNumber: bondNumber??0,
            date: bondDate??DateTime.now(),
            boundValue: bondAmount?.toInt()??0,
            orderNumber: orderId??0);

  factory BoundsModel.fromJson(Map<String, dynamic> json) => BoundsModel(
        bondId: json['bondID'] as int?,
        bondNumber: json['bondNumber'] as int?,
        bondAmount: json['bondAmount'] as num?,
        customerName: json['customerName'] as String?,
        bondImgUrl: json['bondImgURL'] as String?,
        bankName: json['bankName'] as String?,
        bondDate: json['bondDate'] == null
            ? null
            : DateTime.parse(json['bondDate'] as String),
        note: json['note'] as dynamic,
        bondStatus: json['bondStatus'] as dynamic,
        approvedBy: json['approvedBy'] as dynamic,
        bondRejectedBy: json['bondRejectedBy'] as dynamic,
        orderId: json['orderID'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'bondID': bondId,
        'bondNumber': bondNumber,
        'bondAmount': bondAmount,
        'customerName': customerName,
        'bondImgURL': bondImgUrl,
        'bankName': bankName,
        'bondDate': bondDate?.toIso8601String(),
        'note': note,
        'bondStatus': bondStatus,
        'approvedBy': approvedBy,
        'bondRejectedBy': bondRejectedBy,
        'orderID': orderId,
      };
}
