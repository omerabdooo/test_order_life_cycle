import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:test_order_life_cycle/features/store/home/ui/manger/cubit/all_order_cubit.dart';
import 'package:test_order_life_cycle/features/store/home/ui/manger/cubit/all_order_state.dart';
import 'package:test_order_life_cycle/features/store/home/ui/widget/order_details_button.dart';

class StoreHomePageListViewNew extends StatefulWidget {
  const StoreHomePageListViewNew({
    super.key,
  });

  @override
  State<StoreHomePageListViewNew> createState() =>
      _StoreHomePageListViewNewState();
}

class _StoreHomePageListViewNewState extends State<StoreHomePageListViewNew> {
  @override
  void initState() {
    super.initState();
    context.read<AllOrderCubit>().fetchAllOrder(1, 10, '10', 1, false);
  }

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
                  idOrder: state.orders[i].idOrder,
                  bondNum: state.orders[i].orderNum,
                  date: state.orders[i].orderDate.toString(),
                  itemNum: state.orders[i].productNum.toString(),
                );
              });
        } else if (state is AllOrderFailuer) {
          return Text(state.errMessage);
        } else if (state is AllOrderLoading) {
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
        } else {
          return Container(
            color: Colors.red.shade400,
            height: 50,
            width: 300,
            child: Divider(),
          );
        }
      },
    );
  }
}
