import 'package:e_commerce_app/core/utils/app_assets.dart';
import 'package:e_commerce_app/features/ui/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsTab extends StatelessWidget {
  // @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2 / 2.4,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 16.h),
          itemCount: 10,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                //todo: navigate to product details screen
              },
              child: const ProductItem(),
            );
          },
        ))
      ],
    ));
  }
}
