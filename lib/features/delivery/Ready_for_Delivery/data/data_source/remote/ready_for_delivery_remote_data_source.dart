import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:test_order_life_cycle/core/api_service.dart';
import 'package:test_order_life_cycle/features/delivery/Ready_for_Delivery/data/models/ready_for_delivery_model.dart';
import 'package:test_order_life_cycle/features/delivery/Ready_for_Delivery/domain/entities/ready_for_delivery_entity.dart';

abstract class ReadyForDeliveryRemoteDataSource {
  Future<List<ReadyForDeliveryEntity>> getAllReadyForDelivery();
}

class ReadyForDeliveryRemoteDataSourceImpl
    implements ReadyForDeliveryRemoteDataSource {
  final ApiService apiService;
  final FlutterSecureStorage secureStorage;
  ReadyForDeliveryRemoteDataSourceImpl(this.apiService, this.secureStorage);

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

  // get Ready For Delivery function
  List<ReadyForDeliveryEntity> getAllReadyForDeliveryList(
      Map<String, dynamic> data) {
    return getListFromData(data, (item) => OrderSummary.fromJson(item));
  }

  @override
  Future<List<ReadyForDeliveryEntity>> getAllReadyForDelivery() async {
    var data = await apiService
        .get(endPoint: "DeliveryApp/GetOrdersReadyToDelivery", headers: {});

    if (data['data'] == null) {
      print("Noting Ready For Delivery found.");
      return [];
    }

    List<ReadyForDeliveryEntity> delivery = getAllReadyForDeliveryList(data);

    return delivery;
  }
}
