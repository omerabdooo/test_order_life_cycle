import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_order_life_cycle/core/setup_service_locator.dart';
import 'package:test_order_life_cycle/core/widgets/custom_appbar_widget.dart';
import 'package:test_order_life_cycle/features/store/order_processing/data/repos/order_processing_repo_impl.dart';
import 'package:test_order_life_cycle/features/store/order_processing/domain/usecases/order_processing_usecase.dart';
import 'package:test_order_life_cycle/features/store/order_processing/ui/function/Store_button_function.dart';
import 'package:test_order_life_cycle/features/store/order_processing/ui/manger/order_processing_cubit.dart';
import 'package:test_order_life_cycle/features/store/order_processing/ui/widget/store_order_processing_container.dart';
import 'package:test_order_life_cycle/features/store/order_processing/ui/widget/store_order_processing_list_view.dart';

class StoreOrderProcessing extends StatelessWidget {
  const StoreOrderProcessing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => OrderProcessingCubit(OrderProcessingUsecase(
          getit<OrderProcessingRepoImpl>(),
        )),
        child: const Column(
          children: [
            //AppBar
            KCustomAppBarWidget(
              nameAppbar: "تجهيز الطلب",
              count: 0,
              isHome: false,
            ),
            //Container that show detalis
            SingleChildScrollView(
              child: Column(
                children: [
                  StoreOrderProcessingContainer(),
                  StoreOrderProcessingListView(),
                ],
              ),
            ),
            StoreButtonList()
          ],
        ),
      ),
    );
  }
}
