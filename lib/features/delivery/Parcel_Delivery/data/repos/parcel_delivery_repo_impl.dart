import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:test_order_life_cycle/core/errors/failure.dart';
import 'package:test_order_life_cycle/features/delivery/Parcel_Delivery/data/data_source/remote/parcel_delivery_remote_data_source.dart';
import 'package:test_order_life_cycle/features/delivery/Parcel_Delivery/domain/entities/parcel_delivery_entity.dart';
import 'package:test_order_life_cycle/features/delivery/Parcel_Delivery/domain/repo/parcel_delivery_repo.dart';

class ParcelDeliveryRepoImpl extends ParcelDeliveryRepo {
  final ParcelDeliveryRemoteDataSource parcelDeliveryRemoteDataSource;

  ParcelDeliveryRepoImpl({
    required this.parcelDeliveryRemoteDataSource,
  });

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

// basic fetch list Entity function
  Future<Either<Failure, List<T>?>> fetchDataNullable<T>(
      Future<List<T>?> Function() fetchFunction) async {
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

// Generic PostData function
  Future<Either<Failure, T>> postData<T>(
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

  // @override
  // Future<Either<Failure, List<CustomerAddressEntity>?>> getAllCustomerAddress() async {
  //   return fetchDataNullable(() => shippingAddressRemoteDataSource.getAllCustomerAddress());
  // }

  @override
  Future<Either<Failure, ParcelDeliveryEntity>> parcelDelivery(
    int orderId,
    String receiptCode,
    int status,
  ) async {
    return postData(() => parcelDeliveryRemoteDataSource.parcelDelivery(
          orderId,
          receiptCode,
          status,
        ));
  }
}