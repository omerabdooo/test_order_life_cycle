import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_order_life_cycle/core/sqldb.dart';
import 'package:test_order_life_cycle/core/widgets/NumberOrder.dart';
import 'package:test_order_life_cycle/core/widgets/custom_appbar_widget.dart';
import 'package:test_order_life_cycle/core/widgets/custom_primary_button_widget.dart';
import 'package:test_order_life_cycle/features/delivery/Parcel_Delivery/ui/manger/parcel_delivery_cubit/parcel_delivery_cubit.dart';
// import 'package:sndbad/features/home_screen/ui/screen/HomeScreen.dart'; // Import the flutter_screenutil package//+

class ParcelDeliveryBody extends StatefulWidget {
  const ParcelDeliveryBody({super.key});

  @override
  State<ParcelDeliveryBody> createState() => _MyWidgetState();
}

SqlDb sqlDb = SqlDb();
TextEditingController orderId = TextEditingController();
TextEditingController receiptCode = TextEditingController();
int status = 3;

class _MyWidgetState extends State<ParcelDeliveryBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const KCustomAppBarWidget(
            nameAppbar: "تسليم طرود",
          ),
          KNumberOrderWidget(
              isShow: false, receiptCode: receiptCode, orderId: orderId),
          SizedBox(
            height: 10.h,
          ),
          SizedBox(
            height: 50.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              KCustomPrimaryButtonWidget(
                width: 170,
                height: 48,
                buttonName: "تأكيـــد",
                onPressed: () async {
                  if (receiptCode.text == "") {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('من فضلك قم اكتب كود الاستلام اولا...'),
                      ),
                    );
                    return;
                  } else {
                    // Call the function after all checks have passed
                    // await context
                    //     .read<ParcelDeliveryCubit>()
                    //     .parcelDelivery(
                    //         int.parse(orderId.text),
                    //         receiptCode.text,
                    //         status,
                    //         );
                    print(orderId.text);
                    print(receiptCode.text);
                  }
                  int response = await sqlDb.insertData('''
                                        INSERT INTO delivery (receiptCode , status)
                                        VALUES ("${receiptCode.text}" , 3)
                                        ''');
                  if (response > 0) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("offline")),
                    );
                  }
                },
              ),
              SizedBox(width: 20.h), // Space between buttons
              KCustomPrimaryButtonWidget(
                  width: 85,
                  height: 48,
                  buttonName: "إغلاق",
                  onPressed: () {
                    // OrderNumber.clear();
                    // OrderNumber1.clear();
                    // GoRouter.of(context).pushReplacement(
                    //     AppRouter.deliveryRouters.kDeliverHomePage);
                  }),
              SizedBox(width: 15.h), // Space between buttons
            ],
          ),
        ],
      ),
    );
  }
}
