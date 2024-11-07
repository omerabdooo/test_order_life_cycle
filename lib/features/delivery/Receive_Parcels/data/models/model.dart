/*
import 'package:sindbad_store/features/shipping_address_features/domain/entities/customer_address_entity.dart';

class CustomerAddress extends CustomerAddressEntity {
  int? customerAddressId;
  int? regionId;
  String? location;
  String? regionName;
  String? directorateName;
  String? governorateName;

  CustomerAddress({
    this.customerAddressId,
    this.regionId,
    this.location,
    this.regionName,
    this.directorateName,
    this.governorateName,
  }) : super(
            customerAddressID: customerAddressId!,
            locationTitle: location ?? '',
            governorateTitle: governorateName ?? '',
            directorateTitle: directorateName ?? '',
            regionTitle: regionName ?? '',
            recipientName: 'عمكم عمر العمودي',
            phoneNumber: '770193342');

  factory CustomerAddress.fromJson(Map<String, dynamic> json) =>
      CustomerAddress(
        customerAddressId: json['customerAddressId'] as int?,
        regionId: json['regionId'] as int?,
        location: json['location'] as String?,
        regionName: json['regionName'] as String?,
        directorateName: json['directorateName'] as String?,
        governorateName: json['governorateName'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'customerAddressId': customerAddressId,
        'regionId': regionId,
        'location': location,
        'regionName': regionName,
        'directorateName': directorateName,
        'governorateName': governorateName,
      };
}
*/
