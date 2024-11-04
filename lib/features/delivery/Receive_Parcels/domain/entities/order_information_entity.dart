class OrderInformationEntity {
  final int parcelId;
  final String orderId;
  final String userName;
  final String phoneNumber;
  final int totalOfParcel;

  OrderInformationEntity(
      {required this.parcelId,
      required this.orderId,
      required this.userName,
      required this.phoneNumber,
      required this.totalOfParcel,
      });
}
