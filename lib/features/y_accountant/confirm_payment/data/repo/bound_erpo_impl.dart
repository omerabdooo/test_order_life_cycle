// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:test_order_life_cycle/core/errors/failure.dart';
import 'package:test_order_life_cycle/features/y_accountant/confirm_payment/data/data_source/remote/bound_remote_data_source.dart';
import 'package:test_order_life_cycle/features/y_accountant/confirm_payment/domin/entitnies/bound_entitny.dart';
import 'package:test_order_life_cycle/features/y_accountant/confirm_payment/domin/entitnies/update_bound_state_entinty.dart';
import 'package:test_order_life_cycle/features/y_accountant/confirm_payment/domin/repo/y_accontant_repo.dart';

class YAccontantRepoimple extends YAccontantRepo {
  BoundRemoteDataSource boundRemoteDataSource;
  YAccontantRepoimple({
    required this.boundRemoteDataSource,
  });
  Future<Either<Failure, List<T>>> fetchData<T>(
      Future<List<T>> Function() fetchFunction) async {
    try {
      var data = await fetchFunction();
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
  Future<Either<Failure, T>> addData<T>(
      Future<T> Function() addFunction) async {
    try {
      var dataAdded = await addFunction();
      return right(dataAdded);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
  @override
  Future<Either<Failure, List<BoundEntitny>>> getBound() async{
   return fetchData(()=>boundRemoteDataSource.getBound());
  }

  @override
  Future<Either<Failure, UpdateBoundStateEntinty>> updateBoundState(int boundId, String action) {
    return addData(()=>boundRemoteDataSource.updateBoundState(boundId, action));
  }


}