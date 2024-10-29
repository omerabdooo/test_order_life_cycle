import 'package:flutter/material.dart';
import 'package:test_order_life_cycle/core/shared_widgets/q_secondary_text_form_widget.dart';

class SearchConfirmPayment extends StatelessWidget {
  const SearchConfirmPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          /////////////////////////////////////////////////
          ///
          ///
          ///
          SecondaryTextFormWidget(texthint: "بحث برقم السند"),
          SecondaryTextFormWidget(
            texthint: "بحث برقم الجوال",
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SecondaryTextFormWidget(
            texthint: "بحث بالبنك",
          ),
          SecondaryTextFormWidget(
            texthint: "بحث برقم الطلب",
          ),
          ///////////////////////////////////////////////////
          ///
          ///
          ///
        ],
      )
    ]);
  }
}
