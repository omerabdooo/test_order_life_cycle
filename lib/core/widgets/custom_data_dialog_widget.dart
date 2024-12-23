import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_order_life_cycle/core/functions/image_picker_function.dart';
import 'package:test_order_life_cycle/core/styles/Colors.dart';
import 'package:test_order_life_cycle/core/styles/text_style.dart';
import 'package:test_order_life_cycle/core/widgets/custom_primary_button_widget.dart';

TextEditingController dateConroller = TextEditingController();
TextEditingController numberConroller = TextEditingController();
TextEditingController mountConroller = TextEditingController();

class CustomDataDialogWidget extends StatelessWidget {
  final String? headTitle;
  final String firstTitle;
  final String secondTitle;
  final String thierdTitle;
  final GestureTapCallback onPressedSure;
  CustomDataDialogWidget({
    super.key,
    this.headTitle,
    required this.firstTitle,
    required this.secondTitle,
    required this.thierdTitle,
    required this.onPressedSure,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: _buildDialogTitle(context),
      content: _buildDialogContent(),
    );
  }

  Widget _buildDialogTitle(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.cancel),
        ),
        // const StoreTextTitleDialogWidget(textDialog: "بيانات الفاتورة"),
        Text(
          'بيانات الفاتورة',
          style: KTextStyle.secondaryTitle.copyWith(color: AppColors.black),
          // TextStyle(
          //   color:Colors.grey,fontSize: 14.sp, fontWeight: FontWeight.w700
          // ),
        ),
      ],
    );
  }

  Widget _buildDialogContent() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      width: double.infinity,
      height: 350.h,
      color: AppColors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildInfoRow(firstTitle, dateConroller),
            _buildInfoRow(secondTitle, numberConroller),
            _buildInfoRow(thierdTitle, mountConroller),
            _buildImageSection(),
            KCustomPrimaryButtonWidget(
                buttonName: "تاكيد", onPressed: onPressedSure)
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String title, TextEditingController info) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // StoreTextTitleDialogWidget(textDialog: "$title  "),
          Text(
            title,
            style:
                KTextStyle.secondaryTitle.copyWith(color: AppColors.greyHint),
          ),
          const Spacer(),
          SizedBox(
            width: 140.w,
            child: TextField(
              // controller: TextEditingController(text: info),
              controller: info,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.backgroundColor,
                    width: 2.w,
                  ),
                ),
              ),
              style: KTextStyle.secondaryTitle.copyWith(color: AppColors.black),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageSection() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
          child:
              // const StoreTextTitleDialogWidget(textDialog: "صورة الفاتورة"),
              Text(
            "صورة الفاتورة",
            style: KTextStyle.secondaryTitle.copyWith(color: AppColors.black),
          ),
          // TextStyle(color:Colors.black,fontSize: 14.sp, fontWeight: FontWeight.w700),)
        ),
        const KImagePickerFunction(),
      ],
    );
  }
}
