import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:test_order_life_cycle/features/store/home/ui/widget/order_details_button.dart';
import 'package:test_order_life_cycle/features/store/order_processing/ui/manger/order_processing_cubit.dart';
import 'package:test_order_life_cycle/features/store/order_processing/ui/widget/store_order_processing_container_body.dart';

class StoreOrderProcessingContainer extends StatefulWidget {
  const StoreOrderProcessingContainer({
    super.key,
    required this.idOrder,
    required this.orderNum,
    required this.orderDate,
    required this.productNum,
  });
  final int idOrder;
  final String orderNum;
  final String orderDate;
  final String productNum;

  @override
  State<StoreOrderProcessingContainer> createState() =>
      _StoreOrderProcessingContainerState();
}

class _StoreOrderProcessingContainerState
    extends State<StoreOrderProcessingContainer> {
  @override
  void initState() {
    super.initState();
    context.read<OrderProcessingCubit>().fetchOrderProcessing(
        widget.idOrder, widget.orderNum, widget.orderDate, widget.productNum);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderProcessingCubit, OrderProcessingState>(
      builder: (context, state) {
        if (state is OrderProcessingSuccess) {
          return StoreOrderProcessingContainerBody(
            numberOrder: orderNum!,
            date: orderDate!,
            numberItem: productNum!,
          );
        } else if (state is OrderProcessingLoading) {
          return Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: ListTile(
                title: Container(
                  color: Colors.white,
                  height: 100.h,
                  width: MediaQuery.of(context).size.width,
                ),
              ));
        } else {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: ListTile(
              title: Container(
                color: Colors.white,
                height: 100.h,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          );
        }
      },
    );
  }
}
        // if (state is OrderProcessingLoading) {
        //   return const CircularProgressIndicator();
        // } else if (state is OrderProcessingFailuer) {
        //   Text(state.errMessage);
        // } else {
        //   return ListTile(
        //     title: Container(
        //       color: Colors.white,
        //       height: 130.h,
        //       width: MediaQuery.of(context).size.width,
        //     ),
        //   );
        // }
      
    
  

