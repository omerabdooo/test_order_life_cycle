import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:test_order_life_cycle/core/api_service.dart';
import 'package:test_order_life_cycle/features/delivery/Receive_Parcels/data/models/order_detail_status/order_detail_status_model.dart';
import 'package:test_order_life_cycle/features/delivery/Receive_Parcels/domain/entities/receive_parcels_entity.dart';

abstract class ReceiveParcelsRemoteDataSource {
  //Future<List<CustomerAddressEntity>> getAllCustomerAddress();
  Future<ReceiveParcelsEntity> receiveParcels(
    int parcelId,
    int status,
  );
}

class ReceiveParcelsRemoteDataSourceImpl
    implements ReceiveParcelsRemoteDataSource {
  final ApiService apiService;
  final FlutterSecureStorage secureStorage;
  ReceiveParcelsRemoteDataSourceImpl(this.apiService, this.secureStorage);

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


  @override
  Future<ReceiveParcelsEntity> receiveParcels(
    int parcelId,
    int status,
  ) async {
    var data = await apiService
        .post(endPoint: "DeliveryApp/ChangeOrderDetailsStatus", data: {
      'id': parcelId,
      'orderDetailStatus': status,
    });
    ReceiveParcelsEntity receiveParcels = OrderDetailStatus.fromJson(data);
    print(receiveParcels);
    return receiveParcels;
  }

}
