import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:test_order_life_cycle/features/store/home/ui/manger/cubit/all_order_cubit.dart';
import 'package:test_order_life_cycle/features/store/home/ui/manger/cubit/all_order_state.dart';
import 'package:test_order_life_cycle/features/store/home/ui/widget/order_details_button.dart';

class StoreHomePageListViewCancel extends StatelessWidget {
  const StoreHomePageListViewCancel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllOrderCubit, AllOrderState>(
      builder: (context, state) {
        if (state is AllOrderSuccess) {
          return ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: 10,
              itemBuilder: (context, i) {
                return OrderDetailsButton(
                  bondNum: state.orders[i].orderNum,
                  date: state.orders[i].orderDate.toString(),
                  itemNum: state.orders[i].productNum.toString(),
                );
              });
        } else if (state is AllOrderFailuer) {
          return Text(state.errMessage);
        } else {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: 6,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Container(
                    color: Colors.white,
                    height: 130.h,
                    width: MediaQuery.of(context).size.width,
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
