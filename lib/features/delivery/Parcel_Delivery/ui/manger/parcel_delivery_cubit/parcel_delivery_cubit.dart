import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:test_order_life_cycle/core/errors/failure.dart';
import 'package:test_order_life_cycle/features/delivery/Parcel_Delivery/domain/usecases/parcel_delivery_use_case.dart';

part 'parcel_delivery_state.dart';

class ParcelDeliveryCubit extends Cubit<ParcelDeliveryState> {
  final ParcelDeliveryUseCase parcelDeliveryUseCase;
  ParcelDeliveryCubit(this.parcelDeliveryUseCase)
      : super(ParcelDeliveryInitial());

  Future<void> parcelDelivery(
    int orderId,
    String receiptCode,
    int status,
  ) async {
    emit(ParcelDeliveryLoading());

    try {
      var params = ParcelDeliveryParams(
          orderId, 
          receiptCode,
          status,
          );
      final result = await parcelDeliveryUseCase.execute(params);

      result.fold(
          // left
          (failure) => emit(ParcelDeliveryFailure(failure.message)),
          // right
          (userData) {
         if (userData.serverMessage == " رقم الطلب غير صحيح أو ان الطلب غير جاهز للتسليم") {
           emit(ParcelDeliveryFailure("رقم الطلب غير صحيح أو ان الطلب غير جاهز للتسليم..."));
        //   //
         } //else if(userData.serverMessage == "The customer already has an address") {
        //   emit(ParcelDeliveryFailure("لديك عنوان بالفعل "));
        // }        
         else {
          emit(ParcelDeliverySuccess("تم استلام الطرد بنجاح"));
         }
      });
    } catch (e) {
      if (e is DioException) {
        ServerFailure failure = ServerFailure.fromDioError(e);
        emit(ParcelDeliveryFailure(failure.message));
      } else {
        emit(ParcelDeliveryFailure(e.toString()));
      }
    }
  }
}
