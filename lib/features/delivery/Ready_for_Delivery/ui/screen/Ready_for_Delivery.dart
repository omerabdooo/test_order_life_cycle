import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_order_life_cycle/core/setup_service_locator.dart';
import 'package:test_order_life_cycle/core/shared_widgets/salem_drawer/drawer_widget.dart';
import 'package:test_order_life_cycle/core/styles/Colors.dart';
import 'package:test_order_life_cycle/features/delivery/Ready_for_Delivery/data/repos/ready_for_delivery_repo_impl.dart';
import 'package:test_order_life_cycle/features/delivery/Ready_for_Delivery/domain/usecases/ready_for_delivery_use_case.dart';
import 'package:test_order_life_cycle/features/delivery/Ready_for_Delivery/ui/manger/ready_for_delivery_cubit/ready_for_delivery_cubit.dart';
import 'package:test_order_life_cycle/features/delivery/Ready_for_Delivery/ui/widgets/ready_for_delivery_body.dart';

class ReadyForDelivery extends StatefulWidget {
  const ReadyForDelivery({super.key});

  @override
  State<ReadyForDelivery> createState() => _ReadyForDeliveryState();
}

class _ReadyForDeliveryState extends State<ReadyForDelivery> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              ReadyForDeliveryCubit(GetAllReadyForDeliveryUseCase(
            getit.get<ReadyForDeliveryRepoImpl>(),
          )),
        ),
      ],
      child: const Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColors.backgroundColor,
          drawer: KDrawerWidget(),
          body: ReadyForDeliveryBody()),
    );
  }
}
