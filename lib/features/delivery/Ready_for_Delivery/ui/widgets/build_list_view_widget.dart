import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_order_life_cycle/core/styles/Colors.dart';
import 'package:test_order_life_cycle/core/widgets/a_order.dart';

/// Generic ListView Builder for view shipping address
Widget buildListView<CubitType extends StateStreamable<StateType>, StateType,
    LoadingStateType, FailureStateType, SuccessStateType, T>({
  required Widget Function(StateType state)? stateBuilder,
  required int Function(StateType state)? itemCount,
}) {
  return Expanded(
    child: BlocBuilder<CubitType, StateType>(
      builder: (context, state) {
        if (state is LoadingStateType) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is FailureStateType) {
          return Center(
            child: Text(
              (state as dynamic).errorMessage,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          );
          // Handle success state
        } else if (state is SuccessStateType) {
          // Assuming SuccessStateType has a property called `customerAddress`
          final deliveries = (state as dynamic).delivery;

          // Check if the address list is empty
          if (deliveries.isEmpty) {
            return const Center(
              child: Text(
                "لم يتم اضافة طلبات جاهزة للاستلام...", // Message for empty list
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            );
          }

          // Display the list if it's not empty
          return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: deliveries.length, // Use the length of the list
            physics: const AlwaysScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final delivery =
                  deliveries[index]; // Access the individual address

              return KOrdersWidget(
                  OrderNumber: delivery.idOrder,
                  Phone: delivery.phoneNumber,
                  Costmor: delivery.name,
                  NumberParcels: delivery.idParcel,
                  TotalNumber: delivery.totalParcels,
                  Backcolor: AppColors.greyLight);
            },
          );
        }

        return stateBuilder?.call(state) ?? const SizedBox.shrink();
      },
    ),
  );
}
