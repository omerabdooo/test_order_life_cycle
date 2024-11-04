import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:test_order_life_cycle/core/errors/failure.dart';
import 'package:test_order_life_cycle/features/store/order_processing/data/data_sources/order_processing_remote_data_source.dart';
import 'package:test_order_life_cycle/features/store/order_processing/domain/entities/order_processing_bill_entity.dart';
import 'package:test_order_life_cycle/features/store/order_processing/domain/entities/order_processing_entity.dart';
import 'package:test_order_life_cycle/features/store/order_processing/domain/repos/order_processing_repo.dart';

class OrderProcessingRepoImpl extends OrderProcessingRepo {
  final OrderProcessingRemoteDataSource orderProcessingRemoteDataSource;

  OrderProcessingRepoImpl(this.orderProcessingRemoteDataSource);

  // basic fetch list Entity function
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

  ///////////////////////////////////
  ///Create Bill

  @override
  Future<Either<Failure, List<OrderProcessingEntity>>> fetchOrderProcessing(
      {required int orderId}) {
    return fetchData(
        () => orderProcessingRemoteDataSource.fetchOrderProcessing(orderId));
  }

  Future<Either<Failure, T>> fetchDataBill<T>(
      Future<T> Function() postDataFunction) async {
    try {
      var dataPosted = await postDataFunction();
      return right(dataPosted);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, OrderProcessingBillEntity>> fetchOrderProcessingBill({
    required List<int> ids,
    required num invoiceAmount,
    required File invoiceImage,
    required String invoiceNumber,
    required DateTime invoiceDate,
  }) {
    return fetchDataBill(() =>
        orderProcessingRemoteDataSource.fetchOrderProcessingBill(
            ids, invoiceAmount, invoiceImage, invoiceNumber, invoiceDate));
  }
}
