import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:test_order_life_cycle/core/errors/failure.dart';
import 'package:test_order_life_cycle/features/delivery/Receive_Parcels/domain/usecases/receive_parcels_use_case.dart';

part 'receive_parcels_state.dart';

class ReceiveParcelsCubit extends Cubit<ReceiveParcelsState> {
  final ReceiveParcelsUseCase receiveParcelsUseCase;
  ReceiveParcelsCubit(this.receiveParcelsUseCase)
      : super(ReceiveParcelsInitial());

  Future<void> receiveParcels(
    int parcelId,
    int status,
  ) async {
    emit(ReceiveParcelsLoading());

    try {
      var params = ReceiveParcelsParams(
        parcelId,
        status,
      );
      final result = await receiveParcelsUseCase.execute(params);

      result.fold(
          // left
          (failure) => emit(ReceiveParcelsFailure(failure.message)),
          // right
          (userData) {
        if (userData.serverMessage == "رقم الطلب غير صحيح") {
          emit(ReceiveParcelsFailure("رقم الطلب غير صحيح ..."));
        //   //
         } //else if(userData.serverMessage == "The customer already has an address") {
        //   emit(ReceiveParcelsFailure("لديك عنوان بالفعل "));
        // }
        // else {
        emit(ReceiveParcelsSuccess("تم استلام الطرد بنجاح"));
        // }
      });
    } catch (e) {
      if (e is DioException) {
        ServerFailure failure = ServerFailure.fromDioError(e);
        emit(ReceiveParcelsFailure(failure.message));
      } else {
        emit(ReceiveParcelsFailure(e.toString()));
      }
    }
  }
}
