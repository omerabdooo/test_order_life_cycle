import 'package:dartz/dartz.dart';
import 'package:test_order_life_cycle/core/errors/failure.dart';
import 'package:test_order_life_cycle/core/use_cases/param_use_case.dart';
import 'package:test_order_life_cycle/features/store/order_processing/domain/entities/order_processing_bill_entity.dart';
import 'package:test_order_life_cycle/features/store/order_processing/domain/entities/order_processing_entity.dart';
import 'package:test_order_life_cycle/features/store/order_processing/domain/repos/order_processing_repo.dart';

class OrderProcessingUsecase extends UseCaseWithParam<
    List<OrderProcessingEntity>, OrderProcessingParam> {
  final OrderProcessingRepo orderProcessingRepo;

  OrderProcessingUsecase(this.orderProcessingRepo);

  @override
  Future<Either<Failure, List<OrderProcessingEntity>>> execute(
      OrderProcessingParam params) async {
    return await orderProcessingRepo.fetchOrderProcessing(
        orderId: params.orderId,
        orderNum: params.orderNum,
        orderDate: params.orderDate,
        productNum: params.productNum);
  }
}

class OrderProcessingParam {
  final int orderId;
  final String orderNum;
  final String orderDate;
  final String productNum;

  OrderProcessingParam(
      this.orderId, this.orderNum, this.orderDate, this.productNum);
}
