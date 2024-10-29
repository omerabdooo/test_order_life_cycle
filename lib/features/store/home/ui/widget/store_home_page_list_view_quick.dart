import 'package:flutter/material.dart';
import 'package:test_order_life_cycle/features/store/home/ui/widget/order_details_button.dart';

class StoreHomePageListViewQuick extends StatelessWidget {
  const StoreHomePageListViewQuick({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 10,
        itemBuilder: (context, i) {
          return const OrderDetailsButton(
            bondNum: '654654',
            date: '2024/10/2',
            itemNum: '1',
          );
        });
  }
}
