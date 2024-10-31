import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_order_life_cycle/core/styles/Colors.dart';
import 'package:test_order_life_cycle/core/styles/text_style.dart';
import 'package:test_order_life_cycle/core/widgets/DataOrder.dart';
import 'package:test_order_life_cycle/features/delivery/QRCodeScanner.dart';

class KNumberOrderWidget extends StatefulWidget {
  final bool isShow;
  final Function(String)? onScannedData; // Callback for scanned data
  final TextEditingController? orderId;
  final TextEditingController? receiptCode;

  const KNumberOrderWidget({
    super.key,
    required this.isShow,
    this.onScannedData, 
    this.orderId, 
    this.receiptCode,
  });

  @override
  State<KNumberOrderWidget> createState() => _KNumberOrderWidgetState();
}

TextEditingController orderNumberDetails = TextEditingController();

class _KNumberOrderWidgetState extends State<KNumberOrderWidget> {

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
                    "رقم الطلب:",
                    style: KTextStyle.textStyle12
                        .copyWith(color: AppColors.greyHint),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: 40.0.h, right: 20.0.w, left: 80.w),
                  child: Container(
                    width: 165.w,
                    height: 23.h,
                    color: Colors.white,
                    child: TextField(
                      controller: widget.orderId, // Use orderId as controller
                      keyboardType: TextInputType.number,
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
                      "كود التسليم:",
                      style: KTextStyle.textStyle12
                          .copyWith(color: AppColors.greyHint),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: 10.0.h, right: 20.0.w, left: 80.w),
                    child: Container(
                      width: 165.w,
                      height: 23.h,
                      color: Colors.white,
                      child: TextField(
                        controller: widget.receiptCode,
                        keyboardType: TextInputType.number,
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
                      setState(() {
                        orderNumberDetails.text = widget.orderId?.text ?? '';
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
                                widget.orderId?.text = scannedData;
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
          OrderNumber: orderNumberDetails.text,
        ),
      ],
    );
  }
}
