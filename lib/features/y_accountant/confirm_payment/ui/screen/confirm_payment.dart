import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_order_life_cycle/core/setup_service_locator.dart';
import 'package:test_order_life_cycle/core/widgets/custom_appbar_widget.dart';
import 'package:test_order_life_cycle/features/y_accountant/confirm_payment/data/repo/bound_erpo_impl.dart';
import 'package:test_order_life_cycle/features/y_accountant/confirm_payment/domin/usecase/get_bound_usecase.dart';
import 'package:test_order_life_cycle/features/y_accountant/confirm_payment/domin/usecase/update_bound_state_usecase.dart';
import 'package:test_order_life_cycle/features/y_accountant/confirm_payment/ui/manager/cubit/get_bound_cubit.dart';
import 'package:test_order_life_cycle/features/y_accountant/confirm_payment/ui/manager/cubit/update_bound_state_cubit.dart';
import 'package:test_order_life_cycle/features/y_accountant/confirm_payment/ui/widget/body_payment_widget.dart';
import 'package:test_order_life_cycle/features/y_accountant/confirm_payment/ui/widget/search_confirm_payment.dart';

class ConfirmPayment extends StatelessWidget {
  const ConfirmPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
           BlocProvider(
              create: (context) => GetBoundCubit(GetBoundUSeCase(
          yAccontantRepo:       getit.get<YAccontantRepoimple>(),
              )),
            ),
             BlocProvider(
              create: (context) => UpdateBoundStateCubit(UpdateBoundStateUsecase(
               yAccontantRepo:  getit.get<YAccontantRepoimple>(),
              )),
            ),
        ],
        child: SingleChildScrollView(
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
        ),
      ),
    );
  }
}
