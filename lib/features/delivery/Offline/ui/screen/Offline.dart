import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_order_life_cycle/core/shared_widgets/salem_drawer/drawer_widget.dart';
import 'package:test_order_life_cycle/core/sqldb.dart';
import 'package:test_order_life_cycle/core/styles/Colors.dart';
import 'package:test_order_life_cycle/core/styles/text_style.dart';
import 'package:test_order_life_cycle/core/widgets/a_order.dart';
import 'package:test_order_life_cycle/core/widgets/custom_appbar_widget.dart';
import 'package:test_order_life_cycle/core/widgets/custom_search_widget.dart';

class Offline extends StatefulWidget {
  const Offline({super.key});

  @override
  State<Offline> createState() => _OfflineState();
}

class _OfflineState extends State<Offline> {
  SqlDb sqlDb = SqlDb();
  bool isLoading = true;
  List list = [];
  @override
  void initState() {
    super.initState();
    readData();
  }

  Future readData() async {
    List<Map> response = await sqlDb.readData("SELECT * FROM delivery");
    list.addAll(response);
    isLoading = false;
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const KDrawerWidget(),
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const KCustomAppBarWidget(
            nameAppbar: "الطرود التي تم تسليمها",
          ),
          SizedBox(
            height: 2.h,
          ),
          KCustomSearchWidget(
            height: 23,
            width: 338,
            hintText: "رقم الطلب:",
          ),
          KCustomSearchWidget(
            height: 23,
            width: 338,
            hintText: "رقم تلفون:",
          ),
          isLoading == true
            ? const Center(
                child: Text('loading list'),
              )
            : Expanded(
            child: list.isEmpty
            ? const Center(
                child: Text("empty_list"),
              )
            : ListView(
              children: [
                ListView.builder(
                    itemCount: list.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, i) {
                      return KOrdersWidget(
                          receiptCode: list[i]['receiptCode'],
                          OrderNumber: list[i]['orderId'],
                          Phone: "735961434",
                          Costmor: "Khaild ",
                          NumberParcels: "1",
                          TotalNumber: "1",
                          Backcolor: AppColors.greyLight);
                    }),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: KButtonWidget(),
    );
  }
}

class KButtonWidget extends StatelessWidget {
  // const card({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.h),
      child: Container(
        width: 85.w,
        height: 48.h,
        decoration: BoxDecoration(
          // color: Color.fromRGBO(226, 126, 126, 1),
          borderRadius: BorderRadius.circular(200.r),
          // border: Border.all()),
        ),
        child: FloatingActionButton(
            backgroundColor: Color.fromRGBO(226, 126, 126, 1),
            child: Text(
              "إغلاق",
              style: KTextStyle.tabs.copyWith(color: AppColors.white),
            ),
            onPressed: () {
              // GoRouter.of(context)
              //     .pushReplacement(AppRouter.deliveryRouters.kDeliverHomePage);
            }),
      ),
    );
  }
}
