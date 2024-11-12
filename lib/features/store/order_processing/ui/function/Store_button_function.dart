import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_order_life_cycle/features/store/order_processing/ui/widget/button_bill.dart';
import 'package:test_order_life_cycle/features/store/order_processing/ui/widget/button_order_send.dart';

class StoreButtonList extends StatelessWidget {
  const StoreButtonList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
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
          height: 5.h,
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
