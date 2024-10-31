class Data {
  String? message;
  int? id;
  int? orderDetailStatus;

  Data({
    this.message,
    required this.id,
    required this.orderDetailStatus,
  });

  // Factory constructor to create an instance from JSON
  factory Data.fromJson(Map<String, dynamic> json) => Data(
        message: json['message'] as String? ?? "",
        id: json['id'] as int?,
        orderDetailStatus: json['orderDetailStatus'] as int?,
      );

  // Method to convert the instance back to JSON
  Map<String, dynamic> toJson() => {
        'message': message,
        'id': id,
        'orderDetailStatus': orderDetailStatus,
      };
}
