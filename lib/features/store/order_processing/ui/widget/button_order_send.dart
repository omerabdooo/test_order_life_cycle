import 'package:flutter/material.dart';
import 'package:test_order_life_cycle/core/widgets/custom_data_dialog_widget.dart';
import 'package:test_order_life_cycle/core/widgets/custom_primary_button_widget.dart';

class ButtonOrderSend extends StatelessWidget {
  const ButtonOrderSend({
    super.key,
    this.testConroller,
    this.dateConroller,
    this.numberConroller,
    this.mountConroller,
  });
  final TextEditingController? testConroller;
  final TextEditingController? dateConroller;
  final TextEditingController? numberConroller;
  final TextEditingController? mountConroller;

  @override
  Widget build(BuildContext context) {
    return KCustomPrimaryButtonWidget(
        buttonName: "تم ارسال الطلب",
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return CustomDataDialogWidget(
                  headTitle: 'بيانات الشحن',
                  firstTitle: 'التاريخ',
                  secondTitle: 'رقم فاتورة الشحن',
                  thierdTitle: 'شركة النقل',
                  onPressedSure: () {},
                  // dateController: dateConroller!,
                  // numberController: numberConroller!,
                  // mountController: mountConroller!,
                );
              });
        });
  }
}
