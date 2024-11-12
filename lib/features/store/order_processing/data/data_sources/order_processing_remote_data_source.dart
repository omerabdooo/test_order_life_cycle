import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:test_order_life_cycle/core/api_service.dart';
import 'package:test_order_life_cycle/features/store/order_processing/data/models/bill/order_processing_bill_model/order_processing_bill_model.dart';
import 'package:test_order_life_cycle/features/store/order_processing/data/models/shipping.dart';
import 'package:test_order_life_cycle/features/store/order_processing/domain/entities/order_processing_bill_entity.dart';
import 'package:test_order_life_cycle/features/store/order_processing/domain/entities/order_processing_entity.dart';
import 'package:test_order_life_cycle/features/store/order_processing/domain/entities/order_processing_shipping_entity.dart';

import '../models/order_processing_model/order_processing_model.dart';

abstract class OrderProcessingRemoteDataSource {
  Future<List<OrderProcessingEntity>> fetchOrderProcessing(
      int orderId, String orderNum, String orderDate, String productNum);
  Future<OrderProcessingBillEntity> fetchOrderProcessingBill(
      List<int> ids,
      num invoiceAmount,
      File invoiceImage,
      String invoiceNumber,
      DateTime invoiceDate);
  Future<OrderProcessingShippingEntity> fetchOrderProcessingShipping(
    List<int> ids,
    String shippingNumber,
    String shippingCompany,
    File invoiceImage,
  );
}

class OrderProcessingRemotDataSourceImpl
    extends OrderProcessingRemoteDataSource {
  final ApiService apiService;
  final FlutterSecureStorage secureStorage;

  OrderProcessingRemotDataSourceImpl(this.apiService, this.secureStorage);

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
  List<OrderProcessingEntity> getOrderProcessingList(
      Map<String, dynamic> data) {
    return getListItemsFromData(
        data, (item) => OrderProcessingModel.fromJson(item));
  }

  @override
  Future<List<OrderProcessingEntity>> fetchOrderProcessing(
      int orderId, String orderNum, String orderDate, String productNum) async {
    String? token = await getToken();
    var data = await apiService.get(
      endPoint:
          'OrderDetails/Store/GetStoreOrderDetailssByOrderIdAndStoreId/$orderId',
      headers: {
        // 'Authorization': 'Bearer $token',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiJjNjY0NzkzNS02YWVhLTRmOTItYTVkZS1iYWQyNGIxYjc4YzkiLCJlbWFpbCI6Im1AbSIsIm5hbWUiOiLYtdin2YTZiNmGINmF2LHYudmKINio2YYg2YfZhNin2KjZiiDZhNij2K3Yr9irINmC2LXYp9iqINin2YTYtNi52LEiLCJJc0VuYWJsZWQiOiJUcnVlIiwiUGhvbmVOdW1iZXIiOiI3Nzc3Nzc3NzgiLCJJZCI6Ijg1ZGRhNGU4LTQ2ODUtNGFlMy1iMWJiLWVhNzg1NjlmYjk2NiIsInJvbGVzIjoiU3RvcmUiLCJleHAiOjE3MzYzNDgxNTAsImlzcyI6IkZhc3RTdG9yZSIsImF1ZCI6IkZhc3RTdG9yZSJ9.uNXQTjwUSjCW76rxQux6GYTCGMvO6U8pyNLKdLU8lIw',
      },
    );
    List<OrderProcessingEntity> orders = getOrderProcessingList(data);
    return orders;
  }

  //////////////////////////////////////////////////////////////
  ///ارسال الفاتورة
  List<int> nums = [5];
  @override
  Future<OrderProcessingBillEntity> fetchOrderProcessingBill(
      List<int> ids,
      num invoiceAmount,
      File invoiceImage,
      String invoiceNumber,
      DateTime invoiceDate) async {
    String? token = await getToken();
    FormData formData = FormData();
    formData = FormData.fromMap(
      {
        'InvoiceAmount': 5.5,
        'InvoiceNumber': '5',
        'Date': DateTime.now().toString(),
        'orderDetailsId': nums.map((e) => e.toString()).toList(),
      },
    );

    var data = await apiService.postRequestWithFiles(
        endPoint: 'OrderDetails/Store/CreateInvoiceForOrderdetailsInStore',
        headers: {
          // 'Authorization': 'Bearer $token',
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiJjNjY0NzkzNS02YWVhLTRmOTItYTVkZS1iYWQyNGIxYjc4YzkiLCJlbWFpbCI6Im1AbSIsIm5hbWUiOiLYtdin2YTZiNmGINmF2LHYudmKINio2YYg2YfZhNin2KjZiiDZhNij2K3Yr9irINmC2LXYp9iqINin2YTYtNi52LEiLCJJc0VuYWJsZWQiOiJUcnVlIiwiUGhvbmVOdW1iZXIiOiI3Nzc3Nzc3NzgiLCJJZCI6Ijg1ZGRhNGU4LTQ2ODUtNGFlMy1iMWJiLWVhNzg1NjlmYjk2NiIsInJvbGVzIjoiU3RvcmUiLCJleHAiOjE3MzYzNDgxNTAsImlzcyI6IkZhc3RTdG9yZSIsImF1ZCI6IkZhc3RTdG9yZSJ9.uNXQTjwUSjCW76rxQux6GYTCGMvO6U8pyNLKdLU8lIw',
        },
        file: invoiceImage,
        data: {
          'InvoiceAmount': invoiceAmount,
          'InvoiceNumber': invoiceNumber,
          'Date': DateTime.now().toString(),
          'orderDetailsId': 5,
          'orderDetailsId': 9,
        });
    OrderProcessingBillEntity bill =
        OrderProcessingBillModel.fromJson(data.values.last);
    print(bill);
    return bill;
  }

  @override
  Future<OrderProcessingShippingEntity> fetchOrderProcessingShipping(
      List<int> ids,
      String shippingNumber,
      String shippingCompany,
      File invoiceImage) async {
    String? token = await getToken();
    // FormData formData = FormData();
    // formData = FormData.fromMap(
    //   {
    //     'InvoiceAmount': 5.5,
    //     'InvoiceNumber': '5',
    //     'orderDetailsId': nums.map((e) => e.toString()).toList(),
    //   },
    // );

    var data = await apiService.postRequestWithFilesShipping(
        endPoint: 'ShippingInformations/CreateShippingInformation',
        file: invoiceImage,
        data: {
          'ParcelNumber': shippingNumber,
          'CompanyName': shippingCompany,
          // 'Date': DateTime.now().toString(),
          'OrderDetailsIds': 5,
          //'OrderDetailsIds': 9,
        });
    OrderProcessingShippingEntity shipping = ShippingModel.fromJson(data);
    print(shipping);
    return shipping;
  }
}
