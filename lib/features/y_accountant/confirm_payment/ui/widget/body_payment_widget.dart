import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_order_life_cycle/features/y_accountant/confirm_payment/ui/widget/list_view_confirm_payment.dart';

class BodyConfirmPaymentWidget extends StatelessWidget {
  const BodyConfirmPaymentWidget({
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
            return const ListViewConfirmPayment(
              idBond: '2234',
              bankName: 'العمقي',
              customerName: 'محمد علي سالم',
              amountBond: '2000000',
              numBond: '1999',
              date: '2024/10/2',
            );
          }),
    );
  }
}
