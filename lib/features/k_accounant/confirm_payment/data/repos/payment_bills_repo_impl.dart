import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:test_order_life_cycle/core/errors/failure.dart';
import 'package:test_order_life_cycle/features/k_accounant/confirm_payment/data/data_source/payment_bills_data_source.dart';
import 'package:test_order_life_cycle/features/k_accounant/confirm_payment/domain/approve_invoice_entity.dart';
import 'package:test_order_life_cycle/features/k_accounant/confirm_payment/domain/choose_type_of_invoice_entity.dart';
import 'package:test_order_life_cycle/features/k_accounant/confirm_payment/domain/payment_bills_to_confirm_entity.dart';
import 'package:test_order_life_cycle/features/k_accounant/confirm_payment/domain/repo/payment_bills_repo.dart';

class PaymentBillsRepoImpl extends PaymentBillsRepo {
  final PaymentBillsDataSource paymentBillsRemoteDataSource;

  PaymentBillsRepoImpl(
    this.paymentBillsRemoteDataSource,
  );
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
  Future<Either<Failure, List<PaymentBillsToConfirmEntity>>>
      getPaymentBillsToConfirm() {
    return fetchData(
        () => paymentBillsRemoteDataSource.getPaymentBillsToConfirm());
  }

  @override
  Future<Either<Failure, ApproveInvoiceEntity>> approveInvoice(
      String invoiceId) {
    return postData(
        () => paymentBillsRemoteDataSource.approveInvoice(invoiceId));
  }

  @override
  Future<Either<Failure, ChooseTypeOfInvoiceEntity>> chooseTypeOfInvoice(
      int invoiceType, String invoiceId) {
 return postData(
        () => paymentBillsRemoteDataSource.chooseTypeOfInvoice(invoiceType, invoiceId));
  }
}
