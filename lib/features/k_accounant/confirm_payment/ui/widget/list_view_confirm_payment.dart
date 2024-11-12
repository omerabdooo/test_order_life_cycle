import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_order_life_cycle/core/styles/Colors.dart';
import 'package:test_order_life_cycle/core/styles/text_style.dart';
import 'package:test_order_life_cycle/core/widgets/custom_primary_button_widget.dart';
import 'package:test_order_life_cycle/features/y_accountant/confirm_payment/ui/widget/button_add_image_bond.dart';

class KSAListViewConfirmPayment extends StatelessWidget {
  final num billNum;
  final String storeName;
  final String mandobName;
  final String orderNum;
  final double amountOrderItems;
  final double amountBill;
  final double different;
  final String date;
  final GestureTapCallback confrmOnPressed;
  final GestureTapCallback transOnPressed;
  final String imageBond;
  const KSAListViewConfirmPayment({
    super.key,
    required this.billNum,
    required this.storeName,
    required this.mandobName,
    required this.amountOrderItems,
    required this.orderNum,
    required this.date,
    required this.amountBill,
    required this.different,
    required this.confrmOnPressed,
    required this.transOnPressed,
    required this.imageBond,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330.w,
      height: 200.h,
      margin: EdgeInsets.symmetric(vertical: 5.h),
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.greyHint, width: 2.w)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            height: 19.h,
            width: 295.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "رقم الفاتورة",
                  style: KTextStyle.secondaryTitle,
                ),
                Text(
                  "$billNum",
                  style: KTextStyle.secondaryTitle,
                ),
                ButtonAddImageBond(imageBond: imageBond),
              ],
            ),
          ),
          Container(
            width: 380.w,
            height: 25.w,
            color: AppColors.greyLight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "المحل:   ",
                  style: KTextStyle.secondaryTitle
                      .copyWith(color: AppColors.greyHint),
                ),
                Text(
                  storeName,
                  style: KTextStyle.secondaryTitle
                      .copyWith(fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Container(
            width: 380.w,
            height: 25.w,
            color: AppColors.greyLight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "المندوب:   ",
                  style: KTextStyle.secondaryTitle
                      .copyWith(color: AppColors.greyHint),
                ),
                Text(
                  mandobName,
                  style: KTextStyle.secondaryTitle
                      .copyWith(fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Text(
                "رقم الطلب:  ",
                style:
                    KTextStyle.textStyle12.copyWith(color: AppColors.greyHint),
              ),
              Text(
                orderNum,
                style: KTextStyle.secondaryTitle
                    .copyWith(fontWeight: FontWeight.w400),
              ),
              SizedBox(
                width: 30.w,
              ),
              Text(
                "قيمة اصناف الطلب:  ",
                style:
                    KTextStyle.textStyle12.copyWith(color: AppColors.greyHint),
              ),
              Text(
                "$amountOrderItems",
                style: KTextStyle.secondaryTitle
                    .copyWith(fontWeight: FontWeight.w400),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "قيمة الفاتورة: ",
                style:
                    KTextStyle.textStyle12.copyWith(color: AppColors.greyHint),
              ),
              Text(
                "$amountBill",
                style: KTextStyle.secondaryTitle
                    .copyWith(fontWeight: FontWeight.w400),
              ),
              SizedBox(
                width: 30.w,
              ),
              Text(
                " الفرق:  ",
                style:
                    KTextStyle.textStyle12.copyWith(color: AppColors.greyHint),
              ),
              Text(
                "$different",
                style: KTextStyle.secondaryTitle
                    .copyWith(fontWeight: FontWeight.w400),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                " التاريخ:  ",
                style: KTextStyle.secondaryTitle
                    .copyWith(color: AppColors.greyHint),
              ),
              Text(
                date,
                style: KTextStyle.secondaryTitle
                    .copyWith(fontWeight: FontWeight.w400),
              ),
              SizedBox(
                width: 70.w,
              ),
              // KCustomPrimaryButtonWidget(
              //     buttonName: " تاكيد", onPressed: confrmOnPressed),
              // KCustomPrimaryButtonWidget(
              //     buttonName: " تحويل", onPressed: transOnPressed),
            ],
          ),
          Row(
            children: [
              // Text(
              //   " التاريخ:  ",
              //   style: KTextStyle.secondaryTitle
              //       .copyWith(color: AppColors.greyHint),
              // ),
              // Text(
              //   date,
              //   style: KTextStyle.secondaryTitle
              //       .copyWith(fontWeight: FontWeight.w400),
              // ),
              // SizedBox(
              //   width: 70.w,
              // ),
              KCustomPrimaryButtonWidget(
                  buttonName: " تاكيد", onPressed: confrmOnPressed),
              KCustomPrimaryButtonWidget(
                  buttonName: " تحويل", onPressed: transOnPressed),
            ],
          ),
        ],
      ),
    );
  }
}
