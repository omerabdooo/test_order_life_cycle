import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:test_order_life_cycle/core/setup_service_locator.dart';
import 'package:test_order_life_cycle/core/styles/text_style.dart';
import 'package:test_order_life_cycle/core/utils/route.dart';
import 'package:test_order_life_cycle/core/widgets/custom_primary_button_widget.dart';
import 'package:test_order_life_cycle/features/auth_feature/data/repo/auth_repo_impl.dart';
import 'package:test_order_life_cycle/features/auth_feature/domain/usecase/sign_in_use_case.dart';
import 'package:test_order_life_cycle/features/auth_feature/ui/manger/sgin_in_cubit/sgin_in_cubit_cubit.dart';
import 'package:test_order_life_cycle/features/auth_feature/ui/widgets/auth_text_Field_widget.dart';
import 'package:test_order_life_cycle/features/delivery/Home_Delivery/ui/screen/HomeDelivery.dart';
import 'package:test_order_life_cycle/features/k_accounant/confirm_payment/ui/screen/confirm_payment.dart';
import 'package:test_order_life_cycle/features/auth_feature/ui/widgets/const_padding_widget.dart';
import 'package:test_order_life_cycle/features/auth_feature/ui/widgets/custom_form.dart';
import 'package:test_order_life_cycle/features/store/home/ui/screen/store_home_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Controllers
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
          child: BlocProvider(
        create: (context) =>
            SignInCubitCubit(SignInUseCase(getit.get<AuthRepoImpl>())),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 100.0.h, horizontal: 16.0.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 6.0.w),
                  child: Text(
                    'تسجيل الدخول',
                    style: KTextStyle.primaryTitle,
                  ),
                ),
              ),
              SizedBox(height: 50.0.h),
              CustomTextFieldWidget(
                labelText: "رقم الجوال :",
                textInputType: TextInputType.phone,
                controller: phoneNumberController,
              ),
              // SizedBox(height: 16.0.h),
              CustomTextFieldWidget(
                labelText: "كلمة المرور :",
                textInputType: TextInputType.visiblePassword,
                controller: passwordController,
              ),
              SizedBox(height: 20.0.h),
              ConstPaddingWidget(
                child: BlocConsumer<SignInCubitCubit, SignInCubitState>(
                  listener: (context, state) {
                    if (state is SignInCubitFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.errorMessage.toString())),
                      );
                      print(state.errorMessage);
                    } else if (state is SignInCubitSuccess) {
                      if (state.user.userRoles[0] == 'Accountant') {
                        context.go(AppRouter.storeRouters.kStoreHome);
                      } else if (state.user.userRoles[0] == 'Store') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const StoreHomePage()));
                        phoneNumberController.clear();
                        passwordController.clear();
                      }
                    }
                  },
                  builder: (context, state) {
                    return KCustomPrimaryButtonWidget(
                      buttonName: "تسجيل الدخول",
                      width: (media - 70).w,
                      height: 40.0.h,
                      onPressed: () async {
                        await context.read<SignInCubitCubit>().signIn(
                              phoneNumberController.text,
                              passwordController.text,
                            );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
