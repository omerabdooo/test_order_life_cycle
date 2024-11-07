import 'package:test_order_life_cycle/features/y_accountant/confirm_payment/domin/entitnies/update_bound_state_entinty.dart';

class UpdateBoundStateModel extends UpdateBoundStateEntinty {
  bool? success;
  String? message;

  UpdateBoundStateModel({this.success, this.message})
      : super(isSuccess: success!, responMessage: message ?? '');

  factory UpdateBoundStateModel.fromJson(Map<String, dynamic> json) {
    return UpdateBoundStateModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
      };
}
