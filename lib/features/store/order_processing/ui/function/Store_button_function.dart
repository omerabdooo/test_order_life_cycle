import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_order_life_cycle/core/setup_service_locator.dart';
import 'package:test_order_life_cycle/features/store/order_processing/data/repos/order_processing_repo_impl.dart';
import 'package:test_order_life_cycle/features/store/order_processing/domain/usecases/order_processing_bill_use_case.dart';
import 'package:test_order_life_cycle/features/store/order_processing/ui/manger/bill/order_processing_bill_cubit.dart';
import 'package:test_order_life_cycle/features/store/order_processing/ui/widget/button_bill.dart';
import 'package:test_order_life_cycle/features/store/order_processing/ui/widget/button_order_send.dart';

class StoreButtonList extends StatelessWidget {
  const StoreButtonList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderProcessingBillCubit(OrderProcessingBillUseCase(
        orderProcessingRepo: getit<OrderProcessingRepoImpl>(),
      )),
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonBill(
                  // billDate: '2024/10/2',
                  // billNumber: '2102511025',
                  // billMount: '125.00',
                  ),
              // SizedBox(
              //   width: 50.w,
              // ),
              //const ButtonPrintOrderTitle(),
            ],
          ),
          SizedBox(
            height: 7.h,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonOrderSend(),
              // SizedBox(
              //   width: 50.w,
              // ),
              // KCustomPrimaryButtonWidget(
              //   buttonName: "الغاء الطلب",
              //   onPressed: () {
              //     orderCancle(context);
              //   },
              // )
            ],
          )
        ],
      ),
    );
  }

  // void orderCancle(BuildContext context) {
  //   showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           content: SizedBox(
  //             height: 30.h,
  //             child: const Text(
  //               "هل تريد الغاء الطلب؟",
  //               style: TextStyle(color: Colors.black),
  //             ),
  //           ),
  //           actions: [
  //             ActionButtonOrderCancle(
  //               title: 'موافق',
  //               onTap: () {},
  //             ),
  //             ActionButtonOrderCancle(
  //               title: 'تراجع',
  //               onTap: () {
  //                 Navigator.of(context).pop();
  //               },
  //             ),
  //           ],
  //         );
  //       });
  // }
}
