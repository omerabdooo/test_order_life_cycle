class Item {
  int? bondId;
  int? bondNumber;
  int? bondAmount;
  String? customerName;
  String? bondImgUrl;
  String? bankName;
  DateTime? bondDate;
  String? note;
  String? bondStatus;
  String? approvedBy;
  String? bondRejectedBy;
  int? orderId;

  Item({
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
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        bondId: json['bondID'] as int?,
        bondNumber: json['bondNumber'] as int?,
        bondAmount: json['bondAmount'] as int?,
        customerName: json['customerName'] as String?,
        bondImgUrl: json['bondImgURL'] as String?,
        bankName: json['bankName'] as String?,
        bondDate: json['bondDate'] == null
            ? null
            : DateTime.parse(json['bondDate'] as String),
        note: json['note'] as String?,
        bondStatus: json['bondStatus'] as String?,
        approvedBy: json['approvedBy'] as String?,
        bondRejectedBy: json['bondRejectedBy'] as String?,
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
