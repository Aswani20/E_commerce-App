import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/utils/app_assets.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItem extends StatefulWidget {
  bool isClicked = false;
  String heartIcon = AppAssets.selectedFavouriteIcon;
  ProductItem({super.key});

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: 'https://assets.adidas.com/images/w_1880,f_auto,q_auto/6776024790f445b0873ee66fdcde54a1_9366/GX6544_HM3_hover.jpg',
      imageBuilder: (context, image) => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        height: 300.h,
        decoration: BoxDecoration(
          image: DecorationImage(image: image, fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(15.r),
        ),
        alignment: Alignment.topRight,
        child: InkWell(
          // radius: 25,
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          onTap: () {
            setState(() {
              widget.isClicked = !widget.isClicked;
              widget.heartIcon = !widget.isClicked
                  ? AppAssets.selectedFavouriteIcon
                  : AppAssets.selectedAddToFavouriteIcon;
            });
          },
          child: Material(
            // borderRadius: BorderRadius.circular(2),
            color: AppColors.whiteColor,
            elevation: 5,
            shape: const StadiumBorder(),
            shadowColor: AppColors.blackColor,
            child: Padding(
                padding: const EdgeInsets.all(6),
                child: ImageIcon(
                  AssetImage(widget.heartIcon),
                  color: AppColors.primaryColor,
                )),
          ),
        ),
        ),
      );
  }
}
