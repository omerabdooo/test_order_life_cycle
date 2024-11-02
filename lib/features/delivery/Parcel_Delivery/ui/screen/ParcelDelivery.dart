import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_order_life_cycle/core/setup_service_locator.dart';
import 'package:test_order_life_cycle/core/shared_widgets/salem_drawer/drawer_widget.dart';
import 'package:test_order_life_cycle/features/delivery/Parcel_Delivery/data/repos/parcel_delivery_repo_impl.dart';
import 'package:test_order_life_cycle/features/delivery/Parcel_Delivery/domain/usecases/parcel_delivery_use_case.dart';
import 'package:test_order_life_cycle/features/delivery/Parcel_Delivery/ui/manger/parcel_delivery_cubit/parcel_delivery_cubit.dart';
import 'package:test_order_life_cycle/features/delivery/Parcel_Delivery/ui/widgets/parcel_delivery_body.dart';

class ParcelDelivery extends StatefulWidget {
  const ParcelDelivery({super.key});

  @override
  State<ParcelDelivery> createState() => _ParcelDeliveryState();
}

TextEditingController receiptCode = TextEditingController();

class _ParcelDeliveryState extends State<ParcelDelivery> {
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              ParcelDeliveryCubit(ParcelDeliveryUseCase(
            getit.get<ParcelDeliveryRepoImpl>(),
          )),

        ),
      ], 
      child: const Scaffold(
      drawer: KDrawerWidget(),
      body: ParcelDeliveryBody(),
    ));
  }
}
