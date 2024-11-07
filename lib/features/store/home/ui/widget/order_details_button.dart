import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:test_order_life_cycle/core/styles/Colors.dart';
import 'package:test_order_life_cycle/features/store/home/ui/widget/info_text_list_view.dart';

import '../../../../../core/utils/route.dart';

class OrderDetailsButton extends StatelessWidget {
  const OrderDetailsButton({
    super.key,
    required this.bondNum,
    required this.date,
    required this.itemNum,
    required this.idOrder,
  });
  final int idOrder;

  final String bondNum;
  final String date;
  final String itemNum;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.go(AppRouter.storeRouters.kStoreOrderProcessing,
            extra: idOrder);
        // GoRouter.of(context).push(AppRouter.storeRouters.kStoreOrderProcessing);
        // Navigator.pushNamed(context, "/store/order/processing",
        //     arguments: idOrder);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
        height: 100.h,
        width: 343.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: AppColors.primaryColor,
            boxShadow: const [
              BoxShadow(
                  color: Colors.grey, offset: Offset(-1, 1), blurRadius: 1)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InfoTextListView(
              info: bondNum,
              title: 'رقم الطلب:  ',
            ),
            InfoTextListView(
              info: date,
              title: 'التاريخ:  ',
            ),
            InfoTextListView(
              info: itemNum,
              title: 'عدد الاصناف:  ',
            ),
          ],
        ),
      ),
    );
  }
}
