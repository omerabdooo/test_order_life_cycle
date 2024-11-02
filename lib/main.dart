import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:test_order_life_cycle/core/setup_service_locator.dart';
import 'package:test_order_life_cycle/core/sqldb.dart';
import 'package:test_order_life_cycle/core/utils/route.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await SqlDb().intialDb();

  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (create) => SqlDb()),
    ],
     child: const SindbadManagementApp(),
  ),
  );
}

class SindbadManagementApp extends StatelessWidget {
  const SindbadManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 650),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp.router(
        routerConfig: AppRouter.router,
        theme: ThemeData(
          textTheme: GoogleFonts.almaraiTextTheme(
            Theme.of(context).textTheme,
          ),
          scaffoldBackgroundColor:
              const Color(0xFFF9F9F9), // Set default background color
        ),

        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ar', 'AR'), // Arabic, no country code
        ],
        locale: const Locale('ar', 'AR'),
        debugShowCheckedModeBanner: false,
        // home:  home_mnd2(),

        // home: const HomePage(),
        // home: const LoginScreen(),

        //   // admin routes
        //   "admin_home" :(context) => const HomeAdminScreen(),
        //   // "search_by_Order_number" :(context) => const HomeAdminScreen(),
        //   "orders_screen" :(context) => const OrdersAdminScreen(),
        //   "cancel_orders" :(context) => const CancelOrdersAdminScreen(),
        //   // "cancellation_requests" :(context) => const HomeAdminScreen(),
        //   // "payments_and_bonds" :(context) => const HomeAdminScreen(),
        //   // "pending_requests" :(context) => const HomeAdminScreen(),
        //   // "search_for_order" :(context) => const HomeAdminScreen(),
        //   // "store_and_delegate_reports" :(context) => const HomeAdminScreen(),
        //   // "transportation_reports" :(context) => const HomeAdminScreen(),
        //   // "accounts" :(context) => const HomeAdminScreen(),
        //   // "statistics" :(context) => const HomeAdminScreen(),
        //   "PrepareOrder" :(context) => const PrepareOrderAdminScreen(),

        //    "store_home": (context) => const StoreHomePage(),
        //   "store_add_product" :(context) => const StoreAddProduct(),
        //   "store_order_processing" :(context) => const StoreOrderProcessing(),
        //   "store_products" : (context) => const StoreProducts(),
        //   "store_search_product" : (context) => const StoreSearchProduct(),
        //   "store_offer" : (context) => const StoreOffer(),
        //   "store_stop_prodect" : (context) => const StoreStopProduct(),
        //   "store_offer_product" : (context) => const StoreOfferProduct(),
        //   "store_stopped_product" : (context) => const StoreStoppedProduct(),
        //   "store_excel_file" : (context) => const StoreExcelFile(),
        //   "store_add_product_excel" : (context) => const StoreAddProduct(),
        //   "store_report" : (context) => const StoreReport(),
      ),
    );
  }
}
