import 'package:e_commerce_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  Color filledColor;
  Color borderColor ;
  TextStyle hintStyle;
  String hintText;
  Widget? label;
  TextStyle? labelStyle;
  Widget? prefixIcon;
  Widget? suffixIcon;
  TextEditingController controller;
  String? Function(String?) validator;
  TextInputType keyboardType;
  bool isObscureText;


  CustomTextFormField(
      {super.key,
        required this.controller,
        required this.validator,
        required this.isObscureText,
        required this.hintText,
        required this.hintStyle,
        this.label,
        this.labelStyle,
        this.prefixIcon,
        this.suffixIcon,
        this.filledColor = AppColors.whiteColor,
        this.keyboardType = TextInputType.text,
        this.borderColor = AppColors.whiteColor,
        });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.h, bottom: 20.h),
      child: TextFormField(
        obscureText: isObscureText,
        keyboardType: keyboardType,
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          filled: true,
          fillColor: filledColor,
          hintText: hintText,
          hintStyle: hintStyle,
          label: label,
          labelStyle: labelStyle,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: borderColor, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: borderColor, width: 1),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: AppColors.redColor)
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
             borderSide: const BorderSide(color: AppColors.redColor)
          ),
        ),
      ),
    );
  }
}
