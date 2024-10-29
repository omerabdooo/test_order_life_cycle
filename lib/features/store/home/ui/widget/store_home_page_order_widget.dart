import 'package:flutter/material.dart';
import 'package:test_order_life_cycle/core/styles/text_style.dart';
import 'package:test_order_life_cycle/core/widgets/custom_search_widget.dart';
import 'package:test_order_life_cycle/core/widgets/custom_tap_bar_widget.dart';
import 'package:test_order_life_cycle/features/store/home/ui/widget/store_home_page_list_view_before.dart';
import 'package:test_order_life_cycle/features/store/home/ui/widget/store_home_page_list_view_cancel.dart';
import 'package:test_order_life_cycle/features/store/home/ui/widget/store_home_page_list_view_new.dart';
import 'package:test_order_life_cycle/features/store/home/ui/widget/store_home_page_list_view_quick.dart';

class StoreHomePageOrderWidget extends StatelessWidget {
  const StoreHomePageOrderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          KCustomSearchWidget(hintText: "بحث برقم الطلب: "),
          CustomTabBarWidget(tabs: [
            Tab(
              child: Text(
                "جديدة",
                style: KTextStyle.tabs,
              ),
            ),
            Tab(
              child: Text("مستعجلة",
                  style: KTextStyle.tabs.copyWith(fontSize: 15)),
            ),
            Tab(
              child: Text(
                "سابقة",
                style: KTextStyle.tabs,
              ),
            ),
            Tab(
              child: Text(
                "ملغية",
                style: KTextStyle.tabs,
              ),
            ),
          ], tabViews: const [
            //New
            StoreHomePageListViewNew(),
            //Quaick
            StoreHomePageListViewQuick(),
            //Before
            StoreHomePageListViewBefore(),
            //Cancled
            StoreHomePageListViewCancel(),
          ], length: 4),
        ],
      ),
    );
  }
}
