import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_order_life_cycle/features/k_accounant/confirm_payment/ui/widget/list_view_confirm_payment.dart';

class KSABodyConfirmPaymentWidget extends StatelessWidget {
  const KSABodyConfirmPaymentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 330.w,
      height: 450.h,
      child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: 10,
          itemBuilder: (context, i) {
            return KSAListViewConfirmPayment(
              billNum: 2234,
              storeName: 'محل الاواني المنزلية',
              date: "2024/10/2",
              mandobName: 'عمر العمودي',
              amountOrderItems: 2200,
              orderNum: "255",
              amountBill: 2200,
              different: 00,
              confrmOnPressed: () {},
              transOnPressed: () {},
            );
          }),
    );
  }
}
