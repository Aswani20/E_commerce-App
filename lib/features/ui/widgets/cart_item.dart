import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/custom_txt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItem extends StatefulWidget {
  const CartItem({super.key});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int itemCount = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      child: Container(
        height: 145.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            18.r,
          ),
          border: Border.all(color: AppColors.primary30Opacity, width: 1),
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: AppColors.primary30Opacity, width: 1),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: CachedNetworkImage(
                  width: 130.w,
                  height: 145.h,
                  fit: BoxFit.cover,
                  imageUrl:
                      "https://www.nike.sa/dw/image/v2/BDVB_PRD/on/demandware.static/-/Sites-akeneo-master-catalog/default/dw42ccc9ea/nk/a9b/7/6/4/b/1/a9b764b1_834c_413e_aec2_f460112b2de6.jpg?sw=2000&sh=2000&sm=fit",
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.yellowColor,
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                    color: AppColors.redColor,
                  ),
                ),
              ),
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomTxt(text: "NIKE AIR JORDAN"),
                      InkWell(
                        onTap: () {
                          //    todo delete item from cart
                        },
                        child: Icon(
                          CupertinoIcons.delete,
                          color: AppColors.primaryColor,
                          size: 25.sp,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.blackColor,
                        radius: 10.r,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      CustomTxt(
                        text: "black|size 40",
                        fontColor: AppColors.blackColor.withValues(alpha: 0.4),
                        fontSize: 14.sp,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomTxt(
                        text: "Egp 3,500",
                        fontWeight: FontWeight.bold,
                      ),
                      Container(
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                                onPressed: () {
                                  //   todo decrease count by one
                                  if (itemCount != 1) {
                                    itemCount--;
                                    setState(() {});
                                  }
                                },
                                icon: Icon(
                                  Icons.remove_circle_outline_rounded,
                                  color: AppColors.whiteColor,
                                  size: 25.sp,
                                )),
                            CustomTxt(
                                text: "$itemCount",
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                fontColor: AppColors.whiteColor),
                            IconButton(
                                onPressed: () {
                                  //   todo increase count by one
                                  itemCount++;
                                  setState(() {});
                                },
                                icon: Icon(Icons.add_circle_outline_rounded,
                                    color: AppColors.whiteColor, size: 25.sp))
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
