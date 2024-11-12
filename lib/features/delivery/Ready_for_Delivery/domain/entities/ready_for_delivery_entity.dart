class ReadyForDeliveryEntity {
  final int idParcel;
  final String idOrder;
  final int totalParcels;
  final String name;
  final String phoneNumber;

  ReadyForDeliveryEntity({
    required this.idParcel,
    required this.idOrder,
    required this.totalParcels,
    required this.name,
    required this.phoneNumber,
  });
}
