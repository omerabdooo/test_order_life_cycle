import 'package:barcode/barcode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:test_order_life_cycle/features/store/order_processing/ui/manger/order_processing_cubit.dart';
import 'package:test_order_life_cycle/features/store/order_processing/ui/widget/store_order_processing_list_view_body.dart';

class StoreOrderProcessingListView extends StatefulWidget {
  const StoreOrderProcessingListView({
    super.key,
    required this.idOrder,
  });
  final int idOrder;
  @override
  State<StoreOrderProcessingListView> createState() =>
      _StoreOrderProcessingListViewState();
}

class _StoreOrderProcessingListViewState
    extends State<StoreOrderProcessingListView> {
  @override
  void initState() {
    super.initState();
    context.read<OrderProcessingCubit>().fetchOrderProcessing(widget.idOrder);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 370.w,
      height: 400.h,
      child: BlocBuilder<OrderProcessingCubit, OrderProcessingState>(
          builder: (context, state) {
        if (state is OrderProcessingSuccess) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: 5,
            itemBuilder: (context, i) {
              return OrderProcessingBody(
                  orderNum: state.orders[i].orderDetailsId,
                  imageCode: state.orders[i].productImage,
                  productName: state.orders[i].nameProduct,
                  quantity: state.orders[i].quantites,
                  price: state.orders[i].priceProduct,
                  totalPrice: state.orders[i].priceProduct,
                  totalQuantity: state.orders[i].quantites,
                  imageProduct: state.orders[i].productImage);
            },
          );
        } else if (state is OrderProcessingFailuer) {
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
      }),
    );
  }
}
