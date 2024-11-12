import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_order_life_cycle/features/k_accounant/confirm_payment/ui/cubit/approve_Invoice_cubit/approve_invoice_cubit.dart';
import 'package:test_order_life_cycle/features/k_accounant/confirm_payment/ui/cubit/choose_type_of_invoice_cubit/choose_type_of_invoice_cubit.dart';
import 'package:test_order_life_cycle/features/k_accounant/confirm_payment/ui/cubit/get_payment_bill_cubit/get_payment_bill_cubit.dart';
import 'package:test_order_life_cycle/features/k_accounant/confirm_payment/ui/widget/list_view_confirm_payment.dart';

class KSABodyConfirmPaymentWidget extends StatelessWidget {
  const KSABodyConfirmPaymentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
      BlocListener<ApproveInvoiceCubit, ApproveInvoiceState>(
        listener: (context, state) {
        if (state is ApproveInvoiceSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invoice approved successfully')),
          );
        } else if (state is ApproveInvoiceFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:
              Text('Failed to approve invoice: ${state.errorMessage}')),
          );
        }
        },
      ),
      BlocListener<ChooseTypeOfInvoiceCubit, ChooseTypeOfInvoiceState>(
        listener: (context, state) {
        if (state is ChooseTypeOfInvoiceSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invoice type chosen successfully')),
          );
        } else if (state is ChooseTypeOfInvoiceFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:
              Text('Failed to choose invoice type: ${state.errorMessage}')),
          );
        }
        },
      ),
      ],
      child: BlocBuilder<GetPaymentBillCubit, GetPaymentBillState>(
        builder: (context, state) {
          if (state is GetPaymentBillLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetPaymentBillFailuer) {
            return Center(
              child: Text(state.errMessage),
            );
          } else if (state is GetPaymentBillSuccess) {
            return SizedBox(
              width: 330.w,
              height: 500.h,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: state.paymentBills.length,
                itemBuilder: (context, i) {
                  return KSAListViewConfirmPayment(
                    imageBond: state.paymentBills[i].paymentBillInvoiceImageUrl,
                    billNum: state.paymentBills[i].paymentBillInvoiceNumber,
                    storeName: state.paymentBills[i].paymentBillStoreName,
                    date: state.paymentBills[i].paymentBillInvoiceDate,
                    mandobName: state.paymentBills[i].paymentBillSalesmanName,
                    amountOrderItems: state
                        .paymentBills[i].paymentBillTotalAmountOfOrderDetails
                        .toDouble(),
                    orderNum: state.paymentBills[i].paymentBillOrderNumber,
                    amountBill: state
                        .paymentBills[i].paymentBillEntredInvoiceAmountFromStore
                        .toDouble(),
                    different: state.paymentBills[i]
                        .paymentBillDifferenceAmountBetweenTotalPriceOfOrderDetailsAndEntredInvoiceAmountFromStore
                        .toDouble(),
                    confrmOnPressed: () async {
                      context.read<ApproveInvoiceCubit>().approveInvoice(state
                          .paymentBills[i].paymentBillInvoiceId
                          .toString());
                    },
                    transOnPressed: () async{
                        context.read<ChooseTypeOfInvoiceCubit>().chooseTypeOfInvoice(1,state
                          .paymentBills[i].paymentBillInvoiceId
                          .toString());
                    },
                  );
                },
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
