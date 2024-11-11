import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:test_order_life_cycle/core/api_service.dart';
import 'package:test_order_life_cycle/features/y_accountant/confirm_payment/data/model/bound_model/bound_model.dart';
import 'package:test_order_life_cycle/features/y_accountant/confirm_payment/data/model/bound_model/bounds_model/bounds_model.dart';
import 'package:test_order_life_cycle/features/y_accountant/confirm_payment/data/model/update_bound_state_model.dart';
import 'package:test_order_life_cycle/features/y_accountant/confirm_payment/domin/entitnies/bound_entitny.dart';
import 'package:test_order_life_cycle/features/y_accountant/confirm_payment/domin/entitnies/update_bound_state_entinty.dart';

abstract class BoundRemoteDataSource {
  Future<List<BoundEntitny>> getBound();
  Future<BoundEntitny> updateBoundState(int boundId, String action);
}

class BoundRemoteDataSourceImpl implements BoundRemoteDataSource {
  final ApiService apiService;
  final FlutterSecureStorage secureStorage;

  BoundRemoteDataSourceImpl(
      {required this.apiService, required this.secureStorage});
  Future<String?> getToken() async {
    return await secureStorage.read(key: 'token');
  }

  List<T> getListFromData<T>(
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

  @override
  Future<List<BoundEntitny>> getBound() async {
    String? token = await getToken();
    var data = await apiService.get(
        endPoint: 'Bonds/Accountat/GetAllUnApprovedBonds',
        headers: {'Authorization': 'Bearer $token'});
    List<BoundEntitny> cartItem = getBoundList(data);
    print(cartItem);
    return cartItem;
  }

  List<BoundEntitny> getBoundList(Map<String, dynamic> data) {
    return getListFromData(data, (item) => BoundsModel.fromJson(item));
  }

  @override
  Future<BoundEntitny> updateBoundState(int boundId, String action) async {
    String? token = await getToken();
    FormData formData = FormData.fromMap({
      'bondId': boundId,
      'action': action,
    });
    Map<String, dynamic> data = await apiService.patch(
        endPoint:
            'Bonds/Accountant/UpdateBondStatus?bondId=$boundId&action=$action',
        data: formData,
        headers: {
          'Authorization': 'Bearer $token',
        });
    BoundEntitny addOrderEntity = BoundsModel.fromJson(data);
    print(addOrderEntity);
    return addOrderEntity;
  }
}
