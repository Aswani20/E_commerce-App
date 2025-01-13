import 'package:e_commerce_app/ui/auth/login/login_screen.dart';
import 'package:e_commerce_app/utils/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_styles.dart';
import '../../../utils/assets_manager.dart';
import '../../../utils/custom_text_form_field.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = "register_screen";
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: 91.h, bottom: 10.h, left: 97.w, right: 97.w),
              child: Image.asset(
                AssetsManager.appBarLeading,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 40.h),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Full Name",
                            style: AppStyles.medium18White,
                          ),
                          CustomTextFormField(
                            keyboardType: TextInputType.name,
                            isObscureText: false,
                            hintText: "enter your full name",
                            hintStyle: AppStyles.light18lightBlack,
                            filledColor: AppColors.whiteColor,
                            controller: fullNameController,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'please enter your full name';
                              }
                              return null;
                            },
                          ),
                          Text(
                            "Mobile Number",
                            style: AppStyles.medium18White,
                          ),
                          CustomTextFormField(
                            keyboardType: TextInputType.phone,
                            isObscureText: false,
                            hintText: "enter your mobile number",
                            hintStyle: AppStyles.light18lightBlack,
                            filledColor: AppColors.whiteColor,
                            controller: phoneController,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'please enter your mobile number';
                              }
                              if(value.length < 11){
                                return 'Number Should be 11 number';
                              }

                              return null;
                            },
                          ),
                          Text(
                            "E-mail address",
                            style: AppStyles.medium18White,
                          ),
                          CustomTextFormField(
                            keyboardType: TextInputType.emailAddress,
                            isObscureText: false,
                            hintText: "enter your email address",
                            hintStyle: AppStyles.light18lightBlack,
                            filledColor: AppColors.whiteColor,
                            controller: mailController,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'please enter your email address';
                              }
                              bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value);
                              if (!emailValid) {
                                return 'invalid email';
                              }
                              return null;
                            },
                          ),
                          Text(
                            "Password",
                            style: AppStyles.medium18White,
                          ),
                          CustomTextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            isObscureText: true,
                            hintText: "enter your password",
                            hintStyle: AppStyles.light18lightBlack,
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
                          CustomElevatedButton(text: "Sign up", onPressed: (){register();}),
                          Padding(
                            padding: EdgeInsets.only(top: 30.h, bottom: 30.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  overflow: TextOverflow.ellipsis,
                                    'Already have an account? ',
                                    style: AppStyles.semi16white,
                                  maxLines: 1,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                                    setState(() {

                                    });
                                  },
                                  child: Text(
                                    overflow: TextOverflow.ellipsis,
                                      'login',
                                      style: AppStyles.semi16white,
                                      maxLines: 1,
                                  ),
                                )
                              ],
                            ),
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
    );
  }
  void register(){
    if(formKey.currentState!.validate()){
      print("register successfully");
    }
  }
}
