import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:test_order_life_cycle/core/api_service.dart';

import 'package:test_order_life_cycle/features/y_accountant/confirm_payment/data/data_source/remote/bound_remote_data_source.dart';
import 'package:test_order_life_cycle/features/y_accountant/confirm_payment/data/repo/bound_erpo_impl.dart';
import 'package:test_order_life_cycle/features/y_accountant/confirm_payment/domin/repo/y_accontant_repo.dart';


import 'package:test_order_life_cycle/features/delivery/Receive_Parcels/data/data_source/remote/receive_parcels_remote_data_source.dart';
import 'package:test_order_life_cycle/features/delivery/Receive_Parcels/data/repos/receive_parcels_repo_impl.dart';
import 'package:test_order_life_cycle/features/store/home/data/data_sources/all_order_remote_data_source.dart';
import 'package:test_order_life_cycle/features/store/home/data/repos/all_order_repo_impl.dart';
import 'package:test_order_life_cycle/features/store/order_processing/data/data_sources/order_processing_remote_data_source.dart';
import 'package:test_order_life_cycle/features/store/order_processing/data/repos/order_processing_repo_impl.dart';


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
  getit.registerSingleton<ReceiveParcelsRepoImpl>(ReceiveParcelsRepoImpl(
      receiveParcelsRemoteDataSource: ReceiveParcelsRemoteDataSourceImpl(
    getit.get<ApiService>(),
    getit.get<FlutterSecureStorage>(),
  ),));
  // getit.registerSingleton<AllOrderRepoImpl>(AllOrderRepoImpl(allOrderRemoteDataSource:  AllOrderRemotDataSourceImpl(
  //   getit.get<ApiService>(),
  //   getit.get<FlutterSecureStorage>(),
  // )

  //    ));
  // getit.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
  //     homeRemoteDataSource: HomeRemoteDataSourceImpl(
  //   getit.get<ApiService>(),
  //   getit.get<FlutterSecureStorage>(),
  // )));

  // getit.registerSingleton<AuthRepoImpl>(AuthRepoImpl(
  //     authRemoteDataSource: AuthRemoteDataSourceImpl(
  //   getit.get<ApiService>(),
  //   getit.get<FlutterSecureStorage>(),
  // )));

  // getit.registerSingleton<SginUpRepoImpl>(SginUpRepoImpl(
  //     sginUPRemoteDataSource: SginUPRemoteDataSourceImpl(
  //   getit.get<ApiService>(),
  //   // getit.get<FlutterSecureStorage>(),
  // )));

  // getit.registerSingleton<SginInRepoImpl>(SginInRepoImpl(
  //     sginInRemoteDataSource: SginInRemoteDataSourceImpl(
  //   getit.get<ApiService>(),
  //   // getit.get<FlutterSecureStorage>(),
  // )));

//   getit.registerSingleton<OrderRepoImpl>(
//     OrderRepoImpl(
//         orderRemoteDataSource:OrderRemoteDataSourceImpl(
//           getit.get<ApiService>(),
//           getit.get<FlutterSecureStorage>(),
//           )
//         ),
// );
  // getit.registerSingleton<ProductDetailsRepoImpl>(ProductDetailsRepoImpl(
  //     productDetailsRemoteDataSource:
  //         ProductDetailsRemoteDataSourceImpl(getit.get<ApiService>())));

  // getit.registerSingleton<CartRepoImpl>(CartRepoImpl(
  //     cartRemoteDataSource: CartRemoteDataSourceImpl(
  //         apiService: getit.get<ApiService>(),
  //         secureStorage: const FlutterSecureStorage())));
  //     getit.registerSingleton<CartRepoImpl>(CartRepoImpl(
  // cartRemoteDataSource:
  //     CartRemoteDataSourceImpl(apiService:  getit.get<ApiService>(),secureStorage: const FlutterSecureStorage())));
  // getit.registerSingleton<CartRepoImpl>(CartRepoImpl(
  //     cartRemoteDataSource: CartRemoteDataSourceImpl(
  //         apiService: getit.get<ApiService>(),
  //         secureStorage: const FlutterSecureStorage())));
  //     getit.registerSingleton<CartRepoImpl>(CartRepoImpl(
  // cartRemoteDataSource:
  //     CartRemoteDataSourceImpl(apiService:  getit.get<ApiService>(),secureStorage: const FlutterSecureStorage())));

  // getit.registerSingleton<OurShopRepoImpl>(OurShopRepoImpl(
  //     ourShopRemoteDataSource: OurShopRemoteDataSourceImpl(
  //   getit.get<ApiService>(),
  //   // getit.get<FlutterSecureStorage>(),
  // )));

  // getit.registerSingleton<ShopsRepoeImpl>(ShopsRepoeImpl(
  //   ShopsRemoteDataSourceImpl(getit.get<ApiService>()),
  // ));

  // getit.registerSingleton<OnlineStoreRepoeImpl>(OnlineStoreRepoeImpl(
  //   storesRemoteDataSource:
  //       OnlineStoresRemoteDataSourceImpl(getit.get<ApiService>()),
  // ));

  //////////////////////////////////////////
  ///
  ///
  // getit.registerSingleton<OrderTrackRepoImpl>(
  //   OrderTrackRepoImpl(
  //     orderTrackRemoteDataSource: OrderTrackRemoteDataSourceImpl(
  //       getit.get<ApiService>(),
  //       getit.get<FlutterSecureStorage>(),
  //     ),
  //   ),
  // );
  // getit.registerSingleton<MyOrderRepoImpl>(
  //   MyOrderRepoImpl(
  //     MyOrderRemoteDataSourceImpl(
  //       getit.get<ApiService>(),
  //       getit.get<FlutterSecureStorage>(),
  //     ),
  //   ),
  // );

  // getit.registerSingleton<ShippingAddressRepoImpl>(ShippingAddressRepoImpl(
  //     shippingAddressRemoteDataSource: ShippingAddressRemoteDataSourceImpl(
  //   getit.get<ApiService>(),
  //   getit.get<FlutterSecureStorage>(),
  // )));

  // getit.registerSingleton<ShowOrderRepoImpl>(ShowOrderRepoImpl(
  //     showOrderRemoteDataSource: ShowOrderRemoteDataSourceImpl(
  //   getit.get<ApiService>(),
  //   getit.get<FlutterSecureStorage>(),
  // )));

  // getit.registerSingleton<SpecialOrderRepoImpl>(SpecialOrderRepoImpl(
  //     sepcialOrdersRemoteDataSource: SepcialOrdersRemoteDataSourceImpl(
  //   getit.get<ApiService>(),
  //   getit.get<FlutterSecureStorage>(),
  // )));
}

