import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_order_life_cycle/core/widgets/custom_appbar_widget.dart';
import 'package:test_order_life_cycle/features/y_accountant/confirm_payment/ui/manager/cubit/get_bound_cubit.dart';

import 'package:test_order_life_cycle/features/y_accountant/confirm_payment/ui/widget/body_payment_widget.dart';
import 'package:test_order_life_cycle/features/y_accountant/confirm_payment/ui/widget/search_confirm_payment.dart';

class ConfirmPaymentBody extends StatefulWidget {
  const ConfirmPaymentBody({
    super.key,
  });

  @override
  State<ConfirmPaymentBody> createState() => _ConfirmPaymentBodyState();
}

class _ConfirmPaymentBodyState extends State<ConfirmPaymentBody> {
  @override
  void initState() {
    
    super.initState();
    context.read<GetBoundCubit>().getBound();
  }
  @override
  Widget build(BuildContext context) {
    return 
       SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const KCustomAppBarWidget(
              nameAppbar: "تاكيد السداد",
              count: 0,
              isHome: false,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
              child: const Column(
                children: [
                  SearchConfirmPayment(),
                  BodyConfirmPaymentWidget(),
                ],
              ),
            ),
          ],
        ),
      
    );
  }
}
