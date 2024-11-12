import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:test_order_life_cycle/core/api_service.dart';
import 'package:test_order_life_cycle/features/k_accounant/confirm_payment/data/models/approve_invoice_model.dart';
import 'package:test_order_life_cycle/features/k_accounant/confirm_payment/data/models/choose_type_of_invoice_model.dart';
import 'package:test_order_life_cycle/features/k_accounant/confirm_payment/data/models/payment_bills_to_confirm_model.dart';
import 'package:test_order_life_cycle/features/k_accounant/confirm_payment/domain/approve_invoice_entity.dart';
import 'package:test_order_life_cycle/features/k_accounant/confirm_payment/domain/choose_type_of_invoice_entity.dart';
import 'package:test_order_life_cycle/features/k_accounant/confirm_payment/domain/payment_bills_to_confirm_entity.dart';

abstract class PaymentBillsDataSource {
  Future<List<PaymentBillsToConfirmEntity>> getPaymentBillsToConfirm();
  Future<ApproveInvoiceEntity> approveInvoice(String invoiceId);
  Future<ChooseTypeOfInvoiceEntity> chooseTypeOfInvoice(int invoiceType, String invoiceId);
}

class PaymentBillsDataSourceImpl implements PaymentBillsDataSource {
  final ApiService apiService;
  final FlutterSecureStorage secureStorage;

  PaymentBillsDataSourceImpl(this.apiService, this.secureStorage);

  // get Token Function
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

  // get PaymentBillsToConfirm List function
  List<PaymentBillsToConfirmEntity> getPaymentBillsToConfirmList(
      Map<String, dynamic> data) {
    return getListItemsFromData(
        data, (item) => PaymentBillsToConfirmModel.fromJson(item));
  }

  @override
  Future<List<PaymentBillsToConfirmEntity>> getPaymentBillsToConfirm() async {
    var data = await apiService.post(
      endPoint: "OrderDetailsInvoices/GetOrderDetailsInvoicesByFilter",
      data: {
        "invoiceStatus": 3,
      },
    );
    List<PaymentBillsToConfirmEntity> paymentBills =
        getPaymentBillsToConfirmList(data);

    print(paymentBills);
    return paymentBills;
  }

  @override
  Future<ApproveInvoiceEntity> approveInvoice(String invoiceId) async {
    var data = await apiService.post(
      endPoint:
          "OrderDetailsInvoices/ApproveInvoice?invoiceId=$invoiceId&invoiceNumber=0",
      data: {},
    );

    ApproveInvoiceEntity approveInvoiceEntity =
        ApproveInvoiceModel.fromJson(data);

    print(approveInvoiceEntity);
    return approveInvoiceEntity;
  }
  
  @override
  Future<ChooseTypeOfInvoiceEntity> chooseTypeOfInvoice(int invoiceType, String invoiceId)async {
  var data = await apiService.post(
    endPoint:
      "OrderDetailsInvoices/ChooseTypeOfInvoice?invoiceType=1&invoiceId=$invoiceId&invoiceNumber=0",
    data: {},
  );

  ChooseTypeOfInvoiceEntity chooseTypeOfInvoiceEntity =
    ChooseTypeOfInvoiceModel.fromJson(data);

  print(chooseTypeOfInvoiceEntity);
  return chooseTypeOfInvoiceEntity;
  }
}
