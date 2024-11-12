import 'package:test_order_life_cycle/features/k_accounant/confirm_payment/domain/choose_type_of_invoice_entity.dart';

class ChooseTypeOfInvoiceModel extends ChooseTypeOfInvoiceEntity{
	bool? success;
	String? message;

	ChooseTypeOfInvoiceModel({this.success, this.message}) : 
  super(
    isSuccess: success!, 
  serverMessage: message ?? ""
  );

	factory ChooseTypeOfInvoiceModel.fromJson(Map<String, dynamic> json) {
		return ChooseTypeOfInvoiceModel(
			success: json['success'] as bool?,
			message: json['message'] as String?,
		);
	}



	Map<String, dynamic> toJson() => {
				'success': success,
				'message': message,
			};
}
