import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_order_life_cycle/core/widgets/NumberOrder.dart';
import 'package:test_order_life_cycle/core/widgets/custom_appbar_widget.dart';
import 'package:test_order_life_cycle/core/widgets/custom_primary_button_widget.dart';
import 'package:test_order_life_cycle/features/delivery/Receive_Parcels/ui/manger/receive_parcels_cubit/receive_parcels_cubit.dart';
// import 'package:sndbad/features/home_screen/ui/screen/HomeScreen.dart'; // Import the flutter_screenutil package//+

class ReceiveParcelsBody extends StatefulWidget {
  const ReceiveParcelsBody({super.key});

  @override
  State<ReceiveParcelsBody> createState() => _MyWidgetState();
}

TextEditingController parcelId = TextEditingController();
int status = 5;

class _MyWidgetState extends State<ReceiveParcelsBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: [
          const KCustomAppBarWidget(
            nameAppbar: "استلام طرود",
          ),
          KNumberOrderWidget(
            isShow: true,
            parcelId: parcelId,
          ),
          SizedBox(
            height: 10.h,
          ),
          SizedBox(
            height: 50.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              BlocConsumer<ReceiveParcelsCubit, ReceiveParcelsState>(
                listener: (context, state) {
                  if (state is ReceiveParcelsFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.errorMessage.toString())),
                    );
                  } else if (state is ReceiveParcelsSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.receiveParcels.toString())),
                    );
                  }
                },
                builder: (context, state) {
                  return KCustomPrimaryButtonWidget(
                    width: 170,
                    height: 48,
                    buttonName: "تأكيـــد",
                    onPressed: () async {
                      if (parcelId.text == "") {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('من فضلك قم بقراءة الباركود اولا...'),
                          ),
                        );
                        return;
                      } else {
                        // Call the function after all checks have passed
                        await context
                            .read<ReceiveParcelsCubit>()
                            .receiveParcels(int.parse(parcelId.text), status);
                        print(parcelId.text);
                      }
                    },
                  );
                },
              ),
              SizedBox(width: 20.h), // Space between buttons
              KCustomPrimaryButtonWidget(
                  width: 85,
                  height: 48,
                  buttonName: "إغلاق",
                  onPressed: () {
                    // OrderNumber.clear();
                    // GoRouter.of(context).pushReplacement(
                    //     AppRouter.deliveryRouters.kDeliverHomePage);
                  }),
              SizedBox(width: 15.h), // Space between buttons
            ],
          ),
        ]),
      );
  }
}
