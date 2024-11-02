import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_order_life_cycle/core/shared_widgets/salem_drawer/drawer_widget.dart';
import 'package:test_order_life_cycle/core/sqldb.dart';
import 'package:test_order_life_cycle/core/styles/Colors.dart';
import 'package:test_order_life_cycle/core/styles/text_style.dart';
import 'package:test_order_life_cycle/core/widgets/a_order.dart';
import 'package:test_order_life_cycle/core/widgets/custom_appbar_widget.dart';
import 'package:test_order_life_cycle/core/widgets/custom_search_widget.dart';

class ReadyForDelivery extends StatefulWidget {
  const ReadyForDelivery({super.key});

  @override
  State<ReadyForDelivery> createState() => _ReadyForDeliveryState();
}

class _ReadyForDeliveryState extends State<ReadyForDelivery> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const KDrawerWidget(),
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const KCustomAppBarWidget(
            nameAppbar: "الطرود التي تم تسليمها",
          ),
          SizedBox(
            height: 2.h,
          ),
          KCustomSearchWidget(
            height: 23,
            width: 338,
            hintText: "رقم الطلب:",
          ),
          KCustomSearchWidget(
            height: 23,
            width: 338,
            hintText: "رقم تلفون:",
          ),
           ListView(
              children: [
                ListView.builder(
                    itemCount: 5,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, i) {
                      return KOrdersWidget(
                          receiptCode: "",
                          OrderNumber: "",
                          Phone: "735961434",
                          Costmor: "Khaild ",
                          NumberParcels: "1",
                          TotalNumber: "1",
                          Backcolor: AppColors.greyLight);
                    }),
              ],
            ),
        ],
      ),
      floatingActionButton: KButtonWidget(),
    );
  }
}

class KButtonWidget extends StatelessWidget {
  // const card({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.h),
      child: Container(
        width: 85.w,
        height: 48.h,
        decoration: BoxDecoration(
          // color: Color.fromRGBO(226, 126, 126, 1),
          borderRadius: BorderRadius.circular(200.r),
          // border: Border.all()),
        ),
        child: FloatingActionButton(
            backgroundColor: Color.fromRGBO(226, 126, 126, 1),
            child: Text(
              "إغلاق",
              style: KTextStyle.tabs.copyWith(color: AppColors.white),
            ),
            onPressed: () {
              // GoRouter.of(context)
              //     .pushReplacement(AppRouter.deliveryRouters.kDeliverHomePage);
            }),
      ),
    );
  }
}
