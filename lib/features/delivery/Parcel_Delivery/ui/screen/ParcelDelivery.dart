import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:test_order_life_cycle/core/utils/route.dart';
import 'package:test_order_life_cycle/core/widgets/NumberOrder.dart';
import 'package:test_order_life_cycle/core/widgets/custom_appbar_widget.dart';
import 'package:test_order_life_cycle/core/widgets/custom_primary_button_widget.dart';

class ParcelDelivery extends StatefulWidget {
  @override
  State<ParcelDelivery> createState() => _ParcelDeliveryState();
}

class _ParcelDeliveryState extends State<ParcelDelivery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            KCustomAppBarWidget(
              nameAppbar: "تسليم طرود",
            ),
            KNumberOrderWidget(
              isShow: false,
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              height: 50.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                KCustomPrimaryButtonWidget(
                    width: 170,
                    height: 48,
                    buttonName: "تأكيـــد",
                    onPressed: () {}),
                SizedBox(width: 20.h), // Space between buttons
                KCustomPrimaryButtonWidget(
                    width: 85,
                    height: 48,
                    buttonName: "إغلاق",
                    onPressed: () {
                      // OrderNumber.clear();
                      // OrderNumber1.clear();
                      // GoRouter.of(context).pushReplacement(
                      //     AppRouter.deliveryRouters.kDeliverHomePage);
                    }),
                SizedBox(width: 15.h), // Space between buttons
              ],
            ),
          ],
        ),
      ),
    );
  }
}
