import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return Expanded(
      child:
          //BlocConsumer<OrderProcessingBillCubit, OrderProcessingBillState>(
          //   listener: (context, state) {
          //     if (state is OrderProcessingBillFailuer) {
          //       ScaffoldMessenger.of(context).showSnackBar(
          //           SnackBar(content: Text(state.errMessage.toString())));
          //       print(state.errMessage.toString());
          //       print("العملية  فشلت ");
          //     } else if (state is OrderProcessingBillSuccess) {
          //       Navigator.pop(context);
          //       print("العملية اكتملت بنجاح ");
          //     }
          //   },
          //   builder: (context, state) {
          KCustomPrimaryButtonWidget(
        buttonName: "الفاتورة",
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return CustomDataDialogWidget(
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
                            ids,
                            mount = num.parse(mountConroller.text),

                            // num.parse(mountConroller.text),
                            images!,
                            numberConroller.text,
                            DateTime.now(),

                            // dateConroller.text
                          );
                      //Navigator.of(context).pop();
                      print(
                          'omarrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr ');
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
      ),
    );
  }
}
