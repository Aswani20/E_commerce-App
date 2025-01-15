import 'package:e_commerce_app/core/utils/app_theme.dart';
import 'package:e_commerce_app/features/UI/Pages/Cart_Screen/cart_screen.dart';
import 'package:e_commerce_app/features/UI/Pages/Home_screen/home_screen.dart';
import 'package:e_commerce_app/features/UI/Pages/Product_details_screen/product_details_screen.dart';
import 'package:e_commerce_app/core/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.homeRoute,
          routes: {
            AppRoutes.homeRoute: (context) => const HomeScr(),
            AppRoutes.cartRoute: (context) => const CartScr(),
            AppRoutes.productRoute: (context) => const ProductDetilsScr(),
          },
          theme: AppTheme.lightTheme,
        );
      },
    );
  }
}
