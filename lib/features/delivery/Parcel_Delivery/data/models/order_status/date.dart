class Data {
  String? message;
  String? orderNumber;
  int? orderStatus;

  Data({
    this.message,
    this.orderNumber,
    this.orderStatus,
  });

  // Factory constructor to create an instance from JSON
  factory Data.fromJson(Map<String, dynamic> json) => Data(
        message: json['message'] as String? ?? "",
        orderNumber: json['orderNumber'] as String?,
        orderStatus: json['orderStatus'] as int?,
      );

  // Method to convert the instance back to JSON
  Map<String, dynamic> toJson() => {
        'message': message,
        'orderNumber': orderNumber,
        'orderStatus': orderStatus,
      };
}
