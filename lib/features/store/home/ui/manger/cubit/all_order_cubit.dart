// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:test_order_life_cycle/features/store/home/domain/usecases/all_order_usecase.dart';
import 'package:test_order_life_cycle/features/store/home/ui/manger/cubit/all_order_state.dart';

class AllOrderCubit extends Cubit<AllOrderState> {
  AllOrderCubit(this.allOrderUseCase)
      : super(
          AllOrderInitial(),
        );
  final AllOrderUsecase allOrderUseCase;
  Future<void> fetchAllOrder(
    int pageNumber,
    int pageSize,
    String storeId,
    int srearchKeyword,
    bool isUrgen,
  ) async {
    emit(
      AllOrderLoading(),
    );
    var result = await allOrderUseCase.execute(AllOrderParam(
      pageNumber,
      pageSize,
      storeId,
      srearchKeyword,
      isUrgen,
    ));

    result.fold((failuer) {
      emit(
        AllOrderFailuer(errMessage: failuer.message),
      );
    }, (orders) {
      emit(
        AllOrderSuccess(orders: orders),
      );
    });
  }
}
