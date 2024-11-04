import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:test_order_life_cycle/core/errors/failure.dart';
import 'package:test_order_life_cycle/features/delivery/Receive_Parcels/data/data_source/remote/receive_parcels_remote_data_source.dart';
import 'package:test_order_life_cycle/features/delivery/Receive_Parcels/domain/entities/receive_parcels_entity.dart';
import 'package:test_order_life_cycle/features/delivery/Receive_Parcels/domain/repo/receive_parcels_repo.dart';

class ReceiveParcelsRepoImpl extends ReceiveParcelsRepo {
  final ReceiveParcelsRemoteDataSource receiveParcelsRemoteDataSource;

  ReceiveParcelsRepoImpl({
    required this.receiveParcelsRemoteDataSource,
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


  @override
  Future<Either<Failure, ReceiveParcelsEntity>> receiveParcels(
    int parcelId,
    int status,
  ) async {
    return postData(() => receiveParcelsRemoteDataSource.receiveParcels(
          parcelId,
          status,
        ));
  }
}
