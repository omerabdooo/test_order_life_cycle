import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:sindbad_store/core/styles/const_color.dart';

class ConstPaddingWidget extends StatelessWidget {
  final Widget child;
  const ConstPaddingWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
          top: 20.h,
          left: 30.w,
          right: 30.w,
        ),
        child: child);
  }
}
