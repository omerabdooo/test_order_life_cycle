import 'package:flutter/material.dart';
import 'package:test_order_life_cycle/core/styles/text_style.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: KTextStyle.secondaryTitle,
    );
  }
}
