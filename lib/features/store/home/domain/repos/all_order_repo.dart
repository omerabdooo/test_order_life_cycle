import 'package:dartz/dartz.dart';
import 'package:test_order_life_cycle/core/errors/failure.dart';
import 'package:test_order_life_cycle/features/store/home/domain/entities/all_order_entity.dart';

abstract class AllOrderRepo {
  Future<Either<Failure, List<AllOrderEntity>>> fetchAllOrder(
      {required int pageNumber,
      required int pageSize,
      required String storeId,
      required int srearchKeyword});
}
