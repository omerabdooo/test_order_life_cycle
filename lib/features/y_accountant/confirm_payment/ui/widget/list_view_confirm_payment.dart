import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_order_life_cycle/core/styles/Colors.dart';
import 'package:test_order_life_cycle/core/styles/text_style.dart';
import 'package:test_order_life_cycle/core/widgets/custom_primary_button_widget.dart';
import 'package:test_order_life_cycle/features/y_accountant/confirm_payment/ui/widget/button_add_image_bond.dart';

class ListViewConfirmPayment extends StatelessWidget {
  final String idBond;
  final String bankName;
  final String customerName;
  final String numBond;
  final String amountBond;
  final String date;
  const ListViewConfirmPayment(
      {super.key,
      required this.idBond,
      required this.bankName,
      required this.customerName,
      required this.amountBond,
      required this.numBond,
      required this.date});

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
                  idBond,
                  style: KTextStyle.secondaryTitle,
                ),
                const ButtonAddImageBond(imageBond: "assets/1.png")
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
                  "بنك:   ",
                  style: KTextStyle.secondaryTitle
                      .copyWith(color: AppColors.greyHint),
                ),
                Text(
                  bankName,
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
                  "العميل:   ",
                  style: KTextStyle.secondaryTitle
                      .copyWith(color: AppColors.greyHint),
                ),
                Text(
                  customerName,
                  style: KTextStyle.secondaryTitle
                      .copyWith(fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Text(
                "رقم السند:  ",
                style: KTextStyle.secondaryTitle
                    .copyWith(color: AppColors.greyHint),
              ),
              Text(
                numBond,
                style: KTextStyle.secondaryTitle
                    .copyWith(fontWeight: FontWeight.w400),
              ),
              SizedBox(
                width: 30.w,
              ),
              Text(
                "قيمة السند:  ",
                style: KTextStyle.secondaryTitle
                    .copyWith(color: AppColors.greyHint),
              ),
              Text(
                amountBond,
                style: KTextStyle.secondaryTitle
                    .copyWith(fontWeight: FontWeight.w400),
              ),
            ],
          ),
          Row(
            children: [
              Row(
                children: [
                  Text(
                    "التاريخ: ",
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
                  KCustomPrimaryButtonWidget(
                      buttonName: " تاكيد", onPressed: () {}),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
