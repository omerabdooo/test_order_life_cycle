import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_order_life_cycle/features/store/order_processing/domain/entities/order_processing_entity.dart';
import 'package:test_order_life_cycle/features/store/order_processing/domain/usecases/order_processing_usecase.dart';

part 'order_processing_state.dart';

class OrderProcessingCubit extends Cubit<OrderProcessingState> {
  OrderProcessingCubit(this.orderProcessingUsecase)
      : super(OrderProcessingInitial());
  final OrderProcessingUsecase orderProcessingUsecase;

  Future<void> fetchOrderProcessing(
      int orderId, String orderNum, String orderDate, String productNum) async {
    emit(
      OrderProcessingLoading(),
    );
    var result = await orderProcessingUsecase.execute(
        OrderProcessingParam(orderId, orderNum, orderDate, productNum));

    result.fold((failuer) {
      emit(
        OrderProcessingFailuer(errMessage: failuer.message),
      );
    }, (orders) {
      emit(
        OrderProcessingSuccess(orders: orders),
      );
    });
  }
}
