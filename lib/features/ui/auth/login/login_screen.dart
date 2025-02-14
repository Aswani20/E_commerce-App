import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce_app/core/utils/app_assets.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_routes.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/core/utils/dialog_utils.dart';
import 'package:e_commerce_app/di/di.dart';
import 'package:e_commerce_app/features/ui/auth/login/cubit/login_states.dart';
import 'package:e_commerce_app/features/ui/auth/login/login_view_model.dart';
import 'package:e_commerce_app/features/ui/pages/home_screen/home_screen.dart';
import 'package:e_commerce_app/features/ui/widgets/custom_elevated_button.dart';
import 'package:e_commerce_app/features/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_commerce_app/core/utils/validators.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginViewModel loginViewModel = getIt<LoginViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginViewModel, LoginStates>(
      bloc: loginViewModel,
      listener: (context, state) {
        if (state is LoginLoadingState) {
          DialogUtils.showLoading(message: "Loading.....", context: context);
        } else if (state is LoginFailureState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              posActionName: "Ok",
              title: "Error",
              message: state.error.errorMsg,
              context: context);
        } else if (state is LoginSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              message: "Login Successfully",
              context: context,
              posActionName: "Ok",
              posAction: () {
                Navigator.of(context).pushReplacementNamed(AppRoutes.homeRoute);
              },
              title: "Success");
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: 91.h, bottom: 87.h, left: 97.w, right: 97.w),
                  child: Image.asset(
                    AppAssets.appBarLeading,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      AutoSizeText(
                        'Welcome Back To Route',
                        style: AppStyles.semi24White,
                        maxLines: 1,
                      ),
                      AutoSizeText(
                        'Please sign in with your mail',
                        style: AppStyles.light16White,
                        maxLines: 1,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 40.h),
                        child: Form(
                          key: loginViewModel.formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                "User Name",
                                style: AppStyles.medium18White,
                              ),
                              CustomTextFormField(
                                  isPassword: false,
                                  keyboardType: TextInputType.text,
                                  isObscureText: false,
                                  hintText: "enter your name",
                                  hintStyle: AppStyles.light18HintText,
                                  filledColor: AppColors.whiteColor,
                                  controller: loginViewModel.userNameController,
                                  validator: AppValidators.validateEmail),
                              Text(
                                "Password",
                                style: AppStyles.medium18White,
                              ),
                              CustomTextFormField(
                                isPassword: true,
                                keyboardType: TextInputType.visiblePassword,
                                isObscureText: true,
                                hintText: "enter your password",
                                hintStyle: AppStyles.light18HintText,
                                filledColor: AppColors.whiteColor,
                                controller: loginViewModel.passwordController,
                                validator: AppValidators.validatePassword,
                                suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.visibility_off)),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Text(
                                  'Forgot Password',
                                  style: AppStyles.regular18White,
                                  textAlign: TextAlign.end,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 35.h),
                                child: CustomElevatedButton(
                                    backgroundColor: AppColors.whiteColor,
                                    textStyle: AppStyles.semi20Primary,
                                    text: "Login",
                                    onPressed: () {
                                      loginViewModel.login();
                                    }),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(top: 30.h),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pushReplacementNamed(
                                          context, AppRoutes.registerRoute);
                                    },
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Don’t have an account? Create Account',
                                            style: AppStyles.medium18White,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
