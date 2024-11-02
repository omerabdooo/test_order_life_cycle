import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_order_life_cycle/core/styles/Colors.dart';
import 'package:test_order_life_cycle/core/styles/text_style.dart';
import 'package:test_order_life_cycle/core/widgets/DataOrder.dart';
import 'package:test_order_life_cycle/features/delivery/QRCodeScanner.dart';
import 'package:test_order_life_cycle/features/delivery/Receive_Parcels/ui/manger/order_information_cubit/order_information_cubit.dart';

class KNumberOrderWidget extends StatefulWidget {
  final bool isShow;
  final Function(String)? onScannedData; // Callback for scanned data
  final TextEditingController? parcelId;
  final TextEditingController? orderId;

  const KNumberOrderWidget({
    super.key,
    required this.isShow,
    this.onScannedData,
    this.parcelId,
    this.orderId,
  });

  @override
  State<KNumberOrderWidget> createState() => _KNumberOrderWidgetState();
}

TextEditingController orderNumber = TextEditingController();
TextEditingController phoneNumber = TextEditingController();
TextEditingController costmorName = TextEditingController();
TextEditingController parcelId = TextEditingController();
TextEditingController totalParcels = TextEditingController();


class _KNumberOrderWidgetState extends State<KNumberOrderWidget> {
      @override
  void initState() {
    context.read<OrderInformationCubit>().getOrderInformation(763);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 38.0.h, right: 50.w),
                  child: Text(
                    "رقم الطرد:",
                    style: KTextStyle.textStyle12
                        .copyWith(color: AppColors.greyHint),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: 40.0.h, right: 20.0.w, left: 80.w),
                    child: Container(
                      width: 165.w,
                      height: 23.h,
                      color: Colors.white,
                      child: TextField(
                        controller: widget.parcelId, // Use parcelId as controller
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            if (!widget.isShow)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 7.0.h, right: 45.w),
                    child: Text(
                      "رقم الطلب:",
                      style: KTextStyle.textStyle12
                          .copyWith(color: AppColors.greyHint),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: 10.0.h, right: 20.0.w, left: 80.w),
                      child: Container(
                        width: 165.w,
                        height: 23.h,
                        color: Colors.white,
                        child: TextField(
                          controller: widget.orderId,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
        SizedBox(height: 5.h),
        Padding(
          padding: EdgeInsets.all(8.0.h.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 18.0.w),
                child: Container(
                  height: 38.h,
                  width: 124.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: AppColors.greenDark),
                  ),
                  child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Text(
                        "استلام",
                        style: KTextStyle.tabs.copyWith(color: AppColors.black),
                      ),
                      onPressed: () {
                        context.read<OrderInformationCubit>().getOrderInformation(widget.parcelId?.text ?? '');

                        context.read<OrderInformationCubit>().stream.listen((state) {
                          if (state is OrderInformationSuccess) {
                            setState(() {
                              orderNumber.text = state.orderInformation.orderId;
                              phoneNumber.text = "775445127";
                              costmorName.text = state.orderInformation.name;
                              parcelId.text = state.orderInformation.parcelId.toString as String;
                              totalParcels.text = state.orderInformation.totalParcels.toString();
                            });
                          } else if (state is OrderInformationFailure) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(state.errorMessage)),
                            );
                          }
                        });
                      },
                    ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 50.0.w),
                child: Container(
                  height: 38.h,
                  width: 124.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: AppColors.greenDark),
                  ),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text(
                      "قراءة باركود",
                      style: KTextStyle.tabs.copyWith(color: AppColors.black),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QRCodeScanner(
                            onScanned: (scannedData) {
                              setState(() {
                                widget.parcelId?.text = scannedData;
                              });
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        KDataOrderWidget(
          OrderNumber: orderNumber.text,
          Phone: phoneNumber.text,
          Costmor: costmorName.text,
          NumberParcels: parcelId.text,
          TotalNumber: totalParcels.text,
        ),
      ],
    );
  }
}
