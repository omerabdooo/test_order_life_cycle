import 'package:flutter/material.dart';
import 'package:test_order_life_cycle/core/widgets/custom_primary_button_widget.dart';

class ButtonAddImageBond extends StatelessWidget {
  final String imageBond;
  const ButtonAddImageBond({super.key, required this.imageBond});

  @override
  Widget build(BuildContext context) {
    return KCustomPrimaryButtonWidget(
      buttonName: "صورة السند",
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Image(image: AssetImage(imageBond)),
              );
            });
      },
    );
  }
}
