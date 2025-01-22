import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  String text;
  void Function()? onPressed;
  CustomElevatedButton(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 35.h),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15.r),
            ),
          ),
        ),
        child: SizedBox(
          height: 64.h,
          width: 398.w,
          child: Center(
            child: Text(text, style: AppStyles.semi20Primary),
          ),
        ),
      ),
    );
  }
}
