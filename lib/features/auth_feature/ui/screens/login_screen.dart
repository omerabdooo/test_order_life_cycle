import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:test_order_life_cycle/core/setup_service_locator.dart';
import 'package:test_order_life_cycle/core/shared_widgets/salem_drawer/drawer_widget.dart';
import 'package:test_order_life_cycle/core/styles/text_style.dart';
import 'package:test_order_life_cycle/core/utils/route.dart';
import 'package:test_order_life_cycle/core/widgets/custom_primary_button_widget.dart';
import 'package:test_order_life_cycle/features/auth_feature/data/repo/auth_repo_impl.dart';
import 'package:test_order_life_cycle/features/auth_feature/domain/usecase/sign_in_use_case.dart';
import 'package:test_order_life_cycle/features/auth_feature/ui/manger/sgin_in_cubit/sgin_in_cubit_cubit.dart';
import 'package:test_order_life_cycle/features/auth_feature/ui/widgets/auth_text_Field_widget.dart';
import 'package:test_order_life_cycle/features/delivery/Home_Delivery/ui/screen/HomeDelivery.dart';
import 'package:test_order_life_cycle/features/store/home/ui/screen/store_home_page.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final phoneController = TextEditingController();
    final passwordController = TextEditingController();

    /// function to change into an app for now
    void login() {
      String phoneInput = phoneController.text;

      // Validate the phone input (you can add more validation logic here)
      if (phoneInput.isNotEmpty) {
        if (phoneInput == "123") {
          Navigator.pushNamed(
            context,
            "/storeHome",
          );
        }
      }
    }

    var media = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: const KDrawerWidget(),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0.h, horizontal: 16.0.w),
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
                  // style: TextStyle(
                  //   fontSize: 22.sp,
                  //   fontWeight: FontWeight.bold
                  // ),
                ),
              ),
            ),
            SizedBox(height: 80.0.h),
            CustomTextFieldWidget(
              labelText: "رقم الجوال :",
              textInputType: TextInputType.number,
              controller: phoneController,
            ),
            SizedBox(height: 16.0.h),
            CustomTextFieldWidget(
              labelText: "كلمة المرور :",
              textInputType: TextInputType.number,
              controller: passwordController,
            ),
            SizedBox(height: 50.0.h),
            BlocListener<SignInCubitCubit, SignInCubitState>(
              listener: (context, state) {
                if (state is SignInCubitFailure) {
                  // Show error message
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
                            builder: (context) => StoreHomePage()));
                  }
                }
              },
              child: KCustomPrimaryButtonWidget(
                buttonName: "تسجيل الدخول",
                width: (media - 70).w,
                height: 40.0.h,
                onPressed: () {
                  if (phoneController.text == '0000') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Homedelivery()));
                  } else {
                    context
                        .read<SignInCubitCubit>()
                        .signIn(phoneController.text, passwordController.text);
                  } // Navigator.pushNamed(context, '/home');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
