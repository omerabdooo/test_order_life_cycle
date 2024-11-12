import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_order_life_cycle/core/functions/image_picker_function.dart';
import 'package:test_order_life_cycle/core/widgets/custom_data_dialog_widget.dart';
import 'package:test_order_life_cycle/core/widgets/custom_primary_button_widget.dart';
import 'package:test_order_life_cycle/features/store/order_processing/ui/manger/bill/order_processing_bill_cubit.dart';
import 'package:test_order_life_cycle/features/store/order_processing/ui/widget/store_order_processing_list_view.dart';

class ButtonBill extends StatelessWidget {
  ButtonBill({
    super.key,
    this.billDate,
  });
  final String? billDate;
  num? mount;
  // int mount = int.parse(mountConroller.text);

  @override
  Widget build(BuildContext context) {
    return KCustomPrimaryButtonWidget(
      height: 23.h,
      width: 200.w,
      buttonName: "انشاءالفاتورة",
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) {
              return CustomDataDialogWidget(
                headTitle: 'بياتات الفاتورة',
                firstTitle: 'التاريخ',
                secondTitle: 'رقم الفاتورة',
                thierdTitle: 'قيمة الفاتورة',
                onPressedSure: () async {
                  // if (mountConroller.text == null ||
                  //     dateConroller.text == null ||
                  //     numberConroller.text == null) {
                  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  //       content: Text("قم بتعبئة جميع الحقول")));
                  // }
                  // print("Dooooooooooooooooooooooooooooooooooone");

                  try {
                    await context
                        .read<OrderProcessingBillCubit>()
                        .fechOrderBill(
                          ids ?? [],
                          mount = num.parse(mountConroller.text),

                          // num.parse(mountConroller.text),
                          images!,
                          numberConroller.text,
                          DateTime.now(),

                          // dateConroller.text
                        );

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('تم انشاء فاتورة بنجاح '),
                      ),
                    );
                    Navigator.of(context).pop();
                    numberConroller.clear();
                    mountConroller.clear();
                    mountConroller.clear();
                    dateConroller.clear();
                    print(
                        'amarrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr ');
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('هنالك خطا ما  $e'),
                      ),
                    );
                    print('ikjgtiorjijjguiwheiruthwuiertywuorie $images');
                  }
                  // context.read<OrderProcessingBillCubit>().fechOrderBill(
                  //     int.parse(mountConroller.text),
                  //     images!,
                  //     numberConroller.text);
                  // print("State");
                },
              );
            });
        // });
      },
    );
  }
}
