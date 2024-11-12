import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_order_life_cycle/core/functions/image_picker_function.dart';
import 'package:test_order_life_cycle/core/setup_service_locator.dart';
import 'package:test_order_life_cycle/core/widgets/custom_data_dialog_widget.dart';
import 'package:test_order_life_cycle/core/widgets/custom_primary_button_widget.dart';
import 'package:test_order_life_cycle/core/widgets/diaolg_shipping.dart';
import 'package:test_order_life_cycle/features/store/order_processing/data/repos/order_processing_repo_impl.dart';
import 'package:test_order_life_cycle/features/store/order_processing/domain/usecases/order_processing_shipping_usecase.dart';
import 'package:test_order_life_cycle/features/store/order_processing/ui/manger/shipping/shipping_cubit.dart';
import 'package:test_order_life_cycle/features/store/order_processing/ui/widget/store_order_processing_list_view.dart';

class ButtonOrderSend extends StatelessWidget {
  const ButtonOrderSend({
    super.key,
    // this.testConroller,
    // this.dateConrollers,
    // this.numberConrollers,
    // this.mountConrollers,
  });
  // final TextEditingController? testConroller;
  // final TextEditingController? dateConrollers;
  // final TextEditingController? numberConrollers;
  // final TextEditingController? mountConrollers;
  @override
  Widget build(BuildContext context) {
    return KCustomPrimaryButtonWidget(
        height: 20.h,
        width: 200.w,
        buttonName: "ارسال الطلب",
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return CustomDataDialogWidgetShipping(
                  headTitle: 'بيانات الشحن',
                  firstTitle: 'التاريخ',
                  secondTitle: 'رقم فاتورة الشحن',
                  thierdTitle: 'شركة النقل',
                  onPressedSure: () async {
                    // String mountText = mountConrollers!.text;
                    try {
                      await context.read<ShippingCubit>().fechOrderShipping(
                          ids ?? [],
                          numberConrollers.text,
                          images!,
                          mountConrollers.text
                          // mountText,

                          // mountConroller?.text ?? ""
                          );
                      // String? cc = numberConrollers.text;
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('تم شحن الطلب بنجاح '),
                        ),
                      );
                      Navigator.of(context).pop();
                      numberConrollers.clear();
                      // mountText = "";
                      mountConrollers.clear();
                      dateConrollers.clear();
                      print(
                          'amarrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr ');
                      // print('تبا لك $cc');
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('هنالك خطا ما  $e'),
                        ),
                      );
                      print('ikjgtiorjijjguiwheiruthwuiertywuorie $images');
                    }
                  },
                );
              });
        });
  }
}
