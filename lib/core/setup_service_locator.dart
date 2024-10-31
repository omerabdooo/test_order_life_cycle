import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:test_order_life_cycle/core/api_service.dart';
import 'package:test_order_life_cycle/features/y_accountant/confirm_payment/data/data_source/remote/bound_remote_data_source.dart';
import 'package:test_order_life_cycle/features/y_accountant/confirm_payment/data/repo/bound_erpo_impl.dart';
import 'package:test_order_life_cycle/features/y_accountant/confirm_payment/domin/repo/y_accontant_repo.dart';


final getit = GetIt.instance;

void setupServiceLocator() {
  getit.registerSingleton<ApiService>(ApiService(Dio()));

  getit.registerSingleton<FlutterSecureStorage>(
    const FlutterSecureStorage(),
  );

  getit.registerSingleton<YAccontantRepo>(YAccontantRepoimple(
      boundRemoteDataSource: BoundRemoteDataSourceImpl(
 apiService:    getit.get<ApiService>(),
   secureStorage:  getit.get<FlutterSecureStorage>(),
  )));



}