import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_order_life_cycle/core/shared_widgets/salem_drawer/drawer_widget.dart';
import 'package:test_order_life_cycle/core/styles/Colors.dart';
import 'package:test_order_life_cycle/core/styles/text_style.dart';
import 'package:test_order_life_cycle/core/widgets/a_order.dart';
import 'package:test_order_life_cycle/core/widgets/custom_appbar_widget.dart';
import 'package:test_order_life_cycle/core/widgets/custom_search_widget.dart';
import 'package:test_order_life_cycle/features/delivery/Ready_for_Delivery/domain/entities/ready_for_delivery_entity.dart';
import 'package:test_order_life_cycle/features/delivery/Ready_for_Delivery/ui/manger/ready_for_delivery_cubit/ready_for_delivery_cubit.dart';
import 'package:test_order_life_cycle/features/delivery/Ready_for_Delivery/ui/screen/Ready_for_Delivery.dart';
import 'package:test_order_life_cycle/features/delivery/Ready_for_Delivery/ui/widgets/build_list_view_widget.dart';

class ReadyForDeliveryBody extends StatefulWidget {
  const ReadyForDeliveryBody({super.key});

  @override
  State<ReadyForDeliveryBody> createState() => _ReadyForDeliveryBodyState();
}

class _ReadyForDeliveryBodyState extends State<ReadyForDeliveryBody> {
  @override
  void initState() {
    context.read<ReadyForDeliveryCubit>().getAllReadyForDelivery();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        KCustomAppBarWidget(
          nameAppbar: "الطرود الجاهزة للاستلام",
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
        Expanded(
          child: buildListView<
              ReadyForDeliveryCubit,
              ReadyForDeliveryState,
              ReadyForDeliveryLoading,
              ReadyForDeliveryFailure,
              ReadyForDeliverySuccess,
              ReadyForDeliveryEntity>(
            itemCount: (state) {
              if (state is ReadyForDeliverySuccess) {
                return state.delivery
                    .length; // Extract the length from the success state
              }
              return 0; // Return an empty length if not in success state
            },
            //state.customerAddress.length
            stateBuilder: (state) {
              return const SizedBox.shrink();
            },
          ),
        ),
      ],
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
