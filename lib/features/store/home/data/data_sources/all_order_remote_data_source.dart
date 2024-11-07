import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:test_order_life_cycle/core/api_service.dart';
import 'package:test_order_life_cycle/features/store/home/domain/entities/all_order_entity.dart';
import '../models/all_order_model/all_order_model.dart';

abstract class AllOrderRemotDataSource {
  Future<List<AllOrderEntity>> fetchAllOrder(bool isUrgen, String storeId,
      int pageNumber, int pageSize, int searchKeyword);
}

class AllOrderRemotDataSourceImpl extends AllOrderRemotDataSource {
  final ApiService apiService;
  final FlutterSecureStorage secureStorage;

  AllOrderRemotDataSourceImpl(this.apiService, this.secureStorage);

  Future<String?> getToken() async {
    return await secureStorage.read(key: 'token');
  }

  // Generic function to convert data to a list of items entities
  List<T> getListItemsFromData<T>(
      Map<String, dynamic> data, T Function(Map<String, dynamic>) fromJson) {
    List<T> entities = [];

    if (data['data'] is List) {
      for (var item in data['data']) {
        entities.add(fromJson(item));
      }
    } else if (data['message'] != null) {
      // If data['data'] is not a list, add the message to the list
      entities.add(fromJson(data));
    }
    print('this the list added in data source $entities');

    return entities;
  }

  // get MyOrder List function
  List<AllOrderEntity> getAllOrderList(Map<String, dynamic> data) {
    return getListItemsFromData(data, (item) => AllOrderModel.fromJson(item));
  }

  @override
  Future<List<AllOrderEntity>> fetchAllOrder(bool isUrgen, String storeId,
      int pageNumber, int pageSize, int searchKeyword) async {
    String? token = await getToken();
    var data = await apiService.get(
      endPoint:
          'Orders/Store/GetAllOrdersByStoreIdWitheFilterstring/1/10/1?IsUrgen=false',
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiIyYjc1MDZlYy02ODQwLTRjMTQtYTI3Ny1iYjcwMTc0YzhiMGMiLCJlbWFpbCI6Im1AbSIsIm5hbWUiOiLYtdin2YTZiNmGINmF2LHYudmKINio2YYg2YfZhNin2KjZiiDZhNij2K3Yr9irINmC2LXYp9iqINin2YTYtNi52LEiLCJJc0VuYWJsZWQiOiJUcnVlIiwiUGhvbmVOdW1iZXIiOiI3Nzc3Nzc3NzgiLCJJZCI6Ijg1ZGRhNGU4LTQ2ODUtNGFlMy1iMWJiLWVhNzg1NjlmYjk2NiIsInJvbGVzIjoiU3RvcmUiLCJleHAiOjE3MzU4MDYxOTQsImlzcyI6IkZhc3RTdG9yZSIsImF1ZCI6IkZhc3RTdG9yZSJ9.ofUwijlTAoIChrgrLJ7fMXnwEzh7tHSfDxqiQpJbgE4',
      },
    );
    List<AllOrderEntity> orders = getAllOrderList(data);
    print(orders);
    return orders;
  }
}
