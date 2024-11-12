import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_order_life_cycle/core/widgets/custom_appbar_widget.dart';
import 'package:test_order_life_cycle/features/k_accounant/confirm_payment/ui/cubit/get_payment_bill_cubit/get_payment_bill_cubit.dart';
import 'package:test_order_life_cycle/features/k_accounant/confirm_payment/ui/widget/body_payment_widget.dart';
import 'package:test_order_life_cycle/features/k_accounant/confirm_payment/ui/widget/search_confirm_payment.dart';

class KSAConfirmPayment extends StatefulWidget {
  const KSAConfirmPayment({super.key});

  @override
  State<KSAConfirmPayment> createState() => _KSAConfirmPaymentState();
}

class _KSAConfirmPaymentState extends State<KSAConfirmPayment> {
  @override
  void initState() {
    super.initState();
    context.read<GetPaymentBillCubit>().getPaymentBillsToConfirm();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const KCustomAppBarWidget(
              nameAppbar: "فواتير جديدة",
              count: 0,
              isHome: false,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
              child: const Column(
                children: [
                  KSASearchConfirmPayment(),
                  KSABodyConfirmPaymentWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
