import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:test_order_life_cycle/features/y_accountant/confirm_payment/ui/manager/cubit/get_bound_cubit.dart';
import 'package:test_order_life_cycle/features/y_accountant/confirm_payment/ui/widget/list_view_confirm_payment.dart';

class BodyConfirmPaymentWidget extends StatelessWidget {
  const BodyConfirmPaymentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetBoundCubit, GetBoundState>(
      builder: (context, state) {
        if(state is GetBoundLodingCubit){
          return(const Center(child: CircularProgressIndicator(),));
        }
        else if(state is GetBoundFailureCubit){
          return Center(child: Text(state.errorMessage),);
        }
        else if(state is GetBoundSuccessCubit){
        
        return SizedBox(
          width: 330.w,
          height: 450.h,
          child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: state.boundEntitny.length,
              itemBuilder: (context, i) {
                return  ListViewConfirmPayment(
                  idBond: state.boundEntitny[i].boundId.toString(),
                  bankName: state.boundEntitny[i].banKName,
                  customerName: state.boundEntitny[i].clintName,
                  amountBond: state.boundEntitny[i].boundValue.toString(),
                  numBond: state.boundEntitny[i].boundNumber.toString(),
                  date:DateFormat('yyyy/MM/dd').format(state.boundEntitny[i].date,
                 
                  ), image: state.boundEntitny[i].image??'',
                );
              }),
        );
        }
        else{
          return Container();
        }
      },
    );
  }
}
