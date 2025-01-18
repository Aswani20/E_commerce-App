import 'package:e_commerce_app/ui/auth/login/login_screen.dart';
import 'package:e_commerce_app/ui/auth/register/register_screen.dart';
import 'package:e_commerce_app/core/utils/app_theme.dart';
import 'package:e_commerce_app/features/UI/Pages/Cart_Screen/cart_screen.dart';
import 'package:e_commerce_app/features/UI/Pages/Home_screen/home_screen.dart';
import 'package:e_commerce_app/features/UI/Pages/Product_details_screen/product_details_screen.dart';
import 'package:e_commerce_app/core/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, index) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "E_Commerce App",
          initialRoute: LoginScreen.routeName,
          routes: {
            LoginScreen.routeName: (context) => LoginScreen(),
            RegisterScreen.routeName: (context) => RegisterScreen()
          },
        );
      },
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
