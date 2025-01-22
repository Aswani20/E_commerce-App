import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/features/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserTab extends StatelessWidget {
  const UserTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(
              "Welcome, Mohamed",
              style: AppStyles.medium18Header,
            ),
            AutoSizeText(
              "mohamed.N@gmail.com",
              style: AppStyles.medium14LightPrimary,
            ),
            SizedBox(
              height: 40.h,
            ),
            AutoSizeText(
              "Your full name",
              style: AppStyles.medium18Header,
            ),
            CustomTextFormField(
              isPassword: false,
              keyboardType: TextInputType.name,
              controller: TextEditingController(text: "Mohamed Mohamed Nabil"),
              borderColor: AppColors.primary30Opacity,
              suffixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
              textStyle: AppStyles.medium14PrimaryDark,
            ),
            AutoSizeText(
              "Your E-mail",
              style: AppStyles.medium18Header,
            ),
            CustomTextFormField(
              isPassword: false,
              keyboardType: TextInputType.emailAddress,
              controller: TextEditingController(text: "mohamed.N@gmail.com"),
              borderColor: AppColors.primary30Opacity,
              suffixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
              textStyle: AppStyles.medium14PrimaryDark,
            ),
            AutoSizeText(
              "Your password",
              style: AppStyles.medium18Header,
            ),
            CustomTextFormField(
              isObscureText: true,
              isPassword: false,
              keyboardType: TextInputType.visiblePassword,
              controller: TextEditingController(text: "**********"),
              borderColor: AppColors.primary30Opacity,
              suffixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
              textStyle: AppStyles.medium14PrimaryDark,
            ),
            AutoSizeText(
              "Your mobile number",
              style: AppStyles.medium18Header,
            ),
            CustomTextFormField(
              isPassword: false,
              keyboardType: TextInputType.phone,
              controller: TextEditingController(text: "01122118855"),
              borderColor: AppColors.primary30Opacity,
              suffixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
              textStyle: AppStyles.medium14PrimaryDark,
            ),
            AutoSizeText(
              "Your Address",
              style: AppStyles.medium18Header,
            ),
            CustomTextFormField(
              isPassword: false,
              keyboardType: TextInputType.streetAddress,
              controller:
                  TextEditingController(text: "6th October, street 11....."),
              borderColor: AppColors.primary30Opacity,
              suffixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
              textStyle: AppStyles.medium14PrimaryDark,
            ),
          ],
        ),
      ),
    );
  }
}
