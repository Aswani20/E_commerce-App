import 'package:e_commerce_app/ui/auth/login/login_screen.dart';
import 'package:e_commerce_app/ui/auth/register/register_screen.dart';
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
    );
  }
}
