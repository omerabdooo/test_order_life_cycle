import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KDrawerTileWidget extends StatelessWidget {
  final String title;
  final Widget leading;
  final void Function()? ontap;

  const KDrawerTileWidget(
      {super.key,
      required this.title,
      required this.leading,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25.0.w),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(color: Colors.black),
        ),
        leading: leading,
        onTap: ontap,
      ),
    );
  }
}
