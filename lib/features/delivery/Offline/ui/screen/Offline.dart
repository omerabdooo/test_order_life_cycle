import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_order_life_cycle/core/shared_widgets/salem_drawer/drawer_widget.dart';
import 'package:test_order_life_cycle/core/sqldb.dart';
import 'package:test_order_life_cycle/core/styles/Colors.dart';
import 'package:test_order_life_cycle/core/styles/text_style.dart';
import 'package:test_order_life_cycle/core/widgets/a_order.dart';
import 'package:test_order_life_cycle/core/widgets/custom_appbar_widget.dart';
import 'package:test_order_life_cycle/core/widgets/custom_search_widget.dart';
import 'package:test_order_life_cycle/features/delivery/Parcel_Delivery/ui/manger/parcel_delivery_cubit/parcel_delivery_cubit.dart';

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

  Future<void> uploadDataSequentially() async {
    bool allUploadedSuccessfully = true;

    for (var i = 0; i < list.length; i++) {
      try {
        // رفع الصف الحالي إلى السيرفر
        await context.read<ParcelDeliveryCubit>().parcelDelivery(
            list[i]['id'], // تمرير الـ id أو المعرف الخاص بالصف
            list[i]['receiptCode'],
            list[i]['status']);

        // إظهار رسالة نجاح لكل صف يتم رفعه
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('تم رفع الطلب رقم ${list[i]['receiptCode']} بنجاح')));
      } catch (e) {
        allUploadedSuccessfully = false; // التوقف عن الحذف إذا فشل رفع أي صف
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
                'حدث خطأ أثناء رفع الطلب رقم ${list[i]['receiptCode']}: $e')));
      }
    }

    // إذا تم رفع كل العناصر بنجاح، يتم حذفها من قاعدة البيانات المحلية
    if (allUploadedSuccessfully) {
      await sqlDb.deleteData("DELETE FROM delivery");
      list.clear(); // تفريغ القائمة محليًا بعد الحذف من قاعدة البيانات
      setState(() {}); // تحديث الواجهة لإعادة عرض القائمة الفارغة

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content:
              Text('تم رفع جميع الطلبات وحذفها من قاعدة البيانات المحلية')));
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
                  child: Text('القائمة في الانتظار'),
                )
              : Expanded(
                  child: list.isEmpty
                      ? const Center(
                          child: Text("لا يوجد طلبات تم تسليمها"),
                        )
                      : ListView(
                          children: [
                            ListView.builder(
                                itemCount: list.length,
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, i) {
                                  return KOrdersWidget(
                                      OrderNumber: list[i]['receiptCode'],
                                      Backcolor: AppColors.greyLight);
                                }),
                          ],
                        ),
                ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          BlocConsumer<ParcelDeliveryCubit, ParcelDeliveryState>(
            listener: (context, state) {
              if (state is ParcelDeliveryFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.errorMessage.toString())),
                );
              } else if (state is ParcelDeliverySuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.parcelDelivery.toString())),
                );
              }
            },
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: FloatingActionButton(
                  onPressed: () async {
                    if (list.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                              'لا يوجد اي طرود مسلمة للزبون في وضع الاوف لاين'),
                        ),
                      );
                      return;
                    } else {
                      await uploadDataSequentially();
                    }
                  },
                  backgroundColor: Colors.white,
                  child: const Icon(
                    Icons.upload,
                    color: Colors.black,
                  ),
                ),
              );
            },
          ),
          KButtonWidget(),
        ],
      ),
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
