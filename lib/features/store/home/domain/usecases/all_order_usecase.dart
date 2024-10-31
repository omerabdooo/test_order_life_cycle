import 'package:dartz/dartz.dart';
import 'package:test_order_life_cycle/core/errors/failure.dart';
import 'package:test_order_life_cycle/core/use_cases/param_use_case.dart';
import 'package:test_order_life_cycle/features/store/home/domain/repos/all_order_repo.dart';

import '../entities/all_order_entity.dart';

class AllOrderUsecase
    extends UseCaseWithParam<List<AllOrderEntity>, AllOrderParam> {
  final AllOrderRepo allOrderRepo;

  AllOrderUsecase(this.allOrderRepo);

  @override
  Future<Either<Failure, List<AllOrderEntity>>> execute(
      AllOrderParam params) async {
    return await allOrderRepo.fetchAllOrder(
        isUrgen: params.isUrgen,
        pageNumber: params.pageNumber,
        pageSize: params.pageSize,
        storeId: params.storeId,
        srearchKeyword: params.srearchKeyword);
  }
}

class AllOrderParam {
  final bool isUrgen;
  final String storeId;
  final int srearchKeyword;
  final int pageNumber;
  final int pageSize;
  AllOrderParam(this.pageNumber, this.pageSize, this.storeId,
      this.srearchKeyword, this.isUrgen);
}
