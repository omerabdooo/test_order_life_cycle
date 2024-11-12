import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_order_life_cycle/core/setup_service_locator.dart';
import 'package:test_order_life_cycle/features/y_accountant/confirm_payment/data/repo/bound_erpo_impl.dart';
import 'package:test_order_life_cycle/features/y_accountant/confirm_payment/domin/usecase/get_bound_usecase.dart';
import 'package:test_order_life_cycle/features/y_accountant/confirm_payment/domin/usecase/update_bound_state_usecase.dart';
import 'package:test_order_life_cycle/features/y_accountant/confirm_payment/ui/manager/cubit/get_bound_cubit.dart';
import 'package:test_order_life_cycle/features/y_accountant/confirm_payment/ui/manager/cubit/update_bound_state_cubit.dart';
import 'package:test_order_life_cycle/features/y_accountant/confirm_payment/ui/widget/confirm_payment_body.dart';

class ConfirmPayment extends StatelessWidget {
  const ConfirmPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) => GetBoundCubit(GetBoundUSeCase(
            yAccontantRepo: getit.get<YAccontantRepoimple>(),
          )),
        ),
        BlocProvider(
          create: (context) => UpdateBoundStateCubit(UpdateBoundStateUsecase(
            yAccontantRepo: getit.get<YAccontantRepoimple>(),
          )),
        ),
      ], child: const ConfirmPaymentBody()),
    );
  }
}
