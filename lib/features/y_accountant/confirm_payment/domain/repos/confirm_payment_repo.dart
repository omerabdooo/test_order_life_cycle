import 'package:dartz/dartz.dart';
import 'package:test_order_life_cycle/core/errors/failure.dart';
import 'package:test_order_life_cycle/features/y_accountant/confirm_payment/domain/entities/confirm_payment_entity.dart';

abstract class ConfirmPaymentRepo {
  Future<Either<Failure, List<ConfirmPaymentEntity>>> fetchMyOrder(
      {required int pageNumber, required int pageSize});
}
