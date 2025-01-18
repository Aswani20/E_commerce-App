import 'package:e_commerce_app/core/utils/app_assets.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/features/ui/widgets/category_brand_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                AppAssets.routeLogo,
                height: 26.h,
                width: 66.w,
                fit: BoxFit.fill,
              ),
              SizedBox(
                height: 18.h,
              ),
              Row(
                children: [
                  Expanded(child: _buildSearchTextField()),
                  Badge(
                    alignment: AlignmentDirectional.topStart,
                    backgroundColor: AppColors.greenColor,
                    label: const Text("0"),
                    child: InkWell(
                      onTap: () {
                        //todo: navigate to cart screen
                      },
                      child: ImageIcon(
                        const AssetImage(AppAssets.shoppingCart),
                        size: 35.sp,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              _buildAnnouncement(images: [
                  AppAssets.announcement1,
                  AppAssets.announcement2,
                  AppAssets.announcement3,
                ],),
              SizedBox(height: 24.h,),
              _lineBreak(name: "Categories"),
              SizedBox(
                height: 200.h,
                width: double.infinity,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16.h,
                      crossAxisSpacing: 16.w),
                  itemCount: 15,
                  scrollDirection: Axis.horizontal,
                  physics: const ScrollPhysics(),
                  itemBuilder: (context, index) {
                    return const CategoryBrandItem();
                  },
                ),
              ),
              _lineBreak(name: "Brands"),
              SizedBox(
                height: 200.h,
                width: double.infinity,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16.h,
                      crossAxisSpacing: 16.w),
                  itemCount: 15,
                  scrollDirection: Axis.horizontal,
                  physics: const ScrollPhysics(),
                  itemBuilder: (context, index) {
                    return const CategoryBrandItem();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextField _buildSearchTextField() {
    return TextField(
        style: AppStyles.regular14Text,
        cursorColor: AppColors.primaryColor,
        onTap: () {},
        decoration: InputDecoration(
            border: _buildCustomBorder(),
            enabledBorder: _buildCustomBorder(),
            focusedBorder: _buildCustomBorder(),
            contentPadding: EdgeInsets.all(16.h),
            hintStyle: AppStyles.light14SearchHint,
            hintText: "what do you search for?",
            prefixIcon: Icon(
              Icons.search,
              size: 32.sp,
              color: AppColors.primaryColor.withOpacity(0.75),
            )));
  }

  OutlineInputBorder _buildCustomBorder() {
    return OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.primaryColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(50.r));
  }

  ImageSlideshow _buildAnnouncement({
    required List<String> images,
  }) {
    return ImageSlideshow(
        indicatorColor: AppColors.primaryColor,
        initialPage: 0,
        indicatorBottomPadding: 15.h,
        indicatorPadding: 8.w,
        indicatorRadius: 5,
        indicatorBackgroundColor: AppColors.whiteColor,
        isLoop: true,
        autoPlayInterval: 3000,
        height: 190.h,
        children: images.map((url) {
          return Image.asset(
            url,
            fit: BoxFit.fill,
          );
        }).toList());
  }

  Widget _lineBreak({required String name}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name, style: AppStyles.medium18Header),
        TextButton(
          onPressed: () {
            //todo: navigate to all
          },
          child: Text("View All", style: AppStyles.regular12Text),
        )
      ],
    );
  }
}
