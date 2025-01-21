import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTxt extends StatelessWidget {
  final Color? fontColor;
  final String text;
  final double? fontSize;

  final FontWeight? fontWeight;
  const CustomTxt(
      {this.fontWeight,
      this.fontSize,
      required this.text,
      this.fontColor,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textWidthBasis: TextWidthBasis.longestLine,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: fontColor ?? AppColors.primaryColor,
            fontWeight: fontWeight ?? FontWeight.w500,
            fontSize: fontSize ?? 18.sp,
          ),
    );
  }
}
