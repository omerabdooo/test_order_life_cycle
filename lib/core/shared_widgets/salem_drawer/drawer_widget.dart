import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:test_order_life_cycle/core/utils/route.dart';
import 'drawer_tile_widget.dart';

class KDrawerWidget extends StatelessWidget {
  const KDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            DrawerHeader(
                padding: const EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 25.h,
                      width: 150.w,
                      alignment: Alignment.center,
                      child: Text(
                        'متجر سندباد',
                        style: TextStyle(
                            fontSize: 17.5.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    )
                  ],
                )),
            KDrawerTileWidget(
              title: 'تسليم الطرد',
              leading: const Icon(Icons.history),
              ontap: () {
                GoRouter.of(context)
                    .pushReplacement(AppRouter.storeRouters.kParcelDelivery);
              },
            ),
            KDrawerTileWidget(
              title: 'استلام الطرد',
              leading: const Icon(Icons.history),
              ontap: () {
                GoRouter.of(context)
                    .pushReplacement(AppRouter.storeRouters.kReceiveParcels);
              },
            ),
            KDrawerTileWidget(
              title: 'قائمة',
              leading: const Icon(Icons.history),
              ontap: () {
                GoRouter.of(context)
                    .pushReplacement(AppRouter.storeRouters.kRemainingParcels);
              },
            ),
            KDrawerTileWidget(
              title: 'الماسح',
              leading: const Icon(Icons.history),
              ontap: () {
                GoRouter.of(context)
                    .pushReplacement(AppRouter.storeRouters.kQRCodeScanner);
              },
            ),
          ],
        ),
      ),
    );
  }
}
