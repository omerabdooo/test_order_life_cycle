import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_order_life_cycle/features/auth_feature/ui/screens/login_screen.dart';
import 'package:test_order_life_cycle/features/delivery/Home_Delivery/ui/screen/HomeDelivery.dart';
import 'package:test_order_life_cycle/features/delivery/Offline/ui/screen/Offline.dart';
import 'package:test_order_life_cycle/features/delivery/Parcel_Delivery/ui/screen/ParcelDelivery.dart';
import 'package:test_order_life_cycle/features/delivery/Receive_Parcels/ui/screen/ReceiveParcels.dart';
import 'package:test_order_life_cycle/features/delivery/Ready_for_Delivery/ui/screen/Ready_for_Delivery.dart';
import 'package:test_order_life_cycle/features/delivery/QRCodeScanner.dart';
import 'package:test_order_life_cycle/features/store/home/ui/screen/store_home_page.dart';
import 'package:test_order_life_cycle/features/store/order_processing/ui/screen/store_order_processing.dart';
import 'package:test_order_life_cycle/features/y_accountant/confirm_payment/ui/screen/confirm_payment.dart';
// import 'package:sindbad_management_app/store_app_features/add_product/ui/screen/store_add_product.dart';
// import 'package:sindbad_management_app/store_app_features/excel_file/ui/screen/store_excel_file.dart';
// import 'package:sindbad_management_app/store_app_features/home/ui/screen/store_home_page.dart';
// import 'package:sindbad_management_app/store_app_features/offer_product/ui/screen/store_offer_product.dart';
// import 'package:sindbad_management_app/store_app_features/offers/ui/screen/store_offer.dart';
// import 'package:sindbad_management_app/store_app_features/order_processing/ui/screen/store_order_processing.dart';
// import 'package:sindbad_management_app/store_app_features/products/ui/screen/store_products.dart';
// import 'package:sindbad_management_app/store_app_features/report/ui/screen/store_report.dart';
// import 'package:sindbad_management_app/store_app_features/search_product/ui/screen/store_search_product.dart';
// import 'package:sindbad_management_app/store_app_features/stop_product/ui/screen/store_stop_prodect.dart';
// import 'package:sindbad_management_app/store_app_features/stopped_product/ui/screen/store_stopped_product.dart';
// Update with the actual import paths for your views

class StoreRouters {
  String kHomeDelivery = '/home';

  String kParcelDelivery = '/parcelDelivery';
  String kReceiveParcels = '/receiveParcels';
  String kReadyForDelivery = '/readyForDelivery';
  String kOffline = '/offline';
  String kQRCodeScanner = '/qrCodeScanner';

  // String kStoreHome = '/addProduct';

  String kLogin = '/';
  String kStoreHome = '/storeHome';
  String kStoreAddProduct = '/store/addProduct';
  String kStoreOrderProcessing = '/store/orderProcessing';
  String kStoreProducts = '/store/products';
  String kStoreSearchProduct = '/store/searchProduct';
  String kStoreOffer = '/store/offer';
  String kStoreStopProduct = '/store/stopProduct';
  String kStoreOfferProduct = '/store/offerProduct';
  String kStoreStoppedProduct = '/store/stoppedProduct';
  String kStoreExcelFile = '/store/excelFile';
  String kStoreReport = '/store/report';
  String klogin = '/';
  //////////////////////////////////
  ///Accountant
  String kAccountant = 'accountant';
}

abstract class AppRouter {
  static const kStoreHome = 'storeHome';

  static StoreRouters storeRouters = StoreRouters();
  static final router = GoRouter(
    routes: [
      // Store Routes
      // GoRoute(
      //   path: AppRouter.storeRouters.kLogin,
      //   builder: (context, state) => const LoginScreen(),
      // ),
      // GoRoute(
      //   path: AppRouter.storeRouters.kLogin,
      //   builder: (context, state) =>  LoginScreen(),
      // ),
      GoRoute(
        path: AppRouter.storeRouters.kHomeDelivery,
        builder: (context, state) => Homedelivery(),
      ),
      GoRoute(
        path: AppRouter.storeRouters.kParcelDelivery,
        builder: (context, state) => ParcelDelivery(),
      ),
      GoRoute(
        path: AppRouter.storeRouters.kReceiveParcels,
        builder: (context, state) => const ReceiveParcels(),
      ),
      GoRoute(
        path: AppRouter.storeRouters.kReadyForDelivery,
        builder: (context, state) => ReadyForDelivery(),
      ),
      GoRoute(
        path: AppRouter.storeRouters.kOffline,
        builder: (context, state) => Offline(),
      ),
      GoRoute(
        path: AppRouter.storeRouters.kQRCodeScanner,
        builder: (context, state) => const QRCodeScanner(),
      ),

      GoRoute(
        path: AppRouter.storeRouters.kStoreHome,
        builder: (context, state) => const ConfirmPayment(),
      ),
      GoRoute(
        path: AppRouter.storeRouters.klogin,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRouter.storeRouters.kStoreHome,
        builder: (context, state) => const StoreHomePage(),
      ),
      GoRoute(
        path: AppRouter.storeRouters.kStoreOrderProcessing,
        builder: (context, state) {
          final orderId = state.extra as int; // Retrieve arguments if needed
          final orderNum = state.extra; // Retrieve arguments if needed
          final orderDate = state.extra; // Retrieve arguments if needed
          final productNum = state.extra; // Retrieve arguments if needed
          return StoreOrderProcessing(
            orderId: orderId,
            orderNum: orderNum.toString(),
            orderDate: orderDate.toString(),
            productNum: productNum.toString(),
          );
        },
      ),
      GoRoute(
        path: AppRouter.storeRouters.kAccountant,
        builder: (context, state) => const ConfirmPayment(),
      ),

      // GoRoute(
      //   path: '/store/order/processing',
      //   builder: (context, state) {
      //   final arguments = state.extra; // Retrieve arguments if needed
      //   return const StoreOrderProcessing();
      // },
      // ),
      // GoRoute(
      //   path: '/',
      //   builder: (context, state) {
      //     return const LoginScreen();
      //   },
      // ),
      // GoRoute(
      //   path: '/storeHome',
      //   builder: (context, state) {
      //     return const StoreHomePage();
      //   },
      // ),

      // GoRoute(
      //   path: AppRouter.storeRouters.kStoreProducts,
      //   builder: (context, state) => const StoreProducts(),
      // ),
      // GoRoute(
      //   path: AppRouter.storeRouters.kStoreSearchProduct,
      //   builder: (context, state) => const StoreSearchProduct(),
      // ),
      // GoRoute(
      //   path: AppRouter.storeRouters.kStoreOffer,
      //   builder: (context, state) => const StoreOffer(),
      // ),
      // GoRoute(
      //   path: AppRouter.storeRouters.kStoreStopProduct,
      //   builder: (context, state) => const StoreStopProduct(),
      // ),
      // GoRoute(
      //   path: AppRouter.storeRouters.kStoreOfferProduct,
      //   builder: (context, state) => const StoreOfferProduct(),
      // ),
      // GoRoute(
      //   path: AppRouter.storeRouters.kStoreStoppedProduct,
      //   builder: (context, state) => const StoreStoppedProduct(),
      // ),
      // GoRoute(
      //   path: AppRouter.storeRouters.kStoreExcelFile,
      //   builder: (context, state) => const StoreExcelFile(),
      // ),
      // GoRoute(
      //   path: AppRouter.storeRouters.kStoreReport,
      //   builder: (context, state) => const StoreReport(),
      // ),
    ],
  );
}
  // static Route<dynamic> routeApp(RouteSettings routeSettings) {
  //   switch (routeSettings.name) {
  //     // case '/':
  //     //   return MaterialPageRoute(builder: (ctx) => const LoginScreen());
  //     // case '/storeHome':
  //     //   return MaterialPageRoute(builder: (ctx) => const StoreHomePage());

  //     // case '/store/order/processing':
  //     //   return MaterialPageRoute(
  //     //       builder: (ctx) => const StoreOrderProcessing(),
  //     //       settings: RouteSettings(arguments: routeSettings.arguments));

  //     default:
  //       return MaterialPageRoute(builder: (ctx) => const LoginScreen());
  //   }
  // }


