import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:test_order_life_cycle/core/api_service.dart';
import 'package:test_order_life_cycle/features/auth_feature/data/data_source/auth_remote_data_source.dart';
import 'package:test_order_life_cycle/features/auth_feature/data/repo/auth_repo_impl.dart';
import 'package:test_order_life_cycle/features/delivery/Parcel_Delivery/data/data_source/remote/parcel_delivery_remote_data_source.dart';
import 'package:test_order_life_cycle/features/delivery/Parcel_Delivery/data/repos/parcel_delivery_repo_impl.dart';
import 'package:test_order_life_cycle/features/delivery/Ready_for_Delivery/data/data_source/remote/ready_for_delivery_remote_data_source.dart';
import 'package:test_order_life_cycle/features/delivery/Ready_for_Delivery/data/repos/ready_for_delivery_repo_impl.dart';
import 'package:test_order_life_cycle/features/delivery/Receive_Parcels/data/data_source/remote/receive_parcels_remote_data_source.dart';
import 'package:test_order_life_cycle/features/delivery/Receive_Parcels/data/repos/receive_parcels_repo_impl.dart';
import 'package:test_order_life_cycle/features/k_accounant/confirm_payment/data/data_source/payment_bills_data_source.dart';
import 'package:test_order_life_cycle/features/k_accounant/confirm_payment/data/repos/payment_bills_repo_impl.dart';
import 'package:test_order_life_cycle/features/store/home/data/data_sources/all_order_remote_data_source.dart';
import 'package:test_order_life_cycle/features/store/home/data/repos/all_order_repo_impl.dart';
import 'package:test_order_life_cycle/features/store/order_processing/data/data_sources/order_processing_remote_data_source.dart';
import 'package:test_order_life_cycle/features/store/order_processing/data/repos/order_processing_repo_impl.dart';

import 'package:test_order_life_cycle/features/y_accountant/confirm_payment/data/data_source/remote/bound_remote_data_source.dart';
import 'package:test_order_life_cycle/features/y_accountant/confirm_payment/data/repo/bound_erpo_impl.dart';
import 'package:test_order_life_cycle/features/y_accountant/confirm_payment/domin/repo/y_accontant_repo.dart';

import 'package:test_order_life_cycle/features/delivery/Receive_Parcels/data/data_source/remote/receive_parcels_remote_data_source.dart';

final getit = GetIt.instance;

void setupServiceLocator() {
  getit.registerSingleton<ApiService>(ApiService(Dio()));

  getit.registerSingleton<FlutterSecureStorage>(
    const FlutterSecureStorage(),
  );

  getit.registerSingleton<YAccontantRepoimple>(YAccontantRepoimple(
      boundRemoteDataSource: BoundRemoteDataSourceImpl(
    apiService: getit.get<ApiService>(),
    secureStorage: getit.get<FlutterSecureStorage>(),
  )));

  getit.registerSingleton<AllOrderRepoImpl>(
    AllOrderRepoImpl(
      AllOrderRemotDataSourceImpl(
        getit.get<ApiService>(),
        getit.get<FlutterSecureStorage>(),
      ),
    ),
  );
  getit.registerSingleton<OrderProcessingRepoImpl>(
    OrderProcessingRepoImpl(
      OrderProcessingRemotDataSourceImpl(
        getit.get<ApiService>(),
        getit.get<FlutterSecureStorage>(),
      ),
    ),
  );
  getit.registerSingleton<ParcelDeliveryRepoImpl>(ParcelDeliveryRepoImpl(
    parcelDeliveryRemoteDataSource: ParcelDeliveryRemoteDataSourceImpl(
      getit.get<ApiService>(),
      getit.get<FlutterSecureStorage>(),
    ),
  ));
  getit.registerSingleton<ReceiveParcelsRepoImpl>(ReceiveParcelsRepoImpl(
    receiveParcelsRemoteDataSource: ReceiveParcelsRemoteDataSourceImpl(
      getit.get<ApiService>(),
      getit.get<FlutterSecureStorage>(),
    ),
  ));
  getit.registerSingleton<ReadyForDeliveryRepoImpl>(ReadyForDeliveryRepoImpl(
    readyForDeliveryRemoteDataSource: ReadyForDeliveryRemoteDataSourceImpl(
      getit.get<ApiService>(),
      getit.get<FlutterSecureStorage>(),
    ),
  ));
  getit.registerSingleton<AuthRepoImpl>(AuthRepoImpl(
      authRemoteDataSource: AuthRemoteDataSourceImpl(
    getit.get<ApiService>(),
    getit.get<FlutterSecureStorage>(),
  )));

  getit.registerSingleton<PaymentBillsRepoImpl>(PaymentBillsRepoImpl(
    PaymentBillsDataSourceImpl(
      getit.get<ApiService>(),
      getit.get<FlutterSecureStorage>(),
    ),
  ));
}
