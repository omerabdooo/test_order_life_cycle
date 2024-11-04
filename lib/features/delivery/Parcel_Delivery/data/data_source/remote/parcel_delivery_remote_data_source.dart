import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:test_order_life_cycle/core/api_service.dart';
import 'package:test_order_life_cycle/features/delivery/Parcel_Delivery/data/models/order_status/order_status_model.dart';
import 'package:test_order_life_cycle/features/delivery/Parcel_Delivery/domain/entities/parcel_delivery_entity.dart';

abstract class ParcelDeliveryRemoteDataSource {
  //Future<List<CustomerAddressEntity>> getAllCustomerAddress();
  Future<ParcelDeliveryEntity> parcelDelivery(
    int parcelId,
    String orderId,
    int status,
  );
}

class ParcelDeliveryRemoteDataSourceImpl
    implements ParcelDeliveryRemoteDataSource {
  final ApiService apiService;
  final FlutterSecureStorage secureStorage;
  ParcelDeliveryRemoteDataSourceImpl(this.apiService, this.secureStorage);

  // get token
  Future<String?> getToken() async {
    return await secureStorage.read(key: 'token');
  }

  List<T> getListFromData<T>(
      Map<String, dynamic> data, T Function(Map<String, dynamic>) fromJson) {
    List<T> entities = [];

    if (data['data'] is List) {
      if (data['data'].isEmpty) {
        print("The data list is empty.");
      } else {
        for (var item in data['data']) {
          entities.add(fromJson(item));
        }
      }
    } else if (data['message'] != null) {
      // If 'data' is not a list and there is a message, handle accordingly
      print("Message found in the data: ${data['message']}");
      entities.add(fromJson(data));
    } else {
      print("No valid data or message found.");
    }

    print('List after processing: $entities');
    return entities;
  }

  // // get customer address List function
  // List<CustomerAddressEntity> getAllCustomerAddresslist(
  //     Map<String, dynamic> data) {
  //   return getListFromData(data, (item) => CustomerAddress.fromJson(item));
  // }

  @override
  Future<ParcelDeliveryEntity> parcelDelivery(
    int parcelId,
    String orderId,
    int status,
  ) async {
    var data =
        await apiService.post(endPoint: "DeliveryApp/ChangeOrderStatus", data: {
      'orderNumber': orderId,
      'orderStatus': status,
    });
    ParcelDeliveryEntity parcelDelivery = OrderStatus.fromJson(data);
    print(parcelDelivery);
    return parcelDelivery;
  }

// @override
// Future<List<CustomerAddressEntity>> getAllCustomerAddress() async {
//   String? token = await getToken();

//   var data = await apiService.get(
//       endPoint: "CustomerAddress/GetCustomerAddress", headers: {
//     'Authorization': 'Bearer $token',
//   });

//   if (data['data'] == null) {
//     print("No customer addresses found.");
//     return [];
//   }

//   List<CustomerAddressEntity> customerAddress = getAllCustomerAddresslist(data);

//   return customerAddress;
// }
}
