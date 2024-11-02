import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_order_life_cycle/core/setup_service_locator.dart';
import 'package:test_order_life_cycle/core/shared_widgets/salem_drawer/drawer_widget.dart';
import 'package:test_order_life_cycle/features/delivery/Receive_Parcels/data/repos/receive_parcels_repo_impl.dart';
import 'package:test_order_life_cycle/features/delivery/Receive_Parcels/domain/usecases/order_information_use_case.dart';
import 'package:test_order_life_cycle/features/delivery/Receive_Parcels/domain/usecases/receive_parcels_use_case.dart';
import 'package:test_order_life_cycle/features/delivery/Receive_Parcels/ui/manger/order_information_cubit/order_information_cubit.dart';
import 'package:test_order_life_cycle/features/delivery/Receive_Parcels/ui/manger/receive_parcels_cubit/receive_parcels_cubit.dart';
import 'package:test_order_life_cycle/features/delivery/Receive_Parcels/ui/widgets/receive_parcels_body.dart';
// import 'package:sndbad/features/home_screen/ui/screen/HomeScreen.dart'; // Import the flutter_screenutil package//+

class ReceiveParcels extends StatefulWidget {
  const ReceiveParcels({super.key});

  @override
  State<ReceiveParcels> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ReceiveParcels> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ReceiveParcelsCubit(ReceiveParcelsUseCase(
              getit.get<ReceiveParcelsRepoImpl>(),
            )),
          ),
          BlocProvider(
            create: (context) => OrderInformationCubit(GetOrderInformationUseCase(
              getit.get<ReceiveParcelsRepoImpl>(),
            )),
          ),
        ],
        child: const Scaffold(
            drawer: KDrawerWidget(), body: ReceiveParcelsBody()));
  }
}
