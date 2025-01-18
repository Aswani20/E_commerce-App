import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce_app/core/utils/app_assets.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_routes.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/core/utils/custom_elevated_button.dart';
import 'package:e_commerce_app/core/utils/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        key: formKey,
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
                              controller: userNameController,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'please enter your user name';
                                }
                                bool userNameValid = RegExp(
                                    r"^[A-Za-z][A-Za-z0-9_]{5,29}$")
                                    .hasMatch(value);
                                if (!userNameValid) {
                                  return 'Invalid ex: Julia Or Laasya_Setty';
                                }
                                return null;
                              },
                            ),
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
                              controller: passwordController,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'please enter password';
                                }
                                if (value.trim().length < 6 ||
                                    value.trim().length > 30) {
                                  return 'password should be >6 & <30';
                                }
                                return null;
                              },
                              suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.visibility_off)),
                            ),
                            InkWell(
                              onTap: (){},
                              child: Text(
                              'Forgot Password',
                              style: AppStyles.regular18White,
                              textAlign: TextAlign.end,
                            ),),
                            CustomElevatedButton(text: "Login", onPressed: (){login();}),
                            Padding(
                              padding: EdgeInsets.only(top: 30.h),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacementNamed(context, AppRoutes.registerRoute);
                                  setState(() {
                                  },);
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
                              )

                            )
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
    );
  }

  void login(){
    if(formKey.currentState!.validate()){
      Navigator.pushReplacementNamed(context, AppRoutes.homeRoute);
      print("login Successfully");
    }
  }
}