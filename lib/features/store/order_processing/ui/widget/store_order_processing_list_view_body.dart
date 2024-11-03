import 'dart:typed_data';

import 'package:barcode/barcode.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_order_life_cycle/core/styles/Colors.dart';
import 'package:test_order_life_cycle/core/styles/text_style.dart';
import 'package:test_order_life_cycle/features/store/order_processing/ui/widget/custom_text.dart';
import 'package:test_order_life_cycle/features/store/order_processing/ui/widget/image_product.dart';
import 'package:test_order_life_cycle/features/store/order_processing/ui/widget/product_name.dart';

class OrderProcessingBody extends StatelessWidget {
  const OrderProcessingBody({
    super.key,
    required this.orderNum,
    required this.imageCode,
    required this.productName,
    required this.quantity,
    required this.price,
    required this.totalPrice,
    required this.totalQuantity,
    required this.imageProduct,
    this.code,
  });

  final num orderNum;
  final String imageCode;
  final String productName;
  final int quantity;
  final num price;
  final num totalPrice;
  final int totalQuantity;
  final String imageProduct;
  final Barcode? code;

  @override
  Widget build(BuildContext context) {
    final svg = code?.toSvg(productName, width: 200, height: 100);

    return Container(
      padding: EdgeInsets.only(right: 5.w),
      margin: EdgeInsets.symmetric(vertical: 5.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          color: AppColors.primaryColor,
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                offset: const Offset(-1, 1),
                blurRadius: 1.r)
          ]),
      width: 370.w,
      height: 130.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // رقم المنتج
              // Container(
              //     width: 200.w,
              //     alignment: Alignment.center,
              //     child: Text(
              //       '$orderNum',
              //       style: KTextStyle.secondaryTitle,
              //     )),
              SizedBox(
                height: 7.h,
              ),
              //  صورة الباركود
              BarcodeWidget(
                height: 35.h,
                width: 210.w,
                data: orderNum.toString(), // Data here
                barcode: Barcode.code128(), // Specify the barcode type
              ),
              // Image.memory(
              //    Uint8List.fromList(svg.codeUnits),
              //   height: 23.h,
              //   width: 210.w,
              //   fit: BoxFit.fill,
              // ),
              // اسم المنتج
              ProductName(productName: productName),
              SizedBox(
                height: 7.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const CustomText(
                    text: 'الكمية: ',
                  ),
                  CustomText(
                    text: '$quantity',
                  ),
                  SizedBox(
                    width: 50.w,
                  ),
                  const CustomText(
                    text: 'السعر: ',
                  ),
                  Text('$price',
                      style: KTextStyle.secondaryTitle
                          .copyWith(color: AppColors.redColor)),
                ],
              ),
              SizedBox(
                height: 7.h,
              ),
              Row(
                children: [
                  const CustomText(
                    text: 'الاجمالي: ',
                  ),
                  Text('$totalPrice',
                      style: KTextStyle.secondaryTitle
                          .copyWith(color: AppColors.redColor)),
                  SizedBox(
                    width: 50.w,
                  ),
                  CustomText(
                    text: '$totalQuantity',
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 7.h,
          ),
          // صورة المنتج
          ImageProduct(imageProduct: imageProduct),
        ],
      ),
    );
  }
}

// class BarcodeWidget extends StatelessWidget {
//   final String data;
//   final Barcode code;

//   const BarcodeWidget({super.key, required this.data, required this.code});

//   @override
//   Widget build(BuildContext context) {
//     //final svg = code.toSvg(data, width: 200, height: 100);
//     return Container(
//       height: 23.h,
//       width: 210.w,
//       padding: const EdgeInsets.all(20),
//       //child: Center(
//       //child: Image.memory(
//       // Uint8List.fromList(svg.codeUnits),
//       //),
//       //),
//     );
//   }
// }
